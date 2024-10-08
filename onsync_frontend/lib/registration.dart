import 'package:flutter/material.dart';
import 'api_service.dart';
import 'dashboard.dart';
import 'Login.dart';

class RegistrationPage extends StatefulWidget {
  final ApiService apiService;

  const RegistrationPage({super.key, required this.apiService});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _register() async {
    final email = _emailController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    final response =
        await widget.apiService.register(email, username, password);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(
            apiService: widget.apiService,
            userInfo: {
              'email': email,
              'username': username,
              'password': password,
            },
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register: ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01204E),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Registration',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign up to create your account',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              _buildTextField('Enter your email', _emailController),
              const SizedBox(height: 16),
              _buildTextField('Enter new username', _usernameController),
              const SizedBox(height: 16),
              _buildTextField('Enter new password', _passwordController,
                  obscureText: true),
              const SizedBox(height: 16),
              _buildTextField(
                  'Re-enter new password', _confirmPasswordController,
                  obscureText: true),
              const SizedBox(height: 24),
              _buildButton(
                  'Create Account', const Color(0xFFC19A6B), _register),
              const SizedBox(height: 16),
              const Text(
                'Already have an account?',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              _buildButton('Login', const Color(0xFFC19A6B), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginScreen(apiService: widget.apiService)),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white24,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
