import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.text,
    required this.sender,
  });

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueAccent,
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
