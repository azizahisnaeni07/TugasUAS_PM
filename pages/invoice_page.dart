import 'package:flutter/material.dart';
import '../data/data_produk.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  int get totalHarga =>
      keranjang.fold(0, (sum, item) => sum + item.totalHarga);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Invoice')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Parfume Elegance',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Terima kasih atas pembelian Anda',
              style: TextStyle(color: Colors.grey),
            ),
            const Divider(height: 32),

            /// LIST PRODUK
            Expanded(
              child: ListView.builder(
                itemCount: keranjang.length,
                itemBuilder: (context, index) {
                  final item = keranjang[index];
                  return ListTile(
                    title: Text(item.produk.nama),
                    subtitle: Text(
                      'Rp ${item.produk.harga} x ${item.qty}',
                    ),
                    trailing: Text(
                      'Rp ${item.totalHarga}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),

            const Divider(),

            /// TOTAL
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Bayar',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp $totalHarga',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// SELESAI
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  keranjang.clear();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Selesai'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
