
  import 'package:flutter/material.dart';

Widget NeumorphicActivityCard(
    BuildContext context, {
    required String title,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: Icon(icon, color: Theme.of(context).primaryColor),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Handle navigation to detailed tracking page
        },
      ),
    );
  }