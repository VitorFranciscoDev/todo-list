import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/domain/entities/user.dart';
import 'package:to_do_list/infrastructure/presentation/auth/auth_state.dart';
import 'package:to_do_list/infrastructure/presentation/auth/login_screen.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/button_widget.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/outlined_button_widget.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/textfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // Clean all fields
  void clearFields() {
    setState(() {
      _controllerName.clear();
      _controllerEmail.clear();
      _controllerPassword.clear();
    });
  }

  // Try to Register
  Future<void> _addUser() async {
    final provider = context.read<AuthProvider>();

    // Validate Fields
    final isValid = provider.validateRegisterFields(_controllerName.text, _controllerEmail.text, _controllerPassword.text);

    if(!isValid) return;

    final user = User(name: _controllerName.text, email: _controllerEmail.text, password: _controllerPassword.text);

    try {
      // Call Provider to Add User In DB
      final index = await provider.addUser(user);

      if(index > 0) {
        // Navigate to Login Screen
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));

        // Clean Fields and Errors
        clearFields();
        provider.clearErrors();
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
              // Name
              TextFieldWidget(
                controller: _controllerName, 
                hint: "John",
                error: provider.errorName,
              ),

              const SizedBox(height: 10),

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
                function: _addUser, 
                message: "Sign Up",
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

              // Navigate to Login Button
              OutlinedButtonWidget(
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  clearFields();
                  provider.clearErrors();
                }, 
                message1: "Already have an account? ", 
                message2: "Sign In",
              ),
            ],
          ),
        ),
      ),
    );
  }
}