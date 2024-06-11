import 'package:flutter/material.dart';
import 'dart:convert';
// import 'dart:io';
import 'package:http/http.dart' as http;
// import 'package:hungry_app/models/recipe_model.dart';
// import '';
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
           SizedBox(width: 20),
           Icon(Icons.notification_add),
        ],)
        
  
),

      body: Center(
      child: SizedBox(
            width: 200, // Width of the SizedBox
            height: 250, // Height of the SizedBox
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: const 
                    BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/image1.jpeg'),
                fit: BoxFit.cover, // Use BoxFit.cover to fill the container
              ),
            ),
                ),
                const SizedBox(height: 10), // Space between image and text
                const Text(
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
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String data = '';

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://api.spoonacular.com/recipes/complexSearch')
);
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body)['title'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: fetchData,
          child: const Text('Fetch Data'),
        ),
        const SizedBox(height: 20),
        Text(data),
      ],
    );
  }
}