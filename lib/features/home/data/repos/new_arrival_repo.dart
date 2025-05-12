import 'package:furni_quest/core/services/api_constans.dart';
import 'package:furni_quest/core/services/api_service.dart';
import 'package:furni_quest/features/home/data/models/new_arrival_model.dart';

class NewArrivalRepo {
  final ApiServices api;

  NewArrivalRepo(this.api);

  Future<List<NewArrivalModel>> getAllNewArrival() async {
    final response = await api.getData(
      endpoint: ApiConstants.newArrival,
    );

    return List<NewArrivalModel>.from(
      response.data.map(
        (x) => NewArrivalModel.fromJson(x),
      ),
    );
  }
}
