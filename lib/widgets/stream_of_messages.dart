import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/widgets/message_bubble.dart';

class StreamOfMessages extends StatelessWidget {
  const StreamOfMessages({
    super.key,
    required this.firestore,
    required this.userId,
  });

  final FirebaseFirestore firestore;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        List<MessageBubble> messages = [];
        final messageSnapshot = snapshot.data;
        if (messageSnapshot != null) {
          String text;
          String sender;
          for (final message in messageSnapshot.docs) {
            text = message.get('text');
            sender = message.get('sender');
            messages.add(
              MessageBubble(text: text, sender: sender, currentUser: userId),
            );
          }
        }

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ListView(
              children: messages,
            ),
          ),
        );
      },
    );
  }
}
