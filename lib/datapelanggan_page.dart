import 'package:flutter/material.dart';

class DataPelangganPage extends StatefulWidget {
  const DataPelangganPage({super.key});

  @override
  State<DataPelangganPage> createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodeController = TextEditingController();

final _formKey = GlobalKey<FormState>();

   @override
  void initState() {
    super.initState();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Data Pelanggan',style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),),
      centerTitle: true,
      toolbarHeight: 80,
      backgroundColor: const Color.fromARGB(255, 231, 80, 39),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    ),
    body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Nama Cust',
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
              SizedBox(height: 8),
              TextFormField(
                    controller: namaController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(18))),
                      hintText: 'Nama Cust',
                      ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cust tidak boleh kosong';
                      }
                      return null;
                    },
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
                          'Email',
                          style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.bold,),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:BorderRadius.all(Radius.circular(18))),
                                  hintText: 'Email',
                                ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                      ],
                    ),
                  ),
                   SizedBox(width: 16),
                   Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'No.HP',
                              style: TextStyle(
                                fontSize: 14, 
                                fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: noHPController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:BorderRadius.all(Radius.circular(18))),
                                hintText: 'No.HP',
                                ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'No.HP tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    'Alamat',
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.bold,),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: alamatController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(18))),
                      hintText: 'Alamat',
                    ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                 Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Provinsi',
                          style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.bold,),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                              controller: provinsiController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:BorderRadius.all(Radius.circular(18))),
                                  hintText: 'Provinsi',
                                ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Provinsi tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                   SizedBox(width: 16),
                   Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kode Pos',
                              style: TextStyle(
                                fontSize: 14, 
                                fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: kodeController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:BorderRadius.all(Radius.circular(18))),
                                hintText: 'Kode Pos',
                                ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Pos tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(onPressed: () {
                    if (_formKey.currentState!.validate());
                  }, 
                   style: ElevatedButton.styleFrom(
                          minimumSize: Size(430, 50), 
                          backgroundColor: const Color.fromARGB(255, 231, 80, 39),
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        ),child: Text('Simpan')),
                  SizedBox(height: 16),
                  ElevatedButton(onPressed: () {
                     _formKey.currentState?.reset();
                  }, 
                   style: ElevatedButton.styleFrom(
                          minimumSize: Size(430, 50), 
                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                          foregroundColor: const Color.fromARGB(255, 231, 80, 39),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        ),child: Text('Reset')),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }