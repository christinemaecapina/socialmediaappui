import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../models/post_data.dart';
import '../widgets/post_widget.dart';
import 'compose_screen.dart';
import 'bookmarks_screen.dart';
import 'profile_screen.dart';

class XHomePage extends StatefulWidget {
  const XHomePage({super.key});

  @override
  State<XHomePage> createState() => _XHomePageState();
}

class _XHomePageState extends State<XHomePage> {
  List<PostData> feed = List.from(dummyPosts);

  Future<void> _createNewPost() async {
    final Map<String, dynamic>? newPostData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ComposeScreen()),
    );

    if (newPostData != null) {
      setState(() {
        feed.insert(0, PostData(
          username: "tinytin",
          handle: "@tin",
          time: "Just now",
          caption: newPostData['postText'] ?? '',
          imageUrl: newPostData['postImage'] ?? '',
          profileUrl: 'https://image2url.com/r2/default/images/1771919943834-0ba1ef41-f512-45e6-85ed-6e6cf2e34de0.jpg',
        ));
=======
import 'package:cached_video_player_plus/cached_video_player_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State variables
  bool isForYou = true;
  int activeIndex = 0; // Tracks which video is currently on screen

  // 1. Data for "For You" (Global/General Feed)
  final List<Map<String, dynamic>> forYouData = [
    {
      'videoUrl': 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'username': '@revolve',
      'profileImage': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=100&q=80',
      'caption': 'Save this for your next all white party fit! 🤍',
      'songName': 'Original Sound - Revolve',
      'likes': 99100,
      'comments': 3456,
      'shares': 1256,
    },
    {
      'videoUrl': 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      'username': '@nature_vibes',
      'profileImage': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=100&q=80',
      'caption': 'Working hard all day 🐝 #nature #bees #fyp',
      'songName': 'Original Sound - Nature Vibes',
      'likes': 15400,
      'comments': 230,
      'shares': 45,
    },
    {
      'videoUrl': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      'username': '@animation_fan',
      'profileImage': 'https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&w=100&q=80',
      'caption': 'Classic open source animation clip! 🔥 #blender #3d',
      'songName': 'Epic Cinematic Theme - Hans',
      'likes': 1200000,
      'comments': 10500,
      'shares': 8900,
    },
  ];

  // 2. Data for "Following"
  final List<Map<String, dynamic>> followingData = [
    {
      'videoUrl': 'assets/videos/niana.mp4',
      'username': '@nianaguerrero',
      'profileImage': 'assets/img/niana.jpg',
      'caption': 'New dance trend! Try niyo to guys 💃✨ #dance #ph',
      'songName': 'Original Sound - Niana',
      'likes': 1500000,
      'comments': 12500,
      'shares': 50000,
    },
    {
      'videoUrl': 'assets/videos/congtv.mp4',
      'username': '@congtv',
      'profileImage': 'assets/img/cong.jpg',
      'caption': 'PAAWER! Bagong vlog mga paa! ☝️ #congtv #teamplayaman',
      'songName': 'Original Sound - Cong TV',
      'likes': 850000,
      'comments': 24000,
      'shares': 15000,
    },
    {
      'videoUrl': 'assets/videos/ivana.mp4',
      'username': '@ivanaalawi',
      'profileImage': 'assets/img/ivana.jpg',
      'caption': 'A day in my life vlog uploading soon! ✨ #vlog #philippines',
      'songName': 'Aesthetic Vlog Music - Background',
      'likes': 2100000,
      'comments': 45000,
      'shares': 30000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final activeData = isForYou ? forYouData : followingData;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. The Scrollable Vertical Video Feed
          PageView.builder(
            key: ValueKey(isForYou), // Resets scroll position when switching tabs
            scrollDirection: Axis.vertical,
            itemCount: activeData.length,
            onPageChanged: (index) {
              setState(() {
                activeIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final data = activeData[index];
              return FeedItem(
                data: data,
                isActive: activeIndex == index,
              );
            },
          ),

          // 2. The Top Tabs
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!isForYou) return;
                        setState(() {
                          isForYou = false;
                          activeIndex = 0;
                        });
                      },
                      child: Text(
                          'Following',
                          style: TextStyle(
                              color: isForYou ? Colors.white60 : Colors.white,
                              fontSize: 16,
                              fontWeight: isForYou ? FontWeight.w600 : FontWeight.bold
                          )
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(width: 1, height: 12, color: Colors.white54),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        if (isForYou) return;
                        setState(() {
                          isForYou = true;
                          activeIndex = 0;
                        });
                      },
                      child: Text(
                          'For You',
                          style: TextStyle(
                              color: isForYou ? Colors.white : Colors.white60,
                              fontSize: 16,
                              fontWeight: isForYou ? FontWeight.bold : FontWeight.w600
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeedItem extends StatefulWidget {
  final Map<String, dynamic> data;
  final bool isActive;

  const FeedItem({
    super.key,
    required this.data,
    required this.isActive,
  });

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  bool isLiked = false;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    likeCount = widget.data['likes'];
  }

  @override
  void didUpdateWidget(covariant FeedItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      isLiked = false;
      likeCount = widget.data['likes'];
    }
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      isLiked ? likeCount++ : likeCount--;
    });
  }

  void forceLike() {
    if (!isLiked) {
      setState(() {
        isLiked = true;
        likeCount++;
>>>>>>> 42910258dedd46af3f05ff711dec5bad285bec19
      });
    }
  }

<<<<<<< HEAD
  // Slide-out Drawer Menu (X Style Sidebar)
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                },
                child: const CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage('https://image2url.com/r2/default/images/1771919943834-0ba1ef41-f512-45e6-85ed-6e6cf2e34de0.jpg'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("tinytin", style: TextStyle(color: Color(0xFFE7E9EA), fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("@tin", style: TextStyle(color: Color(0xFF71767B), fontSize: 15)),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text("245", style: TextStyle(color: Color(0xFFE7E9EA), fontWeight: FontWeight.bold, fontSize: 15)),
                  SizedBox(width: 4),
                  Text("Following", style: TextStyle(color: Color(0xFF71767B), fontSize: 15)),
                  SizedBox(width: 16),
                  Text("1,204", style: TextStyle(color: Color(0xFFE7E9EA), fontWeight: FontWeight.bold, fontSize: 15)),
                  SizedBox(width: 4),
                  Text("Followers", style: TextStyle(color: Color(0xFF71767B), fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.person_outline, color: Color(0xFFE7E9EA), size: 28),
                    title: const Text("Profile", style: TextStyle(color: Color(0xFFE7E9EA), fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.workspace_premium_outlined, color: Color(0xFFE7E9EA), size: 28),
                    title: const Text("Premium", style: TextStyle(color: Color(0xFFE7E9EA), fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.bookmark_border, color: Color(0xFFE7E9EA), size: 28),
                    title: const Text("Bookmarks", style: TextStyle(color: Color(0xFFE7E9EA), fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BookmarksScreen()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.list_alt, color: Color(0xFFE7E9EA), size: 28),
                    title: const Text("Lists", style: TextStyle(color: Color(0xFFE7E9EA), fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.mic_none, color: Color(0xFFE7E9EA), size: 28),
                    title: const Text("Spaces", style: TextStyle(color: Color(0xFFE7E9EA), fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.money, color: Color(0xFFE7E9EA), size: 28),
                    title: const Text("Monetization", style: TextStyle(color: Color(0xFFE7E9EA), fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xFF2F3336), thickness: 0.5),
            ListTile(
              title: const Text("Settings and Support", style: TextStyle(color: Color(0xFFE7E9EA), fontSize: 16)),
              trailing: const Icon(Icons.keyboard_arrow_down, color: Color(0xFFE7E9EA)),
              onTap: () {},
            ),
          ],
        ),
      ),
=======
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: VideoPlayerItem(
            videoUrl: widget.data['videoUrl'],
            isActive: widget.isActive,
            onDoubleTapLike: forceLike,
          ),
        ),
        Positioned.fill(
          child: VideoOverlayControls(
            data: widget.data,
            isLiked: isLiked,
            likeCount: likeCount,
            onLikeTap: toggleLike,
          ),
        ),
      ],
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final bool isActive;
  final VoidCallback onDoubleTapLike;

  const VideoPlayerItem({
    super.key,
    required this.videoUrl,
    required this.isActive,
    required this.onDoubleTapLike,
  });

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> with SingleTickerProviderStateMixin {
  late CachedVideoPlayerPlusController _controller;
  bool isPlaying = true;
  late AnimationController _heartAnimationController;
  late Animation<double> _heartScaleAnimation;
  Offset? _tapPosition;
  bool _showHeart = false;

  @override
  void initState() {
    super.initState();
    _heartAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _heartScaleAnimation = Tween<double>(begin: 0.0, end: 1.2).animate(
        CurvedAnimation(parent: _heartAnimationController, curve: Curves.elasticOut)
    );

    if (widget.videoUrl.startsWith('http')) {
      _controller = CachedVideoPlayerPlusController.networkUrl(Uri.parse(widget.videoUrl));
    } else {
      _controller = CachedVideoPlayerPlusController.asset(widget.videoUrl);
    }

    _controller.initialize().then((_) {
      if (mounted) {
        setState(() {});
        _controller.setLooping(true);
        _controller.setVolume(1.0); // Sound ON
        if (widget.isActive) {
          _controller.play();
          isPlaying = true;
        } else {
          isPlaying = false;
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant VideoPlayerItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isActive != widget.isActive) {
      if (widget.isActive) {
        _controller.play();
        _controller.setVolume(1.0); // Sound ON
        isPlaying = true;
      } else {
        _controller.pause();
        _controller.seekTo(Duration.zero);
        isPlaying = false;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _heartAnimationController.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        isPlaying = false;
      } else {
        _controller.play();
        isPlaying = true;
      }
    });
  }

  void _handleDoubleTap(TapDownDetails details) {
    widget.onDoubleTapLike();
    setState(() {
      _tapPosition = details.localPosition;
      _showHeart = true;
    });
    _heartAnimationController.forward(from: 0.0).then((_) {
      Future.delayed(const Duration(milliseconds: 250), () {
        if (mounted) {
          _heartAnimationController.reverse().then((_) {
            if (mounted) setState(() => _showHeart = false);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
      onTap: togglePlayPause,
      onDoubleTapDown: _handleDoubleTap,
      onDoubleTap: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: CachedVideoPlayerPlus(_controller),
              ),
            ),
          ),
          if (!isPlaying)
            Icon(Icons.play_arrow, size: 80, color: Colors.white.withOpacity(0.5)),
          if (_showHeart && _tapPosition != null)
            Positioned(
              left: _tapPosition!.dx - 50,
              top: _tapPosition!.dy - 50,
              child: ScaleTransition(
                scale: _heartScaleAnimation,
                child: const Icon(Icons.favorite, color: Colors.red, size: 100),
              ),
            ),
        ],
      ),
    )
        : const Center(child: CircularProgressIndicator(color: Colors.white));
  }
}

class VideoOverlayControls extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isLiked;
  final int likeCount;
  final VoidCallback onLikeTap;

  const VideoOverlayControls({
    super.key,
    required this.data,
    required this.isLiked,
    required this.likeCount,
    required this.onLikeTap,
  });

  String formatNumber(int number) {
    if (number >= 1000000) return '${(number / 1000000).toStringAsFixed(1)}M';
    if (number >= 1000) return '${(number / 1000).toStringAsFixed(1)}K';
    return number.toString();
  }

  void showCommentsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          height: 400,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text('${formatNumber(data['comments'])} Comments',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 20),
              const Expanded(child: Center(child: Text("Comments UI coming soon! 💬"))),
            ],
          ),
        );
      },
>>>>>>> 42910258dedd46af3f05ff711dec5bad285bec19
    );
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildDrawer(context),
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                floating: true,
                pinned: true,
                backgroundColor: Colors.black.withOpacity(0.9), // Slightly translucent for the X scroll effect
                elevation: 0,
                leading: Builder(
                  builder: (context) => GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://image2url.com/r2/default/images/1771919943834-0ba1ef41-f512-45e6-85ed-6e6cf2e34de0.jpg'),
                      ),
                    ),
                  ),
                ),
                title: const Text("𝕏", style: TextStyle(color: Color(0xFFE7E9EA), fontSize: 32, fontWeight: FontWeight.bold)),
                centerTitle: true,
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Upgrade",
                      style: TextStyle(color: Color(0xFFE7E9EA), fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color(0xFF2F3336), width: 0.5)),
                    ),
                    child: const TabBar(
                      indicatorColor: Color(0xFF1D9BF0), // X Official Blue
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 4,
                      labelColor: Color(0xFFE7E9EA),
                      unselectedLabelColor: Color(0xFF71767B),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                      tabs: [
                        Tab(text: "For you"),
                        Tab(text: "Following"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            body: TabBarView(
              children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: feed.length,
                  itemBuilder: (context, index) => PostWidget(
                    data: feed[index],
                    onDelete: () {
                      setState(() {
                        feed.removeAt(index);
                      });
                    },
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 1,
                  itemBuilder: (context, index) => PostWidget(data: dummyPosts[1]),
=======
    return Stack(
      children: [
        IgnorePointer(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black54, Colors.transparent, Colors.transparent, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.15, 0.6, 1.0],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _ProfileButton(imageUrl: data['profileImage']),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: onLikeTap,
                  child: _ActionIcon(
                    icon: Icons.favorite,
                    text: formatNumber(likeCount),
                    iconColor: isLiked ? Colors.red : Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => showCommentsBottomSheet(context),
                  child: _ActionIcon(icon: Icons.chat_bubble, text: formatNumber(data['comments'])),
                ),
                const SizedBox(height: 20),
                _ActionIcon(icon: Icons.reply, text: formatNumber(data['shares'])),
                const SizedBox(height: 30),
                const _SpinningRecord(),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 15, right: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(data['username'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text(data['caption'], style: const TextStyle(color: Colors.white, fontSize: 14)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.music_note, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        data['songName'],
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
>>>>>>> 42910258dedd46af3f05ff711dec5bad285bec19
                ),
              ],
            ),
          ),
        ),
<<<<<<< HEAD
        floatingActionButton: FloatingActionButton(
          onPressed: _createNewPost,
          backgroundColor: const Color(0xFF1D9BF0), // X Official Blue
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
=======
      ],
    );
  }
}

class _ProfileButton extends StatelessWidget {
  final String imageUrl;
  const _ProfileButton({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 60,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
              image: DecorationImage(
                image: imageUrl.startsWith('http') 
                    ? NetworkImage(imageUrl) 
                    : AssetImage(imageUrl) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(color: Colors.pinkAccent, shape: BoxShape.circle),
              child: const Icon(Icons.add, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const _ActionIcon({required this.icon, required this.text, this.iconColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 35),
        const SizedBox(height: 5),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _SpinningRecord extends StatelessWidget {
  const _SpinningRecord();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade800,
        gradient: RadialGradient(colors: [Colors.grey.shade800, Colors.black]),
      ),
      child: Center(
        child: Container(
          width: 15,
          height: 15,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white24),
>>>>>>> 42910258dedd46af3f05ff711dec5bad285bec19
        ),
      ),
    );
  }
}