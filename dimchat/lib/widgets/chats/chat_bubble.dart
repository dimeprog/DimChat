import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String _chatMessage;
  final bool isMe;
  final String userName;
  final Key key;
  ChatBubble(this._chatMessage, this.isMe, this.userName, {required this.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft:
                    isMe ? const Radius.circular(12) : const Radius.circular(0),
                bottomRight:
                    isMe ? const Radius.circular(0) : const Radius.circular(0),
              ),
              color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMe ? Colors.black : Colors.white,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    _chatMessage,
                    style: TextStyle(
                      fontSize: 17,
                      // fontWeight: FontWeight.bold,
                      color: isMe ? Colors.black : Colors.pinkAccent,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
