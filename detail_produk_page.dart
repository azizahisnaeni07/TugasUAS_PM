import 'package:flutter/material.dart';
import '../models/produk.dart';
import '../models/cart_item.dart';
import '../data/data_produk.dart';
import 'cart_page.dart';

class DetailProdukPage extends StatelessWidget {
  final Produk produk;

  const DetailProdukPage({super.key, required this.produk});

  void tambahKeKeranjang(BuildContext context) {
    final index = keranjang.indexWhere(
      (item) => item.produk.nama == produk.nama,
    );

    if (index >= 0) {
      keranjang[index].qty++;
    } else {
      keranjang.add(CartItem(produk: produk));
    }
  }

  void beliSekarang(BuildContext context) {
    tambahKeKeranjang(context);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produk.nama),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF9FAFB),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ICON PRODUK
            Center(
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF60A5FA), Color(0xFF2563EB)],
                  ),
                ),
                child: const Icon(
                  Icons.water_drop,
                  size: 64,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 32),

            /// NAMA
            Text(
              produk.nama,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            /// DESKRIPSI
            Text(
              produk.deskripsi,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 24),

            /// HARGA
            Text(
              'Rp ${produk.harga}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2563EB),
              ),
            ),

            const Spacer(),

            /// BUTTON AREA
            Row(
              children: [
                /// TAMBAH KE KERANJANG
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      tambahKeKeranjang(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Produk ditambahkan ke keranjang'),
                        ),
                      );
                    },
                    child: const Text('Tambah ke Keranjang'),
                  ),
                ),

                const SizedBox(width: 12),

                /// BELI SEKARANG
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () => beliSekarang(context),
                    child: const Text('Beli Sekarang'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
