import 'package:cloud_firestore/cloud_firestore.dart';

//firestore
final userRef = FirebaseFirestore.instance.collection('users');
final couponRef = FirebaseFirestore.instance.collection('coupon');
final partnerRef = FirebaseFirestore.instance.collection('partner');
final popularMentorRef = FirebaseFirestore.instance.collection('popularMentor');
final reservationRef = FirebaseFirestore.instance.collection('reservation');
