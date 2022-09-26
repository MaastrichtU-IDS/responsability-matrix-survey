import 'package:mobile_client_new/models/questionnaire/questionnaire_model.dart';
import 'package:mobile_client_new/repositories/questions_repository.dart';
import 'package:mobile_client_new/utils/instance_controller/instance_controller.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfCreator {
  static final QuestionsRepository _questionsRepository =
      InstanceController()[QuestionsRepository];
  static void createPdfFromQuestionairee(
      QuestionnaireModel questionnaireModel) async {
    final pdf = pw.Document();
    final multipage = pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      header: (context) {
        return pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
          pw.Header(
              level: 0,
              child: pw.Text(
                "Maastricht University - Responsibility Matrix",
                style: pw.TextStyle(
                  fontSize: 15,
                  fontWeight: pw.FontWeight.bold,
                ),
              )),
        ]);
      },
      build: (context) {
        final answerList = questionnaireModel.ClosedQuestions.map(
          (e) => e,
        ).toList();
        answerList.sort((a, b) => a.position.compareTo(b.position));
        return answerList
            .map<pw.Widget>((e) => pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Question No: ${e.position}"),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Text("Scope: ${e.scope}"),
                            pw.SizedBox(width: 10),
                            pw.Text("Component: ${e.component}")
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
                        child: pw.Text("Answer: ${e.answer}",
                            style: const pw.TextStyle(
                              fontSize: 13,
                            )),
                      ),
                      pw.Divider(),
                    ]))
            .toList();
      },
    );
    pdf.addPage(multipage);

    Printing.sharePdf(
      bytes: await pdf.save(),
    );
  }
}
