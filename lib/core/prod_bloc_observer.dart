import 'package:app/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProdBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('❌ Error in ${bloc.runtimeType}: $error\n$stackTrace');
  }
}
