// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:whatsapp/model/chat.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: messageData.length,
        itemBuilder: (context, i) => Column(
          children: [
            Divider(
              height: 20.0,
            ),
            ListTile(
              leading: CircleAvatar(
                maxRadius: 25,
                backgroundImage: NetworkImage(messageData[i].imageUrl),
              ),
              title: Row(children: [
                Text(
                  messageData[i].name,
                  style:
                      const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  messageData[i].time,
                  style: const TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
              ],
              ),
              subtitle: Container(padding:const EdgeInsets.only(top: 5.0),
              child: Text(messageData[i].message,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
              ),
              ),
              ),
              onTap: (){
                },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Theme.of(context).hintColor,
        onPressed: () {
          print('Button pressed');
        },
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}
