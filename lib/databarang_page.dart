import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataBarangPage extends StatefulWidget {
  const DataBarangPage({super.key});

  @override
  State<DataBarangPage> createState() => _DataBarangPageState();
}

class _DataBarangPageState extends State<DataBarangPage> {
  final _formKey = GlobalKey<FormState>();

  int hitungTotalHarga() {
  final jumlah = int.tryParse(jumlahController.text) ?? 0;

  final hargaText = hargaController.text.replaceAll(RegExp(r'[^0-9]'), '');
  final harga = int.tryParse(hargaText) ?? 0;

  return jumlah * harga;
}

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
              key: _formKey,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tanggal tidak boleh kosong';
                      }
                    }
                  ),
                    const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: jenistransaksiController.text.isNotEmpty
                        ? jenistransaksiController.text
                        : null,
                    items: ['Barang Masuk', 'Barang Keluar'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        jenistransaksiController.text = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pilih jenis transaksi';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Jenis Transaksi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                   DropdownButtonFormField<String>(
                    value: jenisbarangController.text.isNotEmpty
                        ? jenisbarangController.text
                        : null,
                    items: ['Carrier', 'Sleeping Bag','Tenda','Sepatu'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        jenisbarangController.text = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pilih jenis barang';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Jenis Barang',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Jumlah Barang',
                              style: TextStyle(
                                fontSize: 14, 
                                fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: jumlahController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:BorderRadius.all(Radius.circular(18))),
                                  hintText: 'Jumlah barang'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ' tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Harga Satuan',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: hargaController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                ),
                                hintText: 'Rp. 0',
                              ),
                              onChanged: (value) {
                                String newValue =
                                    value.replaceAll(RegExp(r'[^0-9]'), '');
                                if (newValue.isEmpty) {
                                  hargaController.text = '';
                                  return;
                                }
                                final formatter = NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0);
                                String formatted =
                                    formatter.format(int.parse(newValue));
                                hargaController.value = TextEditingValue(
                                  text: formatted,
                                  selection: TextSelection.collapsed(
                                      offset: formatted.length),
                                );
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                     ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                        if (_formKey.currentState!.validate()){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailPelangganPage(
                        //       nama: namaController.text,
                        //       email: emailController.text,
                        //       noHP: noHPController.text,
                        //       alamat: alamatController.text,
                        //       provinsi: provinsiController.text,
                        //       kodepos: kodeController.text,
                        //     ),
                        //   ),
                        // );
                      }},
                       style: ElevatedButton.styleFrom(
                              fixedSize: Size(425, 60), 
                              backgroundColor: const Color.fromARGB(255, 231, 80, 39),
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            ),
                            child: const Text('Simpan'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}