import 'package:flutter/material.dart';
import '../models/produk.dart';
import '../data/data_produk.dart';

class AdminFormPage extends StatefulWidget {
  final Produk? produk;
  final int? index;

  const AdminFormPage({super.key, this.produk, this.index});

  @override
  State<AdminFormPage> createState() => _AdminFormPageState();
}

class _AdminFormPageState extends State<AdminFormPage> {
  late TextEditingController namaController;
  late TextEditingController deskripsiController;
  late TextEditingController hargaController;

  @override
  void initState() {
    super.initState();
    namaController =
        TextEditingController(text: widget.produk?.nama ?? '');
    deskripsiController =
        TextEditingController(text: widget.produk?.deskripsi ?? '');
    hargaController = TextEditingController(
        text: widget.produk?.harga.toString() ?? '');
  }

  void simpan() {
    final produkBaru = Produk(
      nama: namaController.text,
      deskripsi: deskripsiController.text,
      harga: int.parse(hargaController.text),
    );

    if (widget.index == null) {
      produkList.add(produkBaru);
    } else {
      produkList[widget.index!] = produkBaru;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == null
            ? 'Tambah Produk'
            : 'Edit Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Nama Produk'),
            ),
            TextField(
              controller: deskripsiController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            TextField(
              controller: hargaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Harga'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: simpan,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
