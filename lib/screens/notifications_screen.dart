import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.5,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const CircleAvatar(
                backgroundImage: NetworkImage('https://image2url.com/r2/default/images/1771919943834-0ba1ef41-f512-45e6-85ed-6e6cf2e34de0.jpg'),
              ),
            ),
          ),
          title: const Text("Notifications", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined, color: Colors.white),
              onPressed: () {},
            )
          ],
          bottom: const TabBar(
            indicatorColor: Colors.blueAccent,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            tabs: [
              Tab(text: "All"),
              Tab(text: "Verified"),
              Tab(text: "Mentions"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildNotificationsList(),
            const Center(child: Text("Nothing to see here — yet", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold))),
            const Center(child: Text("No mentions yet", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blueAccent,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
    );
  }

  Widget _buildNotificationsList() {
    final List<Map<String, dynamic>> notifications = [
      {
        "icon": Icons.star,
        "iconColor": Colors.purpleAccent,
        "title": "New features available in X Premium",
        "subtitle": "Check out what's new for subscribers.",
        "image": "https://image2url.com/r2/default/images/1771919943834-0ba1ef41-f512-45e6-85ed-6e6cf2e34de0.jpg"
      },
      {
        "icon": Icons.favorite,
        "iconColor": Colors.pink,
        "title": "sunootini liked your reply",
        "subtitle": "Flutter apps are amazing! 💙",
        "image": "https://image2url.com/r2/default/images/1771919838587-8262b91c-d727-46c4-875d-d0d47b6c8552.jpg"
      },
      {
        "icon": Icons.person,
        "iconColor": Colors.blueAccent,
        "title": "eli ★ followed you",
        "subtitle": "",
        "image": "https://image2url.com/r2/default/images/1771919868680-e93cb161-dab9-4db1-a68b-e4061ddfc0bb.jpg"
      },
    ];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notif = notifications[index];
        return Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.withAlpha(40), width: 0.5)),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(notif["icon"], color: notif["iconColor"], size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(notif["image"]),
                    ),
                    const SizedBox(height: 8),
                    Text(notif["title"], style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    if (notif["subtitle"].isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(notif["subtitle"], style: const TextStyle(color: Colors.grey, fontSize: 15)),
                    ]
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}