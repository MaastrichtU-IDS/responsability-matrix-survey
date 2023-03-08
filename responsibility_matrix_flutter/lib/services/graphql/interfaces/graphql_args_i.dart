abstract class GraphQlArgsI {
  final String queryName;

  const GraphQlArgsI({
    required this.queryName,
  });

  Map<String, dynamic> createQueryArgs();
}
