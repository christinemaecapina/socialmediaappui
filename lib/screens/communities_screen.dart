import 'package:flutter/material.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.5,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          // Uses Builder to ensure Scaffold.of(context) finds the parent Scaffold with a Drawer if one exists
          child: GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://image2url.com/r2/default/images/1771919943834-0ba1ef41-f512-45e6-85ed-6e6cf2e34de0.jpg'),
            ),
          ),
        ),
        title: const Text("Communities", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.group_add_outlined, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text("Discover new Communities", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildCommunityCard("Flutter Developers", "12K Members", "https://picsum.photos/seed/flutter/200"),
          _buildCommunityCard("K-Pop Stan Twitter", "2.1M Members", "https://picsum.photos/seed/kpop/200"),
          _buildCommunityCard("Tech Enthusiasts", "450K Members", "https://picsum.photos/seed/tech2/200"),
          _buildCommunityCard("UI/UX Designers", "89K Members", "https://picsum.photos/seed/design/200"),
        ],
      ),
    );
  }

  Widget _buildCommunityCard(String name, String members, String imageUrl) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(imageUrl, width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Text(members, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: const Text("Join", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}