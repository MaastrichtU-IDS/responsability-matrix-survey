import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingController extends StateNotifier<bool> {
  LoadingController() : super(false);

  void startLoading() {
    state = true;
  }

  void stopLoading() {
    state = false;
  }
}
