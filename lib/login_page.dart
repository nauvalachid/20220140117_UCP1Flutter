import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   @override
  void initState() {
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'SELAMAT DATANG KEMBALI',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16),
               const Text(
                'Email',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
               SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email',border: OutlineInputBorder(),prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
                SizedBox(height: 16),
                 const Text(
                'Password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
                SizedBox(height: 16),
               TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password',border: OutlineInputBorder(),prefixIcon: Icon(Icons.lock)),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Login'),
                                 ),
                 ],
               ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   TextButton(
                    onPressed: () {
                    },
                    child: Text('Belum punya akun? Daftar'),
                                 ),
                 ],
               ),
            ],
          ),
        ),
      ),
    );
  }
}