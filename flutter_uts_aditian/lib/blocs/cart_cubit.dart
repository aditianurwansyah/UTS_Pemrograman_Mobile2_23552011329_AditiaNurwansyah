import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart'; // Sesuaikan path jika berbeda

// Class untuk item di cart (produk + quantity)
class CartItem {
  final ProductModel product;
  final int quantity;

  CartItem(this.product, this.quantity);

  // Opsional: Override equality jika diperlukan (berdasarkan product.id)
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          product.id == other.product.id;

  @override
  int get hashCode => product.id.hashCode;
}

// State untuk CartCubit
class CartState {
  final List<CartItem> items;

  CartState(this.items);

  // Helper untuk copy state (opsional, tapi berguna untuk update)
  CartState copyWith({List<CartItem>? items}) {
    return CartState(items ?? this.items);
  }

  // Getter untuk total items dan price (bisa digunakan di UI)
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
  double get totalPrice => items.fold(
    0.0,
    (sum, item) => sum + (item.product.price * item.quantity),
  );
}

// Cubit untuk mengelola cart
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([])); // State awal: cart kosong

  // Menambahkan produk ke cart
  void addToCart(ProductModel product) {
    final currentItems = state.items;
    final existingIndex = currentItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex != -1) {
      // Jika produk sudah ada, tingkatkan quantity
      final updatedItem = CartItem(
        product,
        currentItems[existingIndex].quantity + 1,
      );
      final newItems = List<CartItem>.from(currentItems);
      newItems[existingIndex] = updatedItem;
      emit(CartState(newItems));
    } else {
      // Jika belum ada, tambahkan baru dengan quantity 1
      final newItems = List<CartItem>.from(currentItems)
        ..add(CartItem(product, 1));
      emit(CartState(newItems));
    }
  }

  // Menghapus produk dari cart
  void removeFromCart(ProductModel product) {
    final newItems = state.items
        .where((item) => item.product.id != product.id)
        .toList();
    emit(CartState(newItems));
  }

  // Mengubah quantity produk
  void updateQuantity(ProductModel product, int qty) {
    if (qty <= 0) {
      // Jika quantity <= 0, hapus produk
      removeFromCart(product);
      return;
    }

    final currentItems = state.items;
    final existingIndex = currentItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex != -1) {
      final updatedItem = CartItem(product, qty);
      final newItems = List<CartItem>.from(currentItems);
      newItems[existingIndex] = updatedItem;
      emit(CartState(newItems));
    }
  }

  // Mendapatkan total jumlah item di cart
  int getTotalItems() {
    return state.totalItems; // Menggunakan getter dari CartState
  }

  // Mendapatkan total harga di cart
  double getTotalPrice() {
    return state.totalPrice; // Menggunakan getter dari CartState
  }

  // Mengosongkan cart
  void clearCart() {
    emit(CartState([]));
  }
}
