import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.add_circle_outline, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Inbox', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(width: 5),
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.green, // The little green dot next to Inbox
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Stories Row
          SizedBox(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15, top: 10),
              children: [
                _buildStoryItem(name: 'Create', imageUrl: 'https://florenznerolf.github.io/img/angry_Cat.img.jpg', isAdd: true), // New pic for Create
                _buildStoryItem(name: 'Christine  ', imageUrl: 'https://images.unsplash.com/photo-1554151228-14d9def656e4?auto=format&fit=crop&w=150&q=80', hasRing: true), // New pic for JULES
                _buildStoryItem(name: 'Mae.', imageUrl: 'https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?auto=format&fit=crop&w=150&q=80', hasRing: true), // New pic for Sonya R.
                _buildStoryItem(name: 'Capina', imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80', hasRing: true), // New pic for kimkardash...
              ],
            ),
          ),

          // 2. Primary / General Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text('Primary 4', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: const Center(
                      child: Text('General', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.tune, color: Colors.black87), // Filter icon
              ],
            ),
          ),

          // 3. Messages & Notifications List
          Expanded(
            child: ListView(
              children: [
                _buildSystemNotification(
                  icon: Icons.people,
                  iconColor: Colors.blue,
                  title: 'New followers',
                  subtitle: 'James Alex28 started following you.',
                ),
                _buildSystemNotification(
                  icon: Icons.notifications,
                  iconColor: Colors.pink,
                  title: 'Activities',
                  subtitle: '@moseschristopher liked your comment.',
                ),
                _buildSystemNotification(
                  icon: Icons.inbox,
                  iconColor: Colors.black87,
                  title: 'System notifications',
                  subtitle: 'TikTok: Open to see updates...',
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text('Messages', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),

                _buildUserChat(
                  name: 'PtinP',
                  message: 'Active now',
                  imageUrl: 'https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=150&q=80', // New pic for TrinaD
                  isOnline: true,
                ),
                _buildUserChat(
                  name: 'Florenz Mae',
                  message: 'Sent',
                  imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=150&q=80', // New pic for Eden Shumaker
                ),
                _buildUserChat(
                  name: 'Mang Kanor',
                  message: 'reacted 😂 to your message',
                  imageUrl: 'https://images.unsplash.com/photo-1552058544-f2b08422138a?auto=format&fit=crop&w=150&q=80', // New pic for Emslie
                ),
                _buildUserChat(
                  name: 'Whataredoinwater',
                  message: 'Sent',
                  imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&q=80', // New pic for dshumaker71
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget for the Stories at the top
  Widget _buildStoryItem({required String name, required String imageUrl, bool isAdd = false, bool hasRing = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: hasRing ? Border.all(color: Colors.pink, width: 2.5) : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
              ),
              if (isAdd)
                Container(
                  decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // Helper Widget for System Notifications (New followers, Activities)
  Widget _buildSystemNotification({required IconData icon, required Color iconColor, required String title, required String subtitle}) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: iconColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }

  // Helper Widget for User DMs
  Widget _buildUserChat({required String name, required String message, required String imageUrl, bool isOnline = false}) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(imageUrl),
          ),
          if (isOnline)
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
        ],
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      subtitle: Text(message, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      trailing: const Icon(Icons.camera_alt_outlined, color: Colors.grey),
    );
  }
}