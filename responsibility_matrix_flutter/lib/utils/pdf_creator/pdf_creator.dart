import 'dart:math';

import 'package:flutter/material.dart';
import '../../models/answer/answer_model.dart';

import '../../models/questionnaire/questionnaire_model.dart';
import '../../repositories/concrete/questions_repository.dart';
import '../instance_controller/instance_controller.dart';
import '../../utils/list_extensions/list_extensions.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfCreator {
  static final QuestionsRepository _questionsRepository =
      InstanceController()[QuestionsRepository];

  static void createPdfFromQuestionnaire(
      QuestionnaireModel questionnaireModel) async {
    final answerList = questionnaireModel.ClosedQuestions.map(
      (e) => e,
    ).toList();
    answerList.sort((a, b) => a.position.compareTo(b.position));

    final Map<Scope, PdfColor> _scopeColors = {
      Scope.impact: PdfColors.yellow,
      Scope.process: PdfColors.grey,
      Scope.objects: PdfColors.orange,
      Scope.actors: PdfColors.blue,
    };

    final Map<Scope, Map<Component, double>> counter = {
      for (final scope in Scope.values)
        scope: {
          for (final component in Component.values) component: 0,
        },
    };

    for (final scope in Scope.values) {
      for (final component in Component.values) {
        int applicable = 0;
        int total = 0;
        _questionsRepository.matrixQuestions[scope]![component]!
            .forEach((question) {
          if (answerList
              .any((element) => element.position == question.position)) {
            if (answerList
                    .firstWhere(
                        (element) => element.position == question.position)
                    .status ==
                AnswerStatus.notApplicable.name) {
              applicable++;
            }
          } else
            applicable++;
          total++;
        });
        // calculate percentage
        counter[scope]![component] = applicable / total * 100;
      }
    }
    final pdf = pw.Document();
    final multipage = pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      header: (context) {
        return pw.Row(children: [
          pw.Header(
              level: 0,
              child: pw.Text(
                'Maastricht University - Responsibility Matrix',
                style: pw.TextStyle(
                  fontSize: 15,
                  fontWeight: pw.FontWeight.bold,
                ),
              )),
        ]);
      },
      build: (context) {
        return [
          pw.Header(
              child: pw.Text(
            questionnaireModel.title,
            style: pw.TextStyle(
              fontSize: 15,
              fontWeight: pw.FontWeight.bold,
            ),
          )),
          pw.Header(
              level: 2,
              child: pw.Text(
                questionnaireModel.description,
                style: pw.TextStyle(
                  fontSize: 15,
                  fontWeight: pw.FontWeight.bold,
                ),
              )),
          pw.SizedBox(height: 10),
          pw.Divider(),
          pw.Header(
              child: pw.Text(
            'Analysis',
            style: pw.TextStyle(
              fontSize: 15,
              fontWeight: pw.FontWeight.bold,
            ),
          )),
          pw.SizedBox(height: 10),
          pw.Chart(
            title: pw.Text('Responsibility Awareness and Achievement'),
            left: pw.Container(
              alignment: pw.Alignment.topCenter,
              margin: const pw.EdgeInsets.only(right: 5, top: 10),
              child: pw.Transform.rotateBox(
                angle: pi / 2,
                child: pw.Text('Component'),
              ),
            ),
            grid: pw.CartesianGrid(
                yAxis: pw.FixedAxis.fromStrings(
                    Component.values.map((e) => e.name).toList(),
                    marginEnd: 30,
                    marginStart: 30),
                xAxis: pw.FixedAxis(
                  List<int>.generate(11, (index) => ((index) * 10)),
                  format: (value) => '$value%',
                  divisions: true,
                )),
            bottom: pw.ChartLegend(
              direction: pw.Axis.horizontal,
              decoration: pw.BoxDecoration(
                color: PdfColors.white,
                border: pw.Border.all(
                  width: .5,
                ),
              ),
            ),
            datasets: List<pw.BarDataSet>.generate(
                Scope.values.length,
                (scopeIndex) => pw.BarDataSet(
                      axis: pw.Axis.vertical,
                      legend: Scope.values[scopeIndex].name,
                      offset: -15 + scopeIndex * 10,
                      color: _scopeColors[Scope.values[scopeIndex]]!,
                      data: List.generate(
                          Component.values.length,
                          (componentIndex) => pw.PointChartValue(
                              counter[Scope.values[scopeIndex]]![
                                  Component.values[componentIndex]]!,
                              componentIndex.toDouble())),
                    )),
          ),
          pw.SizedBox(height: 10),
          pw.Divider(),
          pw.Header(
              child: pw.Text(
            'Responsibility Awareness and Achievement table',
            style: pw.TextStyle(
              fontSize: 15,
              fontWeight: pw.FontWeight.bold,
            ),
          )),
          pw.Table(border: pw.TableBorder.all(), children: [
            pw.TableRow(
              children: [
                pw.SizedBox(),
                ...Scope.values.map((scope) => pw.Container(
                      color: PdfColors.grey,
                      alignment: pw.Alignment.center,
                      child: pw.Text(scope.name),
                    )),
              ],
            ),
            ...Component.values
                .map((e) => pw.TableRow(
                      children: [
                        pw.Text(e.name),
                        ...Scope.values.map((scope) {
                          final double value = counter[scope]![e]!;
                          final double colorValue = value / 100;

                          final PdfColor color = colorValue < .5
                              ? PdfColor.fromInt(Color.lerp(Colors.red,
                                      Colors.orange, colorValue * 2)!
                                  .value)
                              : PdfColor.fromInt(Color.lerp(Colors.orange,
                                      Colors.green, (colorValue - .5) * 2)!
                                  .value);
                          return pw.Container(
                            alignment: pw.Alignment.center,
                            color: color,
                            child: pw.Text('${value.toStringAsFixed(1)}%'),
                          );
                        }),
                      ],
                    ))
                .toList()
          ]),
          pw.Divider(),
        ];
      },
    );
    pdf.addPage(multipage);
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      header: (context) {
        return pw.Row(children: [
          pw.Header(
              level: 0,
              child: pw.Text(
                'Maastricht University - Responsibility Matrix',
                style: pw.TextStyle(
                  fontSize: 15,
                  fontWeight: pw.FontWeight.bold,
                ),
              )),
        ]);
      },
      build: (context) => answerList
          .where((element) => element.status != AnswerStatus.notApplicable.name)
          .map<pw.Widget>((e) => pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Question No: ${e.position}'),
                    pw.Row(children: [
                      pw.Text('Scope: ${e.scope}'),
                      pw.SizedBox(width: 10),
                      pw.Text('Component: ${e.component}')
                    ]),
                    pw.Bullet(
                        text: _questionsRepository
                            .getQuestionByPosition(e.position)
                            .question,
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10),
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(left: 25),
                      child: pw.Text('Answer: ${e.answer}',
                          style: const pw.TextStyle(
                            fontSize: 13,
                          )),
                    ),
                    pw.Divider(),
                  ]))
          .toList(),
    ));

    Printing.sharePdf(
      filename: '${questionnaireModel.title}.pdf',
      bytes: await pdf.save(),
    );
  }
}
