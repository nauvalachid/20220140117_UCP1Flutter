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

   // Fungsi untuk mengubah format tanggal
  String formatTanggal(String tanggalAsli) {
    try {
      DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(tanggalAsli);
      return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(parsedDate);
    } catch (e) {
      return tanggalAsli;
    }
  }
}