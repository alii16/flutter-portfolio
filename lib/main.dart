// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aplikasi_pertamaku/project.dart';
import 'package:aplikasi_pertamaku/skill.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors
                    .transparent, // Transparent untuk menunjukkan gradient
                elevation: 0, // Menghapus shadow
                centerTitle: true,
                title: const Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    'Syalli Polanunu',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: const Text(
                    'alipolanunu077@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 50, // Ukuran avatar
                    backgroundColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        shape:
                            BoxShape.circle, // Bentuk lingkaran untuk outline
                        border: Border.all(
                          color: Colors.pink, // Warna outline
                          width: 3, // Ketebalan outline
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.png',
                          fit: BoxFit
                              .cover, // Pastikan gambar tercover dengan baik
                          width: 90, // Ukuran gambar
                          height:
                              90, // Pastikan tinggi dan lebar sama untuk bentuk bulat
                        ),
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.cyan,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/banner.jpg',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.account_box,
                    color: Colors.blue,
                  ),
                  title: const Text('About'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.codeBranch,
                    color: Colors.blue,
                  ),
                  title: const Text('Project'),
                  onTap: () async {
                    // Ganti ini dengan navigasi ke halaman project.dart
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProjectPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.gears,
                    color: Colors.blue,
                  ),
                  title: const Text('Skills'),
                  onTap: () async {
                    // Ganti ini dengan navigasi ke halaman project.dart
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SkillPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.blue,
                  ),
                  title: const Text('WhatsApp'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://wa.me/6282120791879?text=Hello');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.blue,
                  ),
                  title: const Text('Instagram'),
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://www.instagram.com/aliiwithahoodie?igsh=MTc3cTR0MG41bnZo');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  thickness: 1, // Ketebalan garis
                  color: Colors.blue, // Warna garis
                  indent: 16, // Jarak dari sisi kiri
                  endIndent: 16, // Jarak dari sisi kanan
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Apakah anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            child: const Text('Batal'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Keluar',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Card Content
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          // Profile Avatar
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape
                                  .circle, // Membuat outline berbentuk lingkaran
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFF58529), // Warna gradasi Instagram
                                  Color(0xFFDD2A7B),
                                  Color(0xFF8134AF),
                                  Color(0xFF515BD4),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            padding:
                                const EdgeInsets.all(4), // Ketebalan outline
                            child: const CircleAvatar(
                              radius: 100, // Ukuran lingkaran avatar
                              backgroundImage: AssetImage('assets/me3.png'),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'Syalli Polanunu',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF303F9F), // Warna indigo 700
                            ),
                          ),

                          const SizedBox(height: 10),
                          SizedBox(
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(
                                    10), // Menambahkan padding di sekitar teks
                                decoration: BoxDecoration(
                                  color: const Color(
                                      0xFFE3F2FD), // Warna latar belakang biru muda
                                  borderRadius: BorderRadius.circular(
                                      50), // Menambahkan sudut yang melengkung
                                ),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'Web Developer | Student',
                                      speed: const Duration(milliseconds: 100),
                                    ),
                                  ],
                                  repeatForever:
                                      true, // Animasi akan terus berulang
                                  isRepeatingAnimation: true,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16,
                                  height:
                                      1.5, // Line spacing for better readability
                                  color: Colors.black,
                                ),
                                children: [
                                  const TextSpan(
                                    text:
                                        "Hello there !👋 I am Syalli Polanunu, born on November 16, 2004, in the beautiful village of Wakasihu. "
                                        "Currently, I am pursuing my studies at ITB-STIKOM Ambon while honing my skills as a passionate web developer. "
                                        "Explore more on my portfolio at ",
                                    style: TextStyle(
                                      fontFamily:
                                          'Inter', // Menggunakan font Inter
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'alii.mra.my.id',
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const url = 'https://alii.mra.my.id';
                                        // ignore: deprecated_member_use
                                        if (await canLaunch(url)) {
                                          // ignore: deprecated_member_use
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Setelah deskripsi tentang saya
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Experience
                              Column(
                                children: [
                                  // Ikon dengan latar belakang lingkaran
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(
                                          0xFFE3F2FD), // Warna latar belakang biru muda
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.only(
                                      top: 25, // Padding atas
                                      bottom: 5, // Padding bawah
                                      left: 30, // Padding kiri
                                      right: 30, // Padding kanan
                                    ), // Ruang di sekitar konten
                                    // ignore: prefer_const_constructors
                                    child: Column(
                                      mainAxisSize: MainAxisSize
                                          .min, // Sesuaikan ukuran dengan konten
                                      children: [
                                        // Ikon
                                        const Icon(
                                          Icons.work,
                                          size: 40,
                                          color: Color(0xFF2196F3), // Ikon biru
                                        ),
                                        const SizedBox(
                                            height:
                                                10), // Jarak antara ikon dan teks
                                        // Teks "Experience"
                                        const Text(
                                          'Experience',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                            height:
                                                5), // Jarak antara teks judul dan deskripsi
                                        // Teks "3+ Years"
                                        const Text(
                                          '1+ Years',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              // Project
                              Column(
                                children: [
                                  // Ikon dengan latar belakang lingkaran
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(
                                          0xFFF3E5F5), // Warna latar belakang ungu muda
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.only(
                                      top: 25, // Padding atas
                                      bottom: 5, // Padding bawah
                                      left: 40, // Padding kiri
                                      right: 40, // Padding kanan
                                    ), // Ruang di sekitar konten
                                    // ignore: prefer_const_constructors
                                    child: Column(
                                      mainAxisSize: MainAxisSize
                                          .min, // Sesuaikan ukuran dengan konten
                                      children: [
                                        // Ikon
                                        const Icon(
                                          Icons.code,
                                          size: 40,
                                          color: Color(0xFF9C27B0), // Ikon ungu
                                        ),
                                        const SizedBox(
                                            height:
                                                10), // Jarak antara ikon dan teks
                                        // Teks "Experience"
                                        const Text(
                                          'Projects',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                            height:
                                                5), // Jarak antara teks judul dan deskripsi
                                        // Teks "3+ Years"
                                        const Text(
                                          '10+',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
