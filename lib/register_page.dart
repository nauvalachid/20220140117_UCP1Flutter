import 'package:flutter/material.dart';
import 'package:ucp1/homepage.dart';
import 'package:ucp1/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController konfirmasiController = TextEditingController();

   bool _obscurePassword = true;
   bool _obscureConfirmPassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
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
                  fit: BoxFit.contain,
                ),
                  SizedBox(height: 16),
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(18))),
                      hintText: 'Nama Lengkap',
                      prefixIcon: Icon(Icons.person)),
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
                     children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 14, 
                                fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:BorderRadius.all(Radius.circular(18))),
                                  hintText: 'Email',
                                prefixIcon: Icon(Icons.email)),
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
                              controller: noHpController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:BorderRadius.all(Radius.circular(18))),
                                hintText: 'No.HP',
                                prefixIcon: Icon(Icons.phone_android)),
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
                    SizedBox(height: 16),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Password',
                                style: TextStyle(
                                fontSize: 14, 
                                fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: passwordController,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                              border: const OutlineInputBorder(
                              borderRadius:BorderRadius.all(Radius.circular(18))),
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
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Konfirmasi Password',
                              style: TextStyle(
                                fontSize: 14, 
                                fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: konfirmasiController,
                              obscureText: _obscureConfirmPassword,
                              decoration: InputDecoration(
                              border: const OutlineInputBorder(
                              borderRadius:BorderRadius.all(Radius.circular(18))),
                              hintText: 'Konfirmasi Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                              icon: Icon(
                              _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                              setState(() {
                               _obscureConfirmPassword = !_obscureConfirmPassword; // Toggle visibility
                              });
                              },
                            ),
                          ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Konfirmasi Password tidak boleh kosong';
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
                     if (_formKey.currentState!.validate()) {
                      if (passwordController.text != konfirmasiController.text) {
                        // Munculkan snackbar kalau password tidak sama
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Konfirmasi Password tidak sama!'),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(16),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else {
                        // Munculkan snackbar kalau registrasi berhasil
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registrasi Berhasil!'),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(16),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(email: emailController.text)),
                    );
                      }
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
                        ),child: Text('Register')),
                SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah memiliki akun? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        },
                        child: Text(
                          'Login disini!',
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