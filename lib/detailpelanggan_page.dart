import 'package:flutter/material.dart';
import 'package:ucp1/homepage.dart';

class DetailPelangganPage extends StatelessWidget {
  final String alamat;
  final String provinsi;
  final String kodepos;
  final String nama;
  final String email;
  final String noHP;

    const DetailPelangganPage({
    Key? key,
    required this.alamat,
    required this.provinsi,
    required this.kodepos,
    required this.nama,
    required this.email,
    required this.noHP,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${nama}',
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
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/pp.jpeg'), // Ganti sesuai path asetmu
            ),
            const SizedBox(height: 16),
            Text(
              nama,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(email),
            Text(noHP),
            const SizedBox(height: 32),
            buildField('Alamat', alamat),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: buildField('Provinsi', provinsi)),
                const SizedBox(width: 16),
                Expanded(child: buildField('Kode Pos', kodepos)),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(email: email), 
                    ),
                    (route) => false, 
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE75027),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Selesai',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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

Widget buildField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: value,
          enabled: false,
          style: const TextStyle(color: Colors.black), 
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ],
    );
  }