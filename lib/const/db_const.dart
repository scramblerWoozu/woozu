import 'package:cloud_firestore/cloud_firestore.dart';

//firestore
final userRef = FirebaseFirestore.instance.collection('users');
final partnerRef = FirebaseFirestore.instance.collection('partner');
final popularMentorRef = FirebaseFirestore.instance.collection('popularMentor');