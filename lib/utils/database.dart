import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OurDatabase {
  final FirebaseFirestore  _firestore = FirebaseFirestore.instance;
    Future<String> createUser(User user) async {
      String retVal = 'error';
      try {
        await _firestore
            .collection("users")
            .doc("uid")
            .set({'email': user.email});
      } catch (e) {
        print(e);
      }
      return retVal;
    }
  }
  
