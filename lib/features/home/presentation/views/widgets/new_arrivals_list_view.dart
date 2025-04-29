import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/core/services/get_it_service.dart';
import 'package:furni_quest/features/home/data/repos/new_arrival_repo.dart';
import 'package:furni_quest/features/home/presentation/cubits/new_arrival_cubit.dart';
import 'package:furni_quest/features/home/presentation/cubits/new_arrival_state.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/new_arrivals_item.dart';
import 'package:shimmer/shimmer.dart';

class NewArrivalsListView extends StatelessWidget {
  const NewArrivalsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewArrivalCubit(
        getIt.get<NewArrivalRepo>(),
      )..getAllNewArrival(),
      child: BlocConsumer<NewArrivalCubit, NewArrivalState>(
        listener: (context, state) {
          if (state is NewArrivalFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is NewArrivalLoading) {
            return SizedBox(
              height: 103,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => const ShimmerNewArrivalItem(),
              ),
            );
          }
          if (state is NewArrivalSuccess) {
            return SizedBox(
              height: 103,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.newArrivalModel.length,
                itemBuilder: (context, index) => NewArrivalItem(
                  newArrival: state.newArrivalModel[index],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class ShimmerNewArrivalItem extends StatelessWidget {
  const ShimmerNewArrivalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
