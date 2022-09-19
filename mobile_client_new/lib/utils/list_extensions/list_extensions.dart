extension ListExtensions on List {
  T? firstWhereOrNull<T>(bool Function(T element) test) {
    try {
      return firstWhere((element) => test(element),) as T?;
    } catch (e) {
      return null;
    }
  }
}
