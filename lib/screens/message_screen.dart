import 'package:flutter/material.dart';
import 'chat_screen.dart'; // Added import for navigation

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  // Dummy data for message threads
  final List<Map<String, String>> _messages = [
    {
      "name": "Bestfriend",
      "handle": "@urbf",
      "time": "10h",
      "message": "Tara kape!",
      "profileUrl": "https://image2url.com/r2/default/images/1772512232991-d21bc118-1fc4-4241-aba4-e9c34e8cd645.jpg",
    },
    {
      "name": "Yukio",
      "handle": "@kio",
      "time": "15h",
      "message": "I'm here at the beach!",
      "profileUrl": "https://image2url.com/r2/default/images/1772512018959-8eb33a80-d9fb-4632-a552-a3251a385fd0.jpg",
    },
    {
      "name": "Klera",
      "handle": "@klera_official",
      "time": "1d",
      "message": "I miss him, bro!",
      "profileUrl": "https://image2url.com/r2/default/images/1772511767880-1bd3b31d-fa61-45b1-8fc4-3dd6ea010d58.jpg",
    },
    {
      "name": "pau",
      "handle": "@itsurpau",
      "time": "2d",
      "message": "Hey, lets go hangout!.",
      "profileUrl": "https://image2url.com/r2/default/images/1772511595051-18d08ae5-1085-470e-92bc-7f5bd96f4671.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.5,
        title: const Text("Messages", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final message = _messages[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(message['profileUrl']!),
            ),
            title: Row(
              children: [
                Text(message['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                Text("${message['handle']!} · ${message['time']!}", style: const TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
            subtitle: Text(
              message['message']!,
              style: const TextStyle(color: Colors.grey, height: 1.4),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              // NEW: Navigation to Chat Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    name: message['name']!,
                    handle: message['handle']!,
                    profileUrl: message['profileUrl']!,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.mail_outline, color: Colors.white),
      ),
    );
  }
}