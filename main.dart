import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Reciprocal College',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final List<Map<String, String>> colleges = [
    {
      'name': 'College of Computer Studies',
      'image': 'https://via.placeholder.com/100',
      'intro': 'Welcome to the College of Engineering!',
    },
    {
      'name': 'College of Accounting',
      'image': 'https://via.placeholder.com/100',
      'intro': 'Explore the world of Business and Management.',
    },
    {
      'name': 'College of Education',
      'image': 'https://via.placeholder.com/100',
      'intro': 'Unleash your creativity in the College of Arts.',
    },
    {
      'name': 'College of Business Administration Education',
      'image': 'https://via.placeholder.com/100',
      'intro': 'Dive into discovery at the College of Science.',
    },
  ];

  void _handleClick(BuildContext context, String logoName, String imageUrl,
      String introduction) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogoPage(
          logoName: logoName,
          imageUrl: imageUrl,
          introduction: introduction,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Global Reciprocal College'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _handleClick(
                  context,
                  'College of Education',
                  'https://via.placeholder.com/100',
                  'This is College of Education',
                ),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black38, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://yt3.googleusercontent.com/ytc/AIdro_kQFQKAvUvEKH9qCIpryzJgcPOvD2Sqa8oKy6LZqALHnw=s900-c-k-c0x00ffffff-no-rj',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'GRC',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Empowering Future Leaders',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 30),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: colleges.map((college) {
                  return GestureDetector(
                    onTap: () => _handleClick(
                      context,
                      college['name']!,
                      college['image']!,
                      college['intro']!,
                    ),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image.network(
                            college['image']!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          college['name']!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoPage extends StatelessWidget {
  final String logoName;
  final String imageUrl;
  final String introduction;

  LogoPage({
    required this.logoName,
    required this.imageUrl,
    required this.introduction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(logoName),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.network(imageUrl, height: 150),
            SizedBox(height: 20),
            Text(
              introduction,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
