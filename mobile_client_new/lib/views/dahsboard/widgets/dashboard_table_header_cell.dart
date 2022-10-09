import 'package:flutter/material.dart';
import '../../../consts/matrix_explanation.dart';
import '../../../repositories/questions_repository.dart';

class DashboardTableHeaderCell extends StatelessWidget {
  const DashboardTableHeaderCell(
      {super.key, required this.height, this.scope, this.component})
      : assert((scope != null || component != null),
            'Either scope or component must be provided');

  final Scope? scope;
  final Component? component;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: scope != null ? scopeColors[scope!] : componentColors[component!],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                scope?.name ?? component!.name,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Text(
                scope != null ? scopeExp[scope!]! : componentExp[component!]!,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
