import 'package:dio/dio.dart';

import 'user_model.dart';

class UserRepository {
  final Dio dio;
  UserRepository(this.dio);
  Future<User> getUser() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users/1');
    print(response);

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    }
    throw Exception('Some Error');
  }
}
