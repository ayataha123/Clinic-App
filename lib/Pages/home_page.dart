import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id="Home Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VCare',style: TextStyle(fontSize: 20,color: Colors.white),),
        backgroundColor: Color(0xff174068),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}