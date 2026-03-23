<<<<<<< HEAD
import 'package:flutter/material.dart';

void main() {
  runApp(const XCloneApp());
}

// 1. DATA MODEL
class PostData {
  final String username;
  final String handle;
  final String time;
  final String caption;
  final String profileUrl;
  final String imageUrl;

  PostData({
    required this.username,
    required this.handle,
    required this.time,
    required this.caption,
    required this.profileUrl,
    required this.imageUrl,
  });
}

class XCloneApp extends StatelessWidget {
  const XCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // "Sleek Dark Mode aesthetic with deep blacks and electric blue accents"
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.blueAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.blueAccent,
        ),
      ),
      home: XHomePage(),
    );
  }
}

class XHomePage extends StatelessWidget {
  XHomePage({super.key});

  // Dummy Database
  final List<PostData> posts = [
    PostData(
      username: "sunootini",
      handle: "@tinysunootini",
      time: "10h",
      caption: "The sunset is beautiful isn't it?",
      profileUrl: "https://image2url.com/r2/default/images/1771919838587-8262b91c-d727-46c4-875d-d0d47b6c8552.jpg",
      imageUrl: "https://image2url.com/r2/default/images/1771919753639-ae6f4a8a-d3c7-4e0b-b712-d6e22b526ddc.jpg",
    ),
    PostData(
      username: "eli ★",
      handle: "@ftalsunoo",
      time: "15h",
      caption: "this picture 😭😭😭😭😭😭",
      profileUrl: "https://image2url.com/r2/default/images/1771919868680-e93cb161-dab9-4db1-a68b-e4061ddfc0bb.jpg",
      imageUrl: "https://image2url.com/r2/default/images/1771919631129-54c48bf5-0ec2-4961-9bb7-cfeacf2c7fd4.jpg",
    ),
    PostData(
      username: "tinytin",
      handle: "@tin",
      time: "1h",
      caption: "coding time",
      profileUrl: "https://image2url.com/r2/default/images/1771919943834-0ba1ef41-f512-45e6-85ed-6e6cf2e34de0.jpg",
      imageUrl: "https://image2url.com/r2/default/images/1771919794362-fd346cda-33e2-469b-a738-541352f2d096.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // DefaultTabController handles the state of our tabs
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          // NestedScrollView allows the AppBar and TabBar to hide/pin gracefully
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  backgroundColor: Colors.black.withAlpha(240), // Slight transparency for a premium feel
                  leading: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://image2url.com/r2/default/images/1771921523958-72225b6b-72f3-4973-af31-b174751c6031.jpg'),
                    ),
                  ),
                  title: const Icon(Icons.close, size: 30),
                  centerTitle: true,
                  actions: [
                    TextButton(
                        onPressed: () {},
                        child: const Text("Upgrade", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
                  ],
                  // Built-in TabBar replaces the hardcoded one
                  bottom: const TabBar(
                    indicatorColor: Colors.blueAccent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 4,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                    tabs: [
                      Tab(text: "For you"),
                      Tab(text: "Following"),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                // "For You" Feed
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: posts.length,
                  itemBuilder: (context, index) => PostWidget(data: posts[index]),
                ),
                // "Following" Feed Placeholder
                const Center(
                    child: Text(
                        "Welcome to your timeline!",
                        style: TextStyle(color: Colors.grey, fontSize: 18)
                    )
                ),
              ],
            ),
          ),
        ),
        // Floating action button with electric blue
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ComposeScreen()),
            );
          },
          backgroundColor: Colors.blueAccent,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        bottomNavigationBar: const _BottomNavBar(),
      ),
    );
  }
}

// 2. POST UI DESIGN
class PostWidget extends StatelessWidget {
  final PostData data;
  const PostWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.withAlpha(40), width: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 22, backgroundImage: NetworkImage(data.profileUrl)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row (Wrapped in Expanded/Flexible to prevent overflow)
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        data.username,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.verified, color: Colors.blueAccent, size: 16),
                    const SizedBox(width: 4),
                    Text(
                        "${data.handle} · ${data.time}",
                        style: const TextStyle(color: Colors.grey, fontSize: 15)
                    ),
                    const Spacer(),
                    const Icon(Icons.more_horiz, color: Colors.grey, size: 18),
                  ],
                ),
                const SizedBox(height: 4),
                // Post Body
                Text(data.caption, style: const TextStyle(fontSize: 15, height: 1.4)),
                const SizedBox(height: 12),
                // Constrained Media
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 350),
                    child: Image.network(
                      data.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Action Icons Row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ActionIcon(Icons.chat_bubble_outline, "1"),
                    _ActionIcon(Icons.repeat, "220"),
                    _ActionIcon(Icons.favorite_border, "1.4K"),
                    _ActionIcon(Icons.bar_chart, "8K"),
                    Icon(Icons.bookmark_border, size: 18, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 3. COMPOSE TWEET SCREEN
class ComposeScreen extends StatefulWidget {
  const ComposeScreen({super.key});

  @override
  State<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<ComposeScreen> {
  final TextEditingController _textController = TextEditingController();
  final int _maxLength = 280;
  int _currentLength = 0;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _currentLength = _textController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = _currentLength / _maxLength;
    Color progressColor = progress > 1.0 ? Colors.red : (progress > 0.9 ? Colors.orange : Colors.blueAccent);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: ElevatedButton(
              onPressed: _currentLength > 0 && _currentLength <= _maxLength ? () {} : null,
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
                  backgroundImage: NetworkImage('https://image2url.com/r2/default/images/1771921523958-72225b6b-72f3-4973-af31-b174751c6031.jpg'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      hintText: "What is happening?!",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Electric Blue Toolbar & Character Counter
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.image, color: Colors.blueAccent)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.gif_box, color: Colors.blueAccent)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.poll, color: Colors.blueAccent)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.location_on, color: Colors.blueAccent)),
                const Spacer(),
                if (_currentLength > 0) ...[
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      value: progress > 1.0 ? 1.0 : progress,
                      backgroundColor: Colors.grey.withAlpha(50),
                      color: progressColor,
                      strokeWidth: 2.5,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const VerticalDivider(color: Colors.grey, width: 1, indent: 10, endIndent: 10),
                  const SizedBox(width: 12),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline, color: Colors.blueAccent)
                  ),
                ]
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// --- UI HELPERS ---

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ActionIcon(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }
}

// Custom BottomNavigationBar matching exactly 5 requested items
class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Required when > 3 items
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 28,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: "Communities"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: "Notifications"),
        BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: "Messages"),
      ],
    );
  }
}
=======
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:socialmedia_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TikTokApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
>>>>>>> 42910258dedd46af3f05ff711dec5bad285bec19
