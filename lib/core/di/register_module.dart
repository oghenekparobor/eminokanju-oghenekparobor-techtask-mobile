import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(connectTimeout: 10000, receiveTimeout: 10000));


  @preResolve
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();

}
