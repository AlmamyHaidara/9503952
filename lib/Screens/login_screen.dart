import 'package:depence_manager/Screens/home_screen.dart';
import 'package:depence_manager/utils/share_preferences.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  void login() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      print(emailController.text);
      print(passwordController.text);

      if (emailController.text == 'test@test.com' &&
          passwordController.text == 'test') {
        SharedPreferenceService.setValue(
          "token",
          "fcnjkwhfsjljweofji1qoi9eo`jdoi`j9e`89ej",
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),

            content: Text('Email ou mot de passe incorrect'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      print('Error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email ou mot de passe incorrect'),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DPM",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 30,
                    fontFamily: "Cardo",
                  ),
                ),
                // Image.asset('assets/images/logo.png'),
                SizedBox(height: 20),
                Text("Bienvenue dans l'application de gestion de depance"),
                // SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 200,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.visibility),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.white,
                          ),

                          child:
                              _isLoading
                                  ? const CircularProgressIndicator()
                                  : const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text('Se connecter'),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
