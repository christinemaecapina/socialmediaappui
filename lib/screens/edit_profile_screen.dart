import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Edit profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildChangeMedia('Change photo', Icons.camera_alt_outlined, 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&w=200&q=80'),
                _buildChangeMedia('Change video', Icons.videocam_outlined, null),
              ],
            ),
            const SizedBox(height: 30),
            _buildEditField('Name', 'Jacob West'),
            _buildEditField('Username', 'jacob_w'),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 16, top: 8, bottom: 8),
              child: Row(
                children: const [
                  Expanded(child: Text('tiktok.com/@jacob_w', style: TextStyle(color: Colors.black87))),
                  Icon(Icons.copy, size: 16, color: Colors.grey),
                ],
              ),
            ),
            _buildEditField('Bio', 'Add a bio to your profile'),
            const Divider(height: 40),
            _buildEditField('Instagram', 'Add Instagram to your profile'),
            _buildEditField('YouTube', 'Add YouTube to your profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildChangeMedia(String label, IconData icon, String? imageUrl) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
                image: imageUrl != null ? DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
                ) : null,
              ),
            ),
            Icon(icon, color: Colors.white, size: 30),
          ],
        ),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildEditField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        children: [
          SizedBox(width: 100, child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 15, color: value.contains('Add') ? Colors.grey : Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}
