import 'package:app/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QABlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i('🟢 CREATED: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d(
      '🔄 ${bloc.runtimeType}\n'
      '📤 OLD: ${change.currentState}\n'
      '📥 NEW: ${change.nextState}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e(
      '❌ ERROR in ${bloc.runtimeType}:\n'
      '💥 ${error.toString()}\n'
      '📍 $stackTrace',
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.i('🔴 CLOSED: ${bloc.runtimeType}');
  }
}
