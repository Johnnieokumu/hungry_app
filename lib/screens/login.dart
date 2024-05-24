
import 'package:hungry_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hungry_app/screens/register.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   final TextEditingController usernameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

   void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const Homepage(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color.fromARGB(255, 107, 88, 60),
            content: Text(e.message ?? 'Login failed'),
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
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
      backgroundColor: Color.fromARGB(49, 214, 207, 168),
      body: Padding(padding: const EdgeInsets.all(50),
        child:
          Form(
            key: _formKey,
            child:Column(children: [ 
          
       TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hoverColor: Colors.green,
                  suffixIcon: Icon(Icons.email_outlined),
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
       TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hoverColor: Colors.green,
                  suffixIcon: Icon(Icons.lock_outline),
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: const Text('Log In'),
                    ),
              const SizedBox(height: 15),
      
        RichText(
     text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Dont Have An Account?',),
      
      
    ],
    
    
  ),
        ),
        TextButton(
      onPressed:(){
      Navigator.pushReplacement(
              context,
             MaterialPageRoute(
              builder: (BuildContext context) => Register()
              )
              );
              
    },
          child: Text('Register Here'),
    ),
        
        ]
            )
      )
      ),
      
      );
    
    
    
  }
}
