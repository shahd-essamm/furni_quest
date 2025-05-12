import 'package:furni_quest/features/home/data/models/new_arrival_model.dart';

abstract class NewArrivalState {}

class NewArrivalInitial extends NewArrivalState {}

class NewArrivalLoading extends NewArrivalState {}

class NewArrivalSuccess extends NewArrivalState {
  final List<NewArrivalModel> newArrivalModel;

  NewArrivalSuccess(this.newArrivalModel);
}

class NewArrivalFailure extends NewArrivalState {
  final String error;

  NewArrivalFailure(this.error);
}
