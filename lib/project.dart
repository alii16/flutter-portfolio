import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPage();
}

class _ProjectPage extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Project List',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Projects',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Tambahkan semua Card proyek Anda di sini
              _buildProjectCard(
                imagePath: 'assets/projects/project1.png',
                title: 'OnEat',
                description: 'A food delivery website',
                detailDescription:
                    'OnEat is a website that allows users to view, order food with the feature of managing orders, tracking orders and so on. \n\nMade with HTML5, PHP, Flowbite, and Bootstrap.',
                demoUrl: 'https://restaurant.alii.mra.my.id',
              ),
              const SizedBox(height: 10),
              _buildProjectCard(
                imagePath: 'assets/projects/project2.png',
                title: 'Res-Image',
                description: 'An image resize and reduce quality',
                detailDescription:
                    'Res-Image is a website that resizes images as desired, this includes changing the width, height, and reducing the quality of the image. \n\nMade with HTML5, CSS3, and JavaScript.',
                demoUrl: 'https://alii16.github.io/image-resize--compress/',
              ),
              const SizedBox(height: 10),
              _buildProjectCard(
                imagePath: 'assets/projects/project3.png',
                title: 'GoCartshop',
                description: 'A website for shopping by category',
                detailDescription:
                    'An e-commerce platform that makes it easy for users to browse products, make purchases, and track orders. Equipped with features such as search, reviews, secure payments, and store management for sellers, providing a practical and enjoyable online shopping experience. \n\nMade with HTML5, CSS3, and PHP.',
                demoUrl: 'https://go-cartshop.alii.mra.my.id/',
              ),
              const SizedBox(height: 10),
              _buildProjectCard(
                imagePath: 'assets/projects/project4.png',
                title: 'ChatApp',
                description: 'A realtime chatapp',
                detailDescription:
                    'ChatApp is a real-time chat application that allows users to communicate instantly through text, enabling seamless conversations and instant messaging with friends. With a simple and user-friendly interface, it ensures quick and secure messaging for an engaging chat experience. \n\nMade with HTML5, CSS3, and PHP.',
                demoUrl: 'https://chat-app.alii.mra.my.id/',
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'more at:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: SizedBox(
                      width: 40, // Sesuaikan ukuran
                      height: 40,
                      child: Image.asset('assets/github.png'),
                    ),
                    onPressed: () async {
                      const url = 'https://github.com/alii16';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required String imagePath,
    required String title,
    required String description,
    required String detailDescription,
    required String demoUrl,
  }) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  _showProjectDetailDialog(
                    context: context,
                    imagePath: imagePath,
                    detailDescription: detailDescription,
                    demoUrl: demoUrl,
                  );
                },
                child: const Text('Detail'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showProjectDetailDialog({
    required BuildContext context,
    required String imagePath,
    required String detailDescription,
    required String demoUrl,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Project Details'),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              height: 150,
            ),
            const SizedBox(height: 10),
            Text(detailDescription),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              if (await canLaunchUrl(Uri.parse(demoUrl))) {
                await launchUrl(
                  Uri.parse(demoUrl),
                  mode: LaunchMode.externalApplication,
                );
              } else {
                throw 'Could not launch $demoUrl';
              }
            },
            child: const Text('Show Demo'),
          ),
        ],
      ),
    );
  }
}
