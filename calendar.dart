import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DateCalculatorApp());
}

class DateCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leap Year Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DateCalculatorHomePage(),
    );
  }
}

class DateCalculatorHomePage extends StatefulWidget {
  @override
  _DateCalculatorHomePageState createState() => _DateCalculatorHomePageState();
}

class _DateCalculatorHomePageState extends State<DateCalculatorHomePage> {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  String result = '';
  String fact = '';

  @override
  void initState() {
    super.initState();
    displayRandomFact();
  }

  void calculateDate() {
    final int dayOfYear = int.tryParse(dayController.text) ?? 0;
    final int year = int.tryParse(yearController.text) ?? 0;

    if (dayOfYear < 1 || dayOfYear > (isLeapYear(year) ? 366 : 365)) {
      setState(() {
        result =
            'Invalid input. Please enter a valid day of the year and year.';
      });
      return;
    }

    final DateTime startDate = DateTime(year, 1, 1);
    final DateTime date = startDate.add(Duration(days: dayOfYear - 1));

    final String dateString =
        '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

    final int weekNumber = ((date.difference(DateTime(date.year, 1, 1)).inDays +
                DateTime(date.year, 1, 1).weekday) /
            7)
        .ceil();

    setState(() {
      result = '''
        Date: $dateString
        Week of the Year: $weekNumber
        Leap Year: ${isLeapYear(year) ? 'Yes' : 'No'}
      ''';
    });
  }

  bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  void displayRandomFact() {
    final List<String> facts = [
      "The leap year was introduced by Julius Caesar in 45 BCE.",
      "February 29 is often called Leap Day.",
      "In the Gregorian calendar, a year must be divisible by 400 to be a leap year if it is divisible by 100.",
      "Leap years keep our calendar aligned with the Earth's revolutions around the Sun.",
      "The chances of being born on a leap day are about 1 in 1,461."
    ];
    final String randomFact = facts[Random().nextInt(facts.length)];
    setState(() {
      fact = 'Did you know? $randomFact';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0f7fa),
      appBar: AppBar(
        title: Text('Date Calculator'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 30,
            child: Sun(),
          ),
          Positioned(
            top: 100,
            right: 30,
            child: Cloud(),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFB2EBF2), Color(0xFF80DEEA)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.yellow.shade300,
                        child: Text(
                          'Leap Year Calculator',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: dayController,
                        decoration: InputDecoration(
                          labelText: 'Day of the Year',
                          labelStyle: TextStyle(color: Colors.teal),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal.shade700),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.teal.shade50,
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.teal.shade700),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: yearController,
                        decoration: InputDecoration(
                          labelText: 'Year',
                          labelStyle: TextStyle(color: Colors.teal),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal.shade700),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.teal.shade50,
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.teal.shade700),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: calculateDate,
                        child: Text('Calculate'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade700,
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          result,
                          style: TextStyle(
                            color: Colors.teal.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          fact,
                          style: TextStyle(
                            color: Colors.amber.shade700,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.yellow.withOpacity(0.6),
            spreadRadius: 10,
            blurRadius: 20,
          ),
        ],
      ),
    );
  }
}

class Cloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 40,
            blurRadius: 40,
            offset: Offset(40, 0),
          ),
        ],
      ),
    );
  }
}

class CoconutTree extends StatelessWidget {
  final bool isFlipped;

  CoconutTree({this.isFlipped = false});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationY(isFlipped ? pi : 0),
      alignment: Alignment.center,
      child: Icon(
        Icons.local_florist,
        size: 150,
        color: Colors.brown,
      ),
    );
  }
}
