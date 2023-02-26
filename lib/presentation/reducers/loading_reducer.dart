import 'package:yellowcat/presentation/common/actions/actions.dart';

bool loadingReducer(bool state, appAction) {
  if (appAction == LoadingAction.loaded) {
    return false;
  } else {
    return true;
  }
}
