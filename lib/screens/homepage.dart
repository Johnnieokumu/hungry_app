import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.restaurant),
           Text("Hungry App"),
        ],)
        
  
),

      body: const Center(
      child: SizedBox(
            width: 200, // Width of the SizedBox
            height: 250, // Height of the SizedBox
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                SizedBox(height: 10), // Space between image and text
                Text(
                  'Your Text Here',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
      ),
    ),
    );
  }
}
