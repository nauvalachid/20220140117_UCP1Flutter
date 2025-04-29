import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataBarangPage extends StatefulWidget {
  const DataBarangPage({super.key});

  @override
  State<DataBarangPage> createState() => _DataBarangPageState();
}

class _DataBarangPageState extends State<DataBarangPage> {
  final TextEditingController jenisbarangController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jenistransaksiController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  DateTime? _selectedDate;
  bool _isDateSelected = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
      ),
    );
  }
}