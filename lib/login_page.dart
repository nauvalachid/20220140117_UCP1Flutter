import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

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
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(18)),
                  ),
                  prefixIcon: Icon(Icons.email)),
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
                style: TextStyle(fontSize: 14, 
                fontWeight: FontWeight.bold),
              ),
                SizedBox(height: 16),
               TextFormField(
                controller: passwordController,
                 obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword; // Toggle visibility
                    });
                  },
                ),
              ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   ElevatedButton(
                    onPressed: () {
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
                    ),
                    child: Text('Masuk'),
                    ),
                 ],
               ),
               SizedBox(height: 16),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   TextButton(
                    onPressed: () {
                    },
                    child: Text('Belum memiliki akun? Silahkan Daftar disini!'),
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