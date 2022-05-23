import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String _chatMessage;
  final bool isMe;
  ChatBubble(
    this._chatMessage,
    this.isMe,
  );
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
              borderRadius: BorderRadius.circular(12),
              color: isMe
                  ? Colors.grey[300]
                  : Theme.of(context).accentTextTheme.headline1!.color,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Text(
                _chatMessage,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isMe ? Colors.black : Colors.pinkAccent,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
