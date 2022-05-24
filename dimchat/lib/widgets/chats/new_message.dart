import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Newessage extends StatefulWidget {
  @override
  State<Newessage> createState() => _NewessageState();
}

class _NewessageState extends State<Newessage> {
  var _messageText = '';
  final _textController = TextEditingController();

  void _SendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _messageText,
      'createAt': Timestamp.now(),
      'userId': user?.uid,
      'username': userData['username']
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'send message...',
                ),
                onChanged: (value) {
                  _messageText = value;
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Theme.of(context).primaryColor,
              ),
              onPressed:
                  _messageText.trim().isEmpty == null ? null : _SendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
