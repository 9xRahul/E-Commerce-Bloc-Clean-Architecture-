import 'package:clean_architecture_with_bloc/domain/cart/entity/cart_entity.dart';

abstract class CartRepository {
  Future<CartEntity> getCart(int userId);
  Future<CartEntity> addToCart(int userId, int productId, int qty);
  Future<CartEntity> updateCart(int cartId, int productId, int qty);
  Future<CartEntity> removeFromCart(int cartId, int productId);
}
