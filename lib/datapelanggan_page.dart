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

   @override
  void initState() {
    super.initState();
  }
@override
Widget build(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
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
  );
}
}