class RepositoryErrorModel {
  final Type from;
  final String message;

  RepositoryErrorModel(this.from, this.message);

  @override
  String toString() {
    return 'RepositoryErrorModel{from: $from, message: $message}';
  }
}
