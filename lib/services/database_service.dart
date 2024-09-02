import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Reference to the user's ratings document
  CollectionReference get _ratingsCollection => _db.collection('ratings');

  Future<void> submitRatings(Map<String, int> ratings) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('User not logged in');
      }

      final uid = user.uid;
      final ratingsRef = _ratingsCollection.doc('tBWJHszIm7NLmciIgdXI');

      await ratingsRef.set({
        'ratings': ratings,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error submitting ratings: $e');
      throw e;
    }
  }
}
