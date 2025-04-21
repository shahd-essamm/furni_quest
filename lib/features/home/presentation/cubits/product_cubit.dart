import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/features/home/data/repos/product_repo.dart';
import 'package:furni_quest/features/home/presentation/cubits/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit(this.productRepository) : super(RecommendedForYouInitial());

  void getProductRecommendedForYou() async {
    emit(RecommendedForYouLoading());
    try {
      final products = await productRepository.getProductRecommendedForYou();
      emit(RecommendedForYouSuccess(products));
    } catch (e) {
      emit(RecommendedForYouFailure(e.toString()));
    }
  }
}
