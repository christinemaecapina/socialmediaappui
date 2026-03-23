import 'package:flutter/material.dart';
import '../models/post_data.dart';
import '../widgets/post_widget.dart';

class PostDetailScreen extends StatelessWidget {
  final PostData post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Post", style: TextStyle(color: Colors.white)),
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // The Main Post
                PostWidget(data: post),
                const Divider(color: Colors.grey, thickness: 0.2, height: 1),

                // Placeholder for Replies
                _buildReplyPlaceholder(),
                _buildReplyPlaceholder(),
                _buildReplyPlaceholder(),
              ],
            ),
          ),
          // Reply Input Field at the bottom
          _buildReplyInput(),
        ],
      ),
    );
  }

  Widget _buildReplyPlaceholder() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.withAlpha(40), width: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://picsum.photos/seed/user/100'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text("Random User", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(width: 4),
                    Text("@random · 2h", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Text("Replying to ${post.handle}", style: const TextStyle(color: Colors.blueAccent, fontSize: 13)),
                const SizedBox(height: 4),
                const Text("This is a simulated reply to the post!", style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildReplyInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.2)),
        color: Colors.black,
      ),
      child: SafeArea(
        child: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://image2url.com/r2/default/images/1771919943834-0ba1ef41-f512-45e6-85ed-6e6cf2e34de0.jpg'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Post your reply",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: Colors.blueAccent),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}