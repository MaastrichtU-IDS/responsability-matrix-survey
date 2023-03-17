import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/providers.dart';
import '../../consts/matrix_explanation.dart';
import '../../repositories/concrete/questions_repository.dart';
import '../../widgets/info_widget.dart';
part './widgets/dashboard_table_cell.dart';
part './widgets/dashboard_table_header_cell.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  final rowHeight = 150.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                primary: true,
                child: Column(
                  children: [
                    Table(
                      defaultColumnWidth: const FixedColumnWidth(175),
                      border: TableBorder.all(
                        color: Theme.of(context).dividerColor,
                      ),
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
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          InfoWidget(text: 'info_dashboard'.tr()),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
