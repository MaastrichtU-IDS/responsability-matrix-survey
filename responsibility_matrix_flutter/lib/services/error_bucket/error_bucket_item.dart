class ErrorBucketItem<T> {
  final Type from;
  final T error;
  ErrorBucketItem({required this.from, required this.error});

  @override
  String toString() {
    return 'ErrorBucketItem{from: $from, error: $error}';
  }
}
