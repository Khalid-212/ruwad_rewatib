import 'package:flutter/material.dart';
import 'package:ruwad_rewatib/widgets/core/NeumorphicActivityCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        child: ListView(
          children: [
            // Title
            Text(
              'Weekly Activities',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            const SizedBox(height: 20),
            // Weekly Tilawa
            NeumorphicActivityCard(
              context,
              title: 'Weekly Tilawa',
              icon: Icons.book,
            ),
            // Weekly Selat in Jema'a
            NeumorphicActivityCard(
              context,
              title: 'Weekly Selat in Jema\'a',
              icon: Icons.groups,
            ),
            // Weekly Witr
            NeumorphicActivityCard(
              context,
              title: 'Weekly Witr',
              icon: Icons.nights_stay,
            ),
            // Weekly Azkar
            NeumorphicActivityCard(
              context,
              title: 'Weekly Azkar',
              icon: Icons.self_improvement,
            ),
            // Weekly Fasting
            NeumorphicActivityCard(
              context,
              title: 'Weekly Fasting',
              icon: Icons.fastfood,
            ),
            // Weekly Sunnah Selat
            NeumorphicActivityCard(
              context,
              title: 'Weekly Sunnah Selat',
              icon: Icons.accessibility_new,
            ),
          ],
        ),
      ),
    );
  }
}
