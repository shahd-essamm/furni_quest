import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/core/services/injection.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/product_cubit/product_cubit.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/product_cubit/product_state.dart';
import 'package:furni_quest/features/home/data/repos/product_repo.dart';
import 'package:furni_quest/features/home/presentation/screens/recommended_card_item.dart';
import 'package:furni_quest/features/home/presentation/widgets/recommended_for_you/recommended_shimmer.dart';

class RecommendedGridView extends StatelessWidget {
  const RecommendedGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        getIt.get<ProductRepository>(),
      )..getProductRecommendedForYou(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is RecommendedForYouFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is RecommendedForYouLoading) {
            return RecommendedShimmer();
          } else if (state is RecommendedForYouSuccess) {
            return GridView.builder(
              itemCount: state.product.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) => RecommendedCardItem(
                product: state.product[index],
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
