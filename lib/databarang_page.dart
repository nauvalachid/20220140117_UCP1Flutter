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

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        tanggalController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
        _isDateSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text(
          'Pendataan Barang',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE75027),
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // << ini warna putih
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tanggal Transaksi',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: tanggalController,
                    readOnly: true,
                    onTap: _pickDate,
                    decoration: InputDecoration(
                        hintText: 'Pilih Tanggal',
                         border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                        color: _isDateSelected ? Colors.grey : Colors.red,
                        ),
                      ),
                      prefixIcon: const Icon(Icons.calendar_today),
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                      color: _isDateSelected ? Colors.grey : Colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                    color: _isDateSelected ? Colors.grey : Colors.red,  
                    ),
                  ),
                ),
              ),
                  if (!_isDateSelected)
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Tanggal tidak boleh kosong",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }