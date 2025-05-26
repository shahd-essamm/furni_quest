import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_quest/features/home/data/models/product_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial(wishlist: []));
   void toggleWishlist(ProductModel product) {
    final currentWishlist = state.wishlist;
    if (currentWishlist.contains(product)) {
      final updatedWishlist = List<ProductModel>.from(currentWishlist)..remove(product);
      emit(WishlistInitial(wishlist: updatedWishlist));
    } else {
      final updatedWishlist = List<ProductModel>.from(currentWishlist)..add(product);
      emit(WishlistInitial(wishlist: updatedWishlist));
    }
  }

  bool isInWishlist(ProductModel product) {
    return state.wishlist.contains(product);
  }
}
