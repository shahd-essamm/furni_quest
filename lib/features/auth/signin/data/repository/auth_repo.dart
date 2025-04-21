import 'package:furni_quest/core/services/api_ocnstants.dart';
import 'package:furni_quest/core/services/api_service.dart';
import '../models/user_model.dart';

class AuthRepository {
  final ApiServices api;

  AuthRepository(this.api);

  Future<UserModel> login(String email, String password) async {
    final response = await api.postData(
      endpoint: ApiConstants.login,
      data: {"email": email, "password": password},
    );

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> signupUser(
      String name, String email, String password) async {
    final response = await api.postData(
      endpoint: ApiConstants.signupUser,
      data: {"name": name, "email": email, "password": password},
    );

    return UserModel.fromJson(response.data);
  }
}
