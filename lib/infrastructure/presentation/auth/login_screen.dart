import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/infrastructure/presentation/auth/auth_state.dart';
import 'package:to_do_list/infrastructure/presentation/auth/register_screen.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/bottom-navigator/bottom_navigator.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/button_widget.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/outlined_button_widget.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // Clean all fields
  void clearFields() {
    setState(() {
      _controllerEmail.clear();
      _controllerPassword.clear();
    });
  }

  // Try to Log In
  Future<void> _login() async {
    final provider = context.read<AuthProvider>();

    // Validate Fields
    final isValid = provider.validateLoginFields(_controllerEmail.text, _controllerPassword.text);

    if(!isValid) return;

    try {
      // Call Provider to Log In
      final user = provider.login(_controllerEmail.text, _controllerPassword.text);

      if(user != null) {
        // Navigate to Home Screen
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigator()));

        // Clean Fields and Errors
        clearFields();

      } else {
        // User Not Found
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.error, color: Colors.redAccent),
                SizedBox(width: 8),
                Text("Email or Password Invalid.", style: TextStyle(color: Colors.black)),
              ],
            ),
            backgroundColor: Colors.white,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      }
    } catch(e) {
      // Unexpected Error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.redAccent),
              SizedBox(width: 8),
              Text("Unexpected Error.", style: TextStyle(color: Colors.black)),
            ],
          ),
          backgroundColor: Colors.white,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email
              TextFieldWidget(
                controller: _controllerEmail, 
                hint: "your@email.com",
                error: provider.errorEmail,
              ),

              const SizedBox(height: 10),
              
              // Password
              TextFieldWidget(
                controller: _controllerPassword, 
                hint: "password",
                error: provider.errorPassword,
              ),

              const SizedBox(height: 10),

              // Login Button
              ButtonWidget(
                function: _login, 
                message: "Log In",
              ),

              const SizedBox(height: 20),

              // Divider
              Row(
                children: [
                  Expanded(child: Divider()),
                  const SizedBox(width: 10),
                  const Text("or"),
                  const SizedBox(width: 10),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 20),

              OutlinedButtonWidget(
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                  clearFields();
                  //provider.clearErrors();
                }, 
                message1: "Doesn't have an account? ", 
                message2: "Sign Up",
              ),
            ],
          ),
        ),
      ),
    );
  }
}