import 'package:injectable/injectable.dart';
import 'package:tech_task/core/network/dio.dart';

abstract class RemoteDS {
  Future<dynamic> ingredients();
  Future<dynamic> recipes(String ingredients);
}

@LazySingleton(as: RemoteDS)
class RemoteDSImpl extends RemoteDS {
  RemoteDSImpl({
    required this.requester,
  });

  final NetworkRequester requester;

  @override
  Future ingredients() async{
    return await requester.get('/ingredients');
  }

  @override
  Future recipes(String ingredients)async {
    return await requester.get('/recipes?ingredients=$ingredients');
  }
}