import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:tech_task/core/network/network_info.dart';
import 'package:tech_task/core/network/state.dart';

@lazySingleton
class ImplFormatter {
  ImplFormatter({
    required this.networkInfo,
  });

  final NetworkInfo networkInfo;

  Future<AppState> format(Function function) async {
    if (await networkInfo.isConnected()) {
      try {
        return LoadedState(await function.call());
      } on DioError catch (e, s) {
        FirebaseCrashlytics.instance.recordError(
          e,
          s,
          reason: 'a fatal error on dio error',
          fatal: true,
        );

        if (e.type == DioErrorType.receiveTimeout ||
            e.type == DioErrorType.connectTimeout) {
          return ErrorState('Connection timed out');
        }

        if (e.response == null || e.response!.data == null) {
          return ErrorState(e.response?.data['message'] ?? e.message);
        }

        if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
          return ErrorState(e.response?.data['message']);
        }

        return ErrorState(e.message);
      } catch (e, s) {
        FirebaseCrashlytics.instance.recordError(
          e,
          s,
          reason: 'a fatal error - on catch block',
          fatal: true,
        );

        return ErrorState(e.toString());
      }
    } else {
      FirebaseCrashlytics.instance.log('no internet');
      return ErrorState('Please check your internet');
    }
  }
}
