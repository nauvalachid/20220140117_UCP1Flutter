import 'package:flutter/material.dart';

class DetailPelangganPage extends StatelessWidget {
  final String alamat;
  final String provinsi;
  final String kodepos;

    const DetailPelangganPage({
    Key? key,
    required this.alamat,
    required this.provinsi,
    required this.kodepos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pelanggan',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 231, 80, 39),
        centerTitle: true,
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}