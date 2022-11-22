//현재위치 받아오는 패키지

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:woozu/model/reservation_model.dart';

class ReserveRepository {
  //google sign in

  DateTime timeStampToDateTime(Timestamp dateTime) {
    DateTime parseDate = DateTime.parse(dateTime.toDate().toString());
    final kTime = DateTime(parseDate.year, parseDate.month, parseDate.day,
        parseDate.hour, parseDate.minute, parseDate.second);
    final utcTime = kTime.toUtc();
    final localTime = utcTime.toLocal();

    return localTime;
  }

  String timeformat(Timestamp dateTime) {
    DateTime localTime = timeStampToDateTime(dateTime);
    String finalTime = DateFormat.yMd().add_Hm().format(localTime);

    return finalTime;
  }

  bool isPassedReservation(Timestamp dateTime) {
    DateTime localTime = timeStampToDateTime(dateTime);
    DateTime currentTime = DateTime.now();

    if (localTime.compareTo(currentTime) > 0) {
      return false;
    } else {
      return true;
    }
  }

  List<ReservationModel> sortingDateList(List<ReservationModel> reservation) {
    reservation.sort((b, a) => a.dateTime.compareTo(b.dateTime));
    for (var element in reservation) {
      print(element.dateTime.toDate());
    }
    return reservation;
  }
}
