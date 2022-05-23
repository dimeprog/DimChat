import 'package:dimchat/widgets/chats/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {
  final Stream<QuerySnapshot> _chatStream = FirebaseFirestore.instance
      .collection('chat')
      .orderBy('createAt', descending: true)
      .snapshots();
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StreamBuilder<QuerySnapshot>(
          stream: _chatStream,
          builder: (context, chatSnapShot) {
            final documents = chatSnapShot.data?.docs;

            if (chatSnapShot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                reverse: true,
                itemCount: documents?.length,
                itemBuilder: (context, i) => chatSnapShot.data != null
                    ? ChatBubble(
                        documents?[i]['text'],
                        documents?[i]['userId'] == user!.uid,
                      )
                    : const Text('no chat yet'),
              );
            }
          }),
    );
  }
}
