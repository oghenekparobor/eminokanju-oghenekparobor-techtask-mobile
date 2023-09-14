import 'package:tech_task/core/network/state.dart';

extension AppStateToMsg on AppState {
  String get msg => switch (this) {
        LoadedState(data: var data) => data['message'],
        ErrorState(msg: var msg) => msg
      };

  bool get isError {
    if (this is ErrorState) {
      return true;
    } else {
      return false;
    }
  }
}
