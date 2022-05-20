import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i) => Container(
          child: const Text('This works'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          FirebaseFirestore.instance
              .collection('chats/r7FjoYFQvz50agg4lv1O/messages')
              .snapshots()
              .listen((data) {
            print(data.docs[0]['text']);
          });
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}
