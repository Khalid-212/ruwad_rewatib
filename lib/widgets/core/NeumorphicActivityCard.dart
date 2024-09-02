import 'package:flutter/material.dart';

class NeumorphicActivityCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final int initialRating;
  final ValueChanged<int> onRatingChanged;

  const NeumorphicActivityCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.initialRating,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  _NeumorphicActivityCardState createState() => _NeumorphicActivityCardState();
}

class _NeumorphicActivityCardState extends State<NeumorphicActivityCard> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  void _updateRating(int newRating) {
    setState(() {
      _rating = newRating;
    });
    widget.onRatingChanged(newRating);
  }

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
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
                child: Icon(
                  widget.icon,
                  color: const Color.fromARGB(255, 43, 72, 78),
                ),
              ),
            ),
            title: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 43, 72, 78),
                  ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(5, (index) {
              final int ratingValue = index + 1;
              return IconButton(
                icon: Icon(
                  ratingValue <= _rating ? Icons.star : Icons.star_border,
                ),
                color: Colors.amber,
                onPressed: () => _updateRating(ratingValue),
              );
            }),
          ),
        ],
      ),
    );
  }
}
