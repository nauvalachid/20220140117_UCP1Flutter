import 'package:flutter/material.dart';
import 'package:ucp1/homepage.dart';
import 'package:ucp1/register_page.dart';

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
         child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  'assets/images/mount.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.contain,),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'SELAMAT DATANG KEMBALI',
                      style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                 Row(
                   children: [
                     const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 14, 
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',),
                                     ),
                   ],
                 ),
                 SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(18)),
                    ),
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                  SizedBox(height: 16),
                   Row(
                     children: [
                       const Text(
                          'Password',
                           style: TextStyle(fontSize: 14, 
                           fontWeight: FontWeight.bold),
                        ),
                     ],
                   ),
                  SizedBox(height: 16),
                 TextFormField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                  border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  hintText: 'Password',
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
                         if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(email: emailController.text),
                      ),
                    );
                  }
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
                      Text(
                        'Belum memiliki akun? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()),
                          );
                        },
                        child: Text(
                          'Daftar disini!',
                          style:TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 231, 80, 39),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}