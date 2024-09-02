import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ruwad_rewatib/services/auth_service.dart';
import 'package:ruwad_rewatib/widgets/core/NeumorphicTextField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 72, 78),
        title: const Text('Rewatib Tracker'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/logo.png', // Replace with your actual logo path
                  height: 80,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Welcome Text
            Text(
              'Create Your Account',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1C4B5F),
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Please fill in the details below to sign up',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const SizedBox(height: 40),
            // Username Field
            NeumorphicTextField(
              context,
              controller: _usernameController,
              labelText: 'Username',
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            // Email Field
            NeumorphicTextField(
              context,
              controller: _emailController,
              labelText: 'Email',
              icon: Icons.email,
            ),
            const SizedBox(height: 20),
            // Password Field
            NeumorphicTextField(
              context,
              controller: _passwordController,
              labelText: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // Confirm Password Field
            NeumorphicTextField(
              context,
              controller: _confirmPasswordController,
              labelText: 'Confirm Password',
              icon: Icons.lock_outline,
              obscureText: true,
            ),
            const SizedBox(height: 40),
            // Sign up Button
            ElevatedButton(
              onPressed: () async {
                await AuthService().signup(
                  context: context,
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xFF1C4B5F),
              ),
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            // Sign in Button
            TextButton(
              onPressed: () {
                context.go('/');
              },
              child: Text(
                'Already have an account? Sign In',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF1C4B5F),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
