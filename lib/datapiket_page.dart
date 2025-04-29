import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1/detailpiket_page.dart';

class DataPiketPage extends StatefulWidget {
  final String email;

  const DataPiketPage({Key? key, required this.email}) : super(key: key);

  @override
  State<DataPiketPage> createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController tugasController = TextEditingController();

  DateTime? _selectedDate;
  bool _isDateSelected = true;
  bool _isTugasValid = true;

  List<Map<String, String>> tugasList = [];

  @override
  void initState() {
    super.initState();
    // Isi field nama dengan email member sebagai default
    namaController.text = widget.email;
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

  void _addTugas() {
    setState(() {
    _isDateSelected = _selectedDate != null;
    _isTugasValid = tugasController.text.isNotEmpty;
  });
  
    if (tugasController.text.isNotEmpty && _selectedDate != null) {
      setState(() {
        tugasList.add({
          'nama': namaController.text,
          'tanggal': tanggalController.text,
          'tugas': tugasController.text,
        });
        // Reset field tugas dan tanggal
        tugasController.clear();
        tanggalController.clear();
        _selectedDate = null;
      });
  }
}

  void _navigateToDetail(Map<String, String> tugasData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPiketPage(
          nama: tugasData['nama'] ?? '',
          tanggal: tugasData['tanggal'] ?? '',
          tugas: tugasData['tugas'] ?? '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Piket Gudang',
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
            // Form Input
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nama Anggota',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: namaController,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tanggal Piket',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: tanggalController,
                    readOnly: true,
                    onTap: _pickDate,
                    decoration: InputDecoration(
                      hintText: 'Pilih tanggal piket',
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
                  const SizedBox(height: 16),
                  const Text(
                    'Tugas Piket',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: tugasController,
                              decoration: InputDecoration(
                                hintText: 'Tugas Piket',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                    color: _isTugasValid ? Colors.grey : Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                    color: _isTugasValid ? Colors.grey : Colors.red,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                    color: _isTugasValid ? Colors.grey : Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            if (!_isTugasValid)
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "Tugas tidak boleh kosong",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      ElevatedButton(
                        onPressed: _addTugas,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE75027),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'Tambah',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Daftar Tugas Piket',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // List Tugas Piket
            Expanded(
              child: tugasList.isNotEmpty
                  ? ListView.builder(
                      itemCount: tugasList.length,
                      itemBuilder: (context, index) {
                        final tugasData = tugasList[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          ),
                          color: const Color(0xFFE75027),
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(
                              tugasData['tugas'] ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              onPressed: () => _navigateToDetail(tugasData),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'Belum ada tugas piket.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
