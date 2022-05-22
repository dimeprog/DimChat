import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  final Stream<QuerySnapshot> _chatStream =
      FirebaseFirestore.instance.collection('chat').snapshots();

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
                itemCount: documents?.length,
                itemBuilder: (context, i) => Container(
                  child: chatSnapShot.data != null
                      ? Text(
                          documents?[i]['text'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Text('No chat yet'),
                ),
              );
            }
          }),
    );
  }
}
