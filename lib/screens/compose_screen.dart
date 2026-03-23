import 'package:flutter/material.dart';

class ComposeScreen extends StatefulWidget {
  const ComposeScreen({super.key});

  @override
  State<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<ComposeScreen> {
  // We use a TextEditingController to listen to and control the text input field
  final TextEditingController _postTextController = TextEditingController();
  
  // This variable stores the URL of the image we "picked" or simulated picking
  String _selectedImageUrl = ''; 

  // Function called when the user clicks the "Post" button
  void _handlePostAction() {
    // We send back a Map containing the text and the image URL to the previous screen
    Navigator.pop(context, {
      'postText': _postTextController.text,
      'postImage': _selectedImageUrl,
    });
  }

  // Simulates selecting an image from the phone's gallery
  void _simulateImageSelection() {
    setState(() {
      // For demo purposes, we just use a random image from picsum
      _selectedImageUrl = 'https://picsum.photos/seed/xclone/600/400';
    });
  }

  @override
  void dispose() {
    _postTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Logic to enable the post button: only if there is text or an image
    bool isReadyToPost = _postTextController.text.trim().isNotEmpty || _selectedImageUrl.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        // The leading 'close' icon cancels the compose action
        leading: IconButton(
          icon: const Icon(Icons.close), 
          onPressed: () => Navigator.pop(context),
          tooltip: "Cancel",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: ElevatedButton(
              onPressed: isReadyToPost ? _handlePostAction : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                disabledBackgroundColor: Colors.blueAccent.withAlpha(100),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 0,
              ),
              child: const Text("Post", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage('https://image2url.com/r2/default/images/1771919943834-0ba1ef41-f512-45e6-85ed-6e6cf2e34de0.jpg'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _postTextController,
                        onChanged: (value) => setState(() {}), // Refresh UI to update the 'Post' button state
                        maxLines: null,
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                        decoration: const InputDecoration(
                          hintText: "What's happening?", 
                          hintStyle: TextStyle(color: Colors.grey), 
                          border: InputBorder.none,
                        ),
                      ),
                      // If an image is selected, show a preview with a remove button
                      if (_selectedImageUrl.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                _selectedImageUrl, 
                                fit: BoxFit.cover, 
                                width: double.infinity, 
                                height: 200,
                              ),
                            ),
                            Positioned(
                              top: 8, right: 8,
                              child: GestureDetector(
                                onTap: () => setState(() => _selectedImageUrl = ''),
                                child: const CircleAvatar(
                                  radius: 14, 
                                  backgroundColor: Colors.black54,
                                  child: Icon(Icons.close, color: Colors.white, size: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Bottom toolbar for adding media
            Row(
              children: [
                IconButton(
                    onPressed: _simulateImageSelection,
                    icon: const Icon(Icons.image, color: Colors.blueAccent),
                    tooltip: "Add Image",
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.gif_box, color: Colors.blueAccent)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.poll, color: Colors.blueAccent)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.location_on, color: Colors.blueAccent)),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
