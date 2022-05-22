import 'package:dimchat/widgets/chats/messages.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      appBar: AppBar(
        title: Text('dimChat'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                value: 'Logout',
                child: Container(
                  child: const Text('Logout'),
                ),
              )
            ],
            onChanged: (itemValue) {
              if (itemValue == 'Logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Messages(),
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
