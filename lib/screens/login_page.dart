import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ruwad_rewatib/services/auth_service.dart';
import 'package:ruwad_rewatib/widgets/core/NeumorphicTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 72, 78),
        title: const Text('Rewatib Tracker'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
            const SizedBox(height: 40),
            // Welcome Text
            Text(
              'Welcome Back!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1C4B5F),
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Please sign in to continue',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const SizedBox(height: 40),
            // Username Field
            NeumorphicTextField(
              context,
              controller: _emailController,
              labelText: 'email',
              icon: Icons.person,
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
            const SizedBox(height: 40),
            // Sign in Button
            ElevatedButton(
              onPressed: () async {
                await AuthService().signin(
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
                'Sign In',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            // Sign up Button
            TextButton(
              onPressed: () {
                context.go('/signup');
              },
              child: Text(
                'Don\'t have an account? Sign Up',
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
