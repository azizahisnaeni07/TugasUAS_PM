import 'package:flutter/material.dart';
import '../data/data_produk.dart';
import '../models/produk.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  // =============================
  // FORM TAMBAH / EDIT
  // =============================
  void showForm({Produk? produk, int? index}) {
    final namaC = TextEditingController(text: produk?.nama ?? '');
    final deskC = TextEditingController(text: produk?.deskripsi ?? '');
    final hargaC = TextEditingController(
      text: produk != null ? produk.harga.toString() : '',
    );

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            produk == null ? 'Tambah Produk' : 'Edit Produk',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaC,
                decoration: const InputDecoration(labelText: 'Nama Produk'),
              ),
              TextField(
                controller: deskC,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
              ),
              TextField(
                controller: hargaC,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Harga'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (produk == null) {
                    // TAMBAH
                    produkList.add(
                      Produk(
                        nama: namaC.text,
                        deskripsi: deskC.text,
                        harga: int.parse(hargaC.text),
                      ),
                    );
                  } else {
                    // EDIT
                    produkList[index!] = Produk(
                      nama: namaC.text,
                      deskripsi: deskC.text,
                      harga: int.parse(hargaC.text),
                    );
                  }
                });
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  // =============================
  // DELETE
  // =============================
  void deleteProduk(int index) {
    setState(() {
      produkList.removeAt(index);
    });
  }

  // =============================
  // UI
  // =============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Produk'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: produkList.length,
        itemBuilder: (context, i) {
          final p = produkList[i];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.black12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.deepPurple.shade100,
                  child: const Icon(Icons.local_florist,
                      color: Colors.deepPurple),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.nama,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Rp ${p.harga}',
                        style: const TextStyle(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  onPressed: () => showForm(produk: p, index: i),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteProduk(i),
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () => showForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
