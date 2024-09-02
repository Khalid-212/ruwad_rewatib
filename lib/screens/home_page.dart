import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruwad_rewatib/services/auth_service.dart';
import 'package:ruwad_rewatib/services/database_service.dart'; // Import the DatabaseService
import 'package:ruwad_rewatib/widgets/core/NeumorphicActivityCard.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DateTime _currentDate = DateTime.now();
  final _ratings = <String, int>{
    'Weekly Tilawa': 0,
    'Weekly Selat in Jema\'a': 0,
    'Weekly Witr': 0,
    'Weekly Azkar': 0,
    'Weekly Fasting': 0,
    'Weekly Sunnah Selat': 0,
  };

  Future<void> _submitRatings() async {
    try {
      await DatabaseService().submitRatings(_ratings);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ratings submitted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit ratings')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 72, 78),
        title: const Text('Rewatib Tracker'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Weekly Activities',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 43, 72, 78),
                    ),
              ),
              const SizedBox(height: 20),
              Text(
                _currentDate.toString().characters.take(10).toString(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              const SizedBox(height: 20),
              // NeumorphicActivityCard widgets
              NeumorphicActivityCard(
                title: 'Weekly Tilawa',
                icon: Icons.book,
                initialRating: _ratings['Weekly Tilawa']!,
                onRatingChanged: (newRating) {
                  setState(() {
                    _ratings['Weekly Tilawa'] = newRating;
                  });
                },
              ),
              NeumorphicActivityCard(
                title: 'Weekly Selat in Jema\'a',
                icon: Icons.groups,
                initialRating: _ratings['Weekly Selat in Jema\'a']!,
                onRatingChanged: (newRating) {
                  setState(() {
                    _ratings['Weekly Selat in Jema\'a'] = newRating;
                  });
                },
              ),
              NeumorphicActivityCard(
                title: 'Weekly Witr',
                icon: Icons.nights_stay,
                initialRating: _ratings['Weekly Witr']!,
                onRatingChanged: (newRating) {
                  setState(() {
                    _ratings['Weekly Witr'] = newRating;
                  });
                },
              ),
              NeumorphicActivityCard(
                title: 'Weekly Azkar',
                icon: Icons.self_improvement,
                initialRating: _ratings['Weekly Azkar']!,
                onRatingChanged: (newRating) {
                  setState(() {
                    _ratings['Weekly Azkar'] = newRating;
                  });
                },
              ),
              NeumorphicActivityCard(
                title: 'Weekly Fasting',
                icon: Icons.fastfood,
                initialRating: _ratings['Weekly Fasting']!,
                onRatingChanged: (newRating) {
                  setState(() {
                    _ratings['Weekly Fasting'] = newRating;
                  });
                },
              ),
              NeumorphicActivityCard(
                title: 'Weekly Sunnah Selat',
                icon: Icons.accessibility_new,
                initialRating: _ratings['Weekly Sunnah Selat']!,
                onRatingChanged: (newRating) {
                  setState(() {
                    _ratings['Weekly Sunnah Selat'] = newRating;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitRatings,
                child: const Text('Submit Ratings'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await AuthService().signout(context);
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
