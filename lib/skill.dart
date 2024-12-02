import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPage();
}

class _SkillPage extends State<SkillPage> {
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
              'Skill and Services',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SkillCard(
                      title: 'Description',
                      skills: [
                        {
                          'icon': Icons.verified_user,
                          'label':
                              'I have experience in various programming languages such as HTML, CSS, JavaScript, PHP, and Python. These languages are used to create web applications both on the frontend and backend. Additionally, I work with frameworks like Laravel, React, Bootstrap, and Flutter to improve development efficiency and build scalable applications, although I am still a beginner with React and Flutter. For version control, I use Git and GitHub, while for database management, I rely on MySQL. Furthermore, I use Node.js for server-side programming and GitHub for project management, ensuring that my applications are flexible and reliable.',
                          'color': Colors.blue,
                        },
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SkillCard(
                      title: 'Languages',
                      skills: [
                        {
                          'icon': FontAwesomeIcons.html5,
                          'label': 'HTML',
                          'color': Colors.orange,
                        },
                        {
                          'icon': FontAwesomeIcons.css3,
                          'label': 'CSS',
                          'color': Colors.blue,
                        },
                        {
                          'icon': FontAwesomeIcons.php,
                          'label': 'PHP',
                          'color': Colors.indigo,
                        },
                        {
                          'icon': FontAwesomeIcons.js,
                          'label': 'JavaScript',
                          'color': Colors.yellow,
                        },
                        {
                          'icon': FontAwesomeIcons.python,
                          'label': 'Python',
                          'color': Colors.blue,
                        },
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
                    child: SkillCard(
                      title: 'Frameworks',
                      skills: [
                        {
                          'icon': FontAwesomeIcons.laravel,
                          'label': 'Laravel',
                          'color': Colors.red,
                        },
                        {
                          'icon': FontAwesomeIcons.react,
                          'label': 'React',
                          'color': Colors.blue,
                        },
                        {
                          'icon': FontAwesomeIcons.bootstrap,
                          'label': 'Bootstrap',
                          'color': Colors.purple,
                        },
                        {
                          'icon': FontAwesomeIcons.flutter,
                          'label': 'Flutter',
                          'color': Colors.cyan,
                        },
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SkillCard(
                      title: 'Tools',
                      skills: [
                        {
                          'icon': FontAwesomeIcons.gitAlt,
                          'label': 'Git',
                          'color': Colors.red,
                        },
                        {
                          'icon': FontAwesomeIcons.github,
                          'label': 'GitHub',
                          'color': Colors.black,
                        },
                        {
                          'icon': FontAwesomeIcons.database,
                          'label': 'MySQL',
                          'color': Colors.blue,
                        },
                        {
                          'icon': FontAwesomeIcons.nodeJs,
                          'label': 'Node.js',
                          'color': Colors.green,
                        },
                      ],
                    ),
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

class SkillCard extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> skills;

  const SkillCard({super.key, required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: skills.map((skill) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      skill['icon'],
                      size: 40,
                      color: skill['color'],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      skill['label'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
