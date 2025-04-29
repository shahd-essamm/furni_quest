import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/features/home/data/repos/new_arrival_repo.dart';
import 'package:furni_quest/features/home/presentation/cubits/new_arrival_state.dart';

class NewArrivalCubit extends Cubit<NewArrivalState> {
  final NewArrivalRepo newArrivalRepo;

  NewArrivalCubit(this.newArrivalRepo) : super(NewArrivalInitial());

  void getAllNewArrival() async {
    emit(NewArrivalLoading());
    try {
      final allNewArrival = await newArrivalRepo.getAllNewArrival();
      emit(NewArrivalSuccess(allNewArrival));
    } catch (e) {
      emit(NewArrivalFailure(e.toString()));
    }
  }
}
