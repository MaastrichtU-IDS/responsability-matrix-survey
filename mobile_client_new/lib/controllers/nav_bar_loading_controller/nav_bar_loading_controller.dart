import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarLoadingController extends StateNotifier<bool> {
  NavBarLoadingController() : super(false);
  void setLoading(bool loading) {
    if (loading != state) {
      state = loading;
    }
  }
}
