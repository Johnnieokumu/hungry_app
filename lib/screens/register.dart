import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungry_app/screens/homepage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungry_app/screens/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegistrationState();
}

class _RegistrationState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Passwords do not match'),
            backgroundColor: Color.fromARGB(255, 136, 112, 76),
          ),
        );
        return;
      }

      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          // username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,
        );

        // Add user info to Firestore
        CollectionReference users = FirebaseFirestore.instance.collection('users');
        users.doc(userCredential.user!.uid).set({
          'email': emailController.text,
          'user': usernameController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Welcome to Rev Motors')),
        );

        // Navigate to the homepage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Homepage()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.restaurant),
           Text("Hungry App"),
        ],)
        
  
),
      backgroundColor: const Color.fromARGB(50, 106, 131, 179),
      body: Padding(
        padding: const EdgeInsets.all(100),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              
              // User to fill in email
              TextFormField(
                controller: emailController,
                validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
                decoration: const InputDecoration(
                  hoverColor: Colors.brown,
                  suffixIcon: Icon(Icons.email_rounded),
                  hintText: 'Enter Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              //User to choose username
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  
                  hoverColor: Colors.brown,
                  suffixIcon: Icon(Icons.email_rounded),
                  hintText: 'Enter Username',
                  border: OutlineInputBorder(),
                ),

              ),
              // User to enter password
              TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Password";
                  }
                  return null;
                },
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.security),
                  hoverColor: Colors.brown,
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Password";
                  }
                  return null;
                },
                obscureText: true,
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.security),
                  hoverColor: Colors.brown,
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: register,
                child: const Text('Register'),
                
                ),
                const SizedBox(height: 10,),
                TextButton(
                  onPressed: () {
            Navigator.pushReplacement(
              context,
             MaterialPageRoute(
              builder: (BuildContext context) => Login()
              )
              );
              },
            child: const Text('LogIn'),
                )
                ],
                ),
              ),
            
          ),
        );
      
  }
}
