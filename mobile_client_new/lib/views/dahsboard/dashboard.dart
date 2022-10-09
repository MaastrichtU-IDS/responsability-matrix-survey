import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/consts/matrix_explanation.dart';
import 'package:mobile_client_new/repositories/questions_repository.dart';
import 'package:mobile_client_new/style/style_provider.dart';
import 'package:mobile_client_new/views/dahsboard/widgets/dashboard_table_cell.dart';
import 'package:mobile_client_new/views/dahsboard/widgets/dashboard_table_header_cell.dart';
import 'package:mobile_client_new/views/question/question_page.dart';
import 'package:mobile_client_new/views/root/root.dart';
import 'package:mobile_client_new/widgets/info_widget.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  static const String routeName = 'dashboard';

  final rowHeight = 150.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Table(
              defaultColumnWidth: const FixedColumnWidth(175),
              defaultVerticalAlignment: TableCellVerticalAlignment.top,
              border: TableBorder.all(
                  color: StyleProvider.of(context).colors.appPrimaryColor,
                  style: BorderStyle.solid),
              children: [
                TableRow(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    for (final scope in scopeExp.keys)
                      DashboardTableHeaderCell(
                        height: 90,
                        scope: scope,
                      ),
                  ],
                ),
                for (final comp in componentExp.keys)
                  TableRow(children: [
                    DashboardTableHeaderCell(
                      height: rowHeight,
                      component: comp,
                    ),
                    for (final scope in scopeExp.keys)
                      DashboardTableCell(
                        scope: scope,
                        component: comp,
                        height: rowHeight,
                      ),
                  ])
              ],
            ),
            const Divider(),
            const InfoWidget(
                text: 'Click on a cell to see questions related to it'),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
