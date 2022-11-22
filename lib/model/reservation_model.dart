import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationModel {
  Timestamp dateTime;
  String inviteeEmail;
  String inviteeName;
  String reservationId;
  String reserveTitle;
  String zoomLink;

  //생성자
  ReservationModel({
    required this.dateTime,
    required this.inviteeEmail,
    required this.inviteeName,
    required this.reservationId,
    required this.reserveTitle,
    required this.zoomLink,
  });

  factory ReservationModel.fromDoc(reservationDoc) {
    return ReservationModel(
      dateTime: reservationDoc['dateTime'] ?? '',
      inviteeEmail: reservationDoc['inviteeEmail'] ?? '',
      inviteeName: reservationDoc!['inviteeName'] ?? '',
      reservationId: reservationDoc['reservationId'] ?? '',
      reserveTitle: reservationDoc['reserveTitle'] ?? '',
      zoomLink: reservationDoc['zoomLink'] ?? '',
    );
  }
}
