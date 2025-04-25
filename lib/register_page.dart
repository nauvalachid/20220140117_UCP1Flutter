import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('DAFTAR AKUN BARU',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
               Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   const Text(
                    'Nama Lengkap',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                 ),
                 ],
               ),
              SizedBox(height: 16),
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama Lengkap',border: OutlineInputBorder(),prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama lengkap tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                  Expanded(
                    child: ListTile(
                      title: Text('Email'),
                      subtitle: TextFormField(decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(8)),),
                          hintText: 'Email',
                          ),
                    ),),
                  ),
                  SizedBox(width: 5),
                  Expanded(child: ListTile(
                    title: Text('Password'),
                    leading: Icon(Icons.lock),
                    subtitle: TextFormField(decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(8))),
                          hintText: 'Password',
                          ),
                    ),),
                  ),
                 ],
               ),
              ElevatedButton(onPressed: () {}, child: Text('Register')),
              TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/login');
                  // // Navigator.pop(context);
                  // // Navigator.push(
                  // //   context,
                  // //   MaterialPageRoute(builder: (context) => const LoginPage()),
                  // // );
                },
                child: Text('Sudah punya akun? Login Sekarang!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}