import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailBarangPage extends StatelessWidget {
  final String tanggal;
  final String jenistransaksi;
  final String jenisbarang;
  final String jumlahbarang;
  final String jenisharga;
  final String totalharga;

  const DetailBarangPage({
    Key? key,
    required this.tanggal,
    required this.jenistransaksi,
    required this.jenisbarang,
    required this.jumlahbarang,
    required this.jenisharga,
    required this.totalharga,
  }) : super(key: key);

  String formatTanggal(String tanggalAsli) {
    try {
      DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(tanggalAsli);
      return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(parsedDate);
    } catch (e) {
      return tanggalAsli;
    }
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.withOpacity(0.1),
            ),
            padding: const EdgeInsets.all(20),
            child: const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
          ),
            const SizedBox(height: 16),
            Text(
              'Data Berhasil Disimpan',
            ),
            const SizedBox(height: 32),
            buildDetailRow('Tanggal', formatTanggal(tanggal)),
            const Divider(),
            buildDetailRow('Jenis Transaksi', jenistransaksi),
            const Divider(),
            buildDetailRow('Jenis Barang', jenisbarang),
            const Divider(),
            buildDetailRow('Jumlah Barang', jumlahbarang),
            const Divider(),
            buildDetailRow('Jenis Harga Satuan', jenisharga),
            const Divider(),
            buildDetailRow('Total Harga', totalharga),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 231, 80, 39),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text(
                  'Selesai',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
