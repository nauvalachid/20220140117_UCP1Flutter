import 'package:flutter/material.dart';
import 'package:ucp1/datapelanggan_page.dart';
import 'package:ucp1/datapiket_page.dart';

class HomePage extends StatefulWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 80, 39),
        toolbarHeight: 100,
        title:Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/pp.jpeg'),
              radius: 20,
            ),
        SizedBox(width: 20,), 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selamat Datang', style: TextStyle(
              fontSize: 14,
              color: Colors.white),),
            SizedBox(height: 4),
            Text(widget.email, style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold)),
          ],
        ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 30,),
              onPressed: () {
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Image.asset(
              'assets/images/iklan.jpeg',
              height: 300,
              width: 425,
              fit: BoxFit.contain,),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 120,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFE75027),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            onTap: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DataPiketPage(email: widget.email)
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.assignment_ind, size: 40, color: Colors.white),
                                SizedBox(height: 8),
                                Text(
                                  'Data Piket',
                                  style: TextStyle(
                                    color: Colors.white, 
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 120,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFE75027),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DataPelangganPage()
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.group_add, size: 40, color: Colors.white),
                                SizedBox(height: 8),
                                Text(
                                  'Data Pelanggan',
                                  style: TextStyle(
                                    color: Colors.white, 
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 180,
                    width: double.infinity,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFE75027),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () {
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.receipt_long, size: 40, color: Colors.white),
                          SizedBox(height: 8),
                          Text(
                            'Barang Masuk/Keluar',
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
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