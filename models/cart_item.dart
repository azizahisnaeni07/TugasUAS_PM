import 'produk.dart';

class CartItem {
  final Produk produk;
  int qty;

  CartItem({
    required this.produk,
    this.qty = 1,
  });
  int get totalHarga => produk.harga * qty;
}

