import 'package:flutter/material.dart';
import 'package:to_do_list/infrastructure/presentation/auth/register_screen.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/button_widget.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> _login() async {

  }

  @override
  Widget build(BuildContext context) {
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
                prefixIcon: Icons.email,
                hint: "Email",
              ),

              const SizedBox(height: 10),
              
              // Password
              TextFieldWidget(
                controller: _controllerPassword, 
                prefixIcon: Icons.password,
                hint: "Password",
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

              OutlinedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  side: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Doesn't have an account? ",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                        fontFamily: 'Lao Muang Don',
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}