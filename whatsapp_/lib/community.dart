import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/model/chat.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: ((context, i) => const Column(
                children: [
                    Divider(
              height: 20.0,
            ),
                  ListTile(
               
                    leading: CircleAvatar(
                      maxRadius:25,
                      backgroundImage: NetworkImage("https://usercontent.one/wp/wabetainfo.com/wp-content/uploads/2021/11/WA_COMMUNITY_V1_FB.png"),
                    ),
                    title: Row(children: [
                Text(
                 'New Community',
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                
              ],
              ),
                  ),
                  Divider(),
                  ListTile(
               
                    leading: CircleAvatar(
                      maxRadius:25,
                      backgroundImage: NetworkImage("https://media.licdn.com/dms/image/C4D0BAQHLdCQybVwt4A/company-logo_200_200/0/1657188725201?e=2147483647&v=beta&t=kYUWnHqfxo7QIQMwV1mYChG49hoHoK0Gyb5T37rv0s8"),
                    ),
                    title: Row(children: [
                Text(
                 'Eazr',
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                
              ],
              ),
                  ),
                ],
              )
              ),
              ),
    );
  }
}
