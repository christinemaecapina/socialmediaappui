import 'package:flutter/material.dart';
import '../models/post_data.dart';
import '../widgets/post_widget.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dynamically fetch posts that have isBookmarked set to true
    List<PostData> bookmarkedPosts = dummyPosts.where((post) => post.isBookmarked).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bookmarks", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
            Text("@tin", style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: bookmarkedPosts.isEmpty
          ? const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Save posts for later", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              SizedBox(height: 12),
              Text("Don't let the good ones fly away! Bookmark Posts to easily find them again in the future.",
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 16)),
            ],
          ),
        ),
      )
          : ListView.builder(
        itemCount: bookmarkedPosts.length,
        itemBuilder: (context, index) => PostWidget(
          data: bookmarkedPosts[index],
        ),
      ),
    );
  }
}