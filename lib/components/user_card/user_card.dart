import 'package:flutter/material.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/pages/user_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.partner,
  }) : super(key: key);

  final Map<String, dynamic> partner;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserDetailPage(partner: partner)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                height: 140,
                child: CachedNetworkImage(
                  imageUrl: partner['profileImg'],
                  imageBuilder: ((context, imageProvider) => Container(
                        width: double.infinity,
                        height: 140,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      )),
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                      color: primary,
                    ), // you can add pre loader iamge as well to show loading.
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      partner['partnerName'],
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text('Job :' + partner['job'],
                        style: TextStyle(fontSize: 12)),
                    SizedBox(
                      height: 2,
                    ),
                    Text('category : ' + partner['category'],
                        style: TextStyle(fontSize: 12)),
                    SizedBox(height: 2),
                    Spacer(),
                    Divider(
                      color: secondary,
                    ),
                    SizedBox(height: 2),
                    Text(
                      'English : ' + partner['englishLevel'],
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
