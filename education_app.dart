import 'package:flutter/material.dart';

void main() {
  runApp(EducationalWebsite());
}

class EducationalWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Developer Student Clubs ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Developer Student Clubs'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
            FeaturedCoursesSection(),
            AboutUsSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.blueAccent,
      child: Column(
        children: [
          Text(
            'Welcome to NMIMS-GDSC',
            style: TextStyle(fontSize: 28, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Empowering you with the knowledge you need to succeed.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class FeaturedCoursesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Courses',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          CourseCard(
            title: 'Flutter Development',
            description: 'Learn to build beautiful and responsive apps with Flutter.',
            duration: '8 weeks',
            backgroundColor: Colors.orangeAccent,
          ),
          CourseCard(
            title: 'Data Science with Python',
            description: 'Master data analysis, visualization, and machine learning.',
            duration: '12 weeks',
            backgroundColor: Colors.lightGreen,
          ),
          CourseCard(
            title: 'Web Development Bootcamp',
            description: 'Become a full-stack web developer with this comprehensive course.',
            duration: '10 weeks',
            backgroundColor: Colors.lightBlueAccent,
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final Color backgroundColor;

  CourseCard({
    required this.title,
    required this.description,
    required this.duration,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(description),
            SizedBox(height: 5),
            Text('Duration: $duration'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement enrollment functionality
              },
              child: Text('Enroll Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Us',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'We are dedicated to providing high-quality educational resources to help you achieve your goals. Our team of experienced educators and industry professionals is committed to your success.',
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.grey[200],
      child: Column(
        children: [
          Text('Contact Us: vallarisharma25@gmail.com'),
          SizedBox(height: 5),
          Text('© 2024 Educational Website'),
        ],
      ),
    );
  }
}
