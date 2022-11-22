import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woozu/components/appbar/main_appbar.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/const/db_const.dart';
import 'package:woozu/model/reservation_model.dart';
import 'package:woozu/provider/user_service.dart';
import 'package:woozu/repository/reservation_repository.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> reservationStream = reservationRef
        .where('inviteeEmail',
            isEqualTo: context.watch<UserService>().user.email)
        .snapshots();

    return Scaffold(
      backgroundColor: white,
      appBar: MainAppBar(appBar: AppBar(), isLeading: false),
      body: StreamBuilder<QuerySnapshot>(
        stream: reservationStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    const CircularProgressIndicator(color: Color(0xFFFFF4CB)));
          } else {
            List<ReservationModel> reservationListData = [];
            for (var element in snapshot.data!.docs) {
              ReservationModel reservationData =
                  ReservationModel.fromDoc(element.data());
              reservationListData.add(reservationData);
            }

            List<ReservationModel> sortedReservationData =
                ReserveRepository().sortingDateList(reservationListData);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8, //수직 Padding
                ),
                itemCount: sortedReservationData.length,
                itemBuilder: (BuildContext context, int index) {
                  ReservationModel data = sortedReservationData[index];

                  String localTime =
                      ReserveRepository().timeformat(data.dateTime);
                  bool isPassed =
                      ReserveRepository().isPassedReservation(data.dateTime);

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(data.reserveTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          SizedBox(height: 8),
                          Text(localTime),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              isPassed == false
                                  ? Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: black,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Text(
                                          'Reservated',
                                          style: TextStyle(
                                              color: white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: secondary,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Text(
                                          'Passed',
                                          style: TextStyle(
                                              color: white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
