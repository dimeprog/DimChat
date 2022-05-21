import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/firestore.dart';
// import 'package:firebase/firebase.dart';
// import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Stream<QuerySnapshot> _chatStream = FirebaseFirestore.instance
      .collection('chats/m37h87KVuISObX0zu61n/messages')
      .snapshots();
  final chatHandler = FirebaseFirestore.instance
      .collection('chats/m37h87KVuISObX0zu61n/messages');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: _chatStream,
            builder: (context, querySnapShot) {
              final documents = querySnapShot.data?.docs;
              print(documents?[0]['text']);
              // print(documents?[1]['text']);

              if (querySnapShot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: documents?.length,
                  itemBuilder: (context, i) => Container(
                    child: Text(
                      documents?[i]['text'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          chatHandler
              .add({
                'text': 'added by clicking button',
              })
              .then((value) => print('successfully added'))
              .onError(
                (error, stackTrace) => print('$error'),
              );
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
