import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../models/post_data.dart';
import '../widgets/post_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Local state for profile details so they can be edited
  String displayName = "tinytin";
  String bio = "happiness not found;";

  // Function to show the Edit Profile dialog
  void _showEditProfileDialog() {
    TextEditingController nameController = TextEditingController(text: displayName);
    TextEditingController bioController = TextEditingController(text: bio);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Edit Profile", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      displayName = nameController.text;
                      bio = bioController.text;
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text("Save", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: bioController,
              style: const TextStyle(color: Colors.white),
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Bio",
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // 1. Cover Photo Header - Adjusted height for better look
              SliverAppBar(
                expandedHeight: 160.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://image2url.com/r2/default/images/1772440680321-b3090b41-0ce8-4bef-b4cf-110e336c361d.webp',
                    fit: BoxFit.cover,
                  ),
                ),
                leading: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                    child: IconButton(icon: const Icon(Icons.search, color: Colors.white, size: 20), onPressed: () {}),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                    child: IconButton(icon: const Icon(Icons.more_vert, color: Colors.white, size: 20), onPressed: () {}),
                  ),
                ],
              ),

              // 2. Profile Details Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar and Edit Profile Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Adjusted Avatar positioning
                          Transform.translate(
                            offset: const Offset(0, -30),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                              child: const CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage('https://image2url.com/r2/default/images/1771919943834-0ba1ef41-f512-45e6-85ed-6e6cf2e34de0.jpg'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: OutlinedButton(
                              onPressed: _showEditProfileDialog,
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.grey),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                              ),
                              child: const Text("Edit profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),

                      // User Info
                      Transform.translate(
                        offset: const Offset(0, -15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(displayName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                                const SizedBox(width: 4),
                                const Icon(Icons.verified, color: Colors.blueAccent, size: 20),
                              ],
                            ),
                            const Text("@tinytin", style: TextStyle(fontSize: 15, color: Colors.grey)),
                            const SizedBox(height: 12),
                            Text(
                              bio,
                              style: const TextStyle(fontSize: 15, color: Colors.white, height: 1.4),
                            ),
                            const SizedBox(height: 12),

                            // Bio Details Row
                            Wrap(
                              spacing: 12,
                              runSpacing: 8,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.location_on_outlined, color: Colors.grey, size: 16),
                                    const SizedBox(width: 4),
                                    const Text("Philippines", style: TextStyle(color: Colors.grey, fontSize: 14)),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.calendar_month_outlined, color: Colors.grey, size: 16),
                                    const SizedBox(width: 4),
                                    const Text("Joined March 2023", style: TextStyle(color: Colors.grey, fontSize: 14)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Follower Counts
                            Row(
                              children: [
                                const Text("245", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                                const SizedBox(width: 4),
                                const Text("Following", style: TextStyle(color: Colors.grey, fontSize: 15)),
                                const SizedBox(width: 16),
                                const Text("1,204", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                                const SizedBox(width: 4),
                                const Text("Followers", style: TextStyle(color: Colors.grey, fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 3. Sticky TabBar
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.blueAccent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 4,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      Tab(text: "Posts"),
                      Tab(text: "Replies"),
                      Tab(text: "Highlights"),
                      Tab(text: "Articles"),
                      Tab(text: "Media"),
                      Tab(text: "Likes"),
                    ],
                  ),
=======
import 'edit_profile_screen.dart';
import 'find_friends_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.person_add_alt_1_outlined, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FindFriendsScreen()),
            );
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Jacob West', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
            Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _buildProfileInfo(context),
                    const Divider(height: 1, color: Colors.black12),
                    const TabBar(
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorWeight: 2,
                      tabs: [
                        Tab(icon: Icon(Icons.grid_on)),
                        Tab(icon: Icon(Icons.favorite_border)),
                      ],
                    ),
                  ],
>>>>>>> 42910258dedd46af3f05ff711dec5bad285bec19
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
<<<<<<< HEAD
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 1,
                itemBuilder: (context, index) => PostWidget(data: dummyPosts[2]),
              ),
              const Center(child: Text("No replies yet", style: TextStyle(color: Colors.grey))),
              const Center(child: Text("No highlights yet", style: TextStyle(color: Colors.grey))),
              const Center(child: Text("No articles yet", style: TextStyle(color: Colors.grey))),
              const Center(child: Text("No media yet", style: TextStyle(color: Colors.grey))),
              const Center(child: Text("No likes yet", style: TextStyle(color: Colors.grey))),
=======
              _buildGridView(),
              const Center(child: Text('Liked Videos')),
>>>>>>> 42910258dedd46af3f05ff711dec5bad285bec19
            ],
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.black, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
=======

  Widget _buildProfileInfo(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&w=200&q=80'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text('@jacob_w', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatColumn('14', 'Following'),
            Container(width: 1, height: 15, color: Colors.grey.shade300, margin: const EdgeInsets.symmetric(horizontal: 20)),
            _buildStatColumn('38', 'Followers'),
            Container(width: 1, height: 15, color: Colors.grey.shade300, margin: const EdgeInsets.symmetric(horizontal: 20)),
            _buildStatColumn('91', 'Likes'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Text('Edit profile', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(2),
              ),
              child: const Icon(Icons.bookmark_border, size: 20),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text('Tap to add bio', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }

  Widget _buildGridView() {
    final List<Map<String, String>> itVideos = [
      {'img': 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=300', 'views': '1.2M'},
      {'img': 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=300', 'views': '850K'},
      {'img': 'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=300', 'views': '2.1M'},
      {'img': 'https://images.unsplash.com/photo-1542831371-29b0f74f9713?w=300', 'views': '45K'},
      {'img': 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=300', 'views': '128K'},
      {'img': 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=300', 'views': '15K'},
    ];

    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: itVideos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              itVideos[index]['img']!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey.shade900),
            ),
            Positioned(
              bottom: 5,
              left: 5,
              child: Row(
                children: [
                  const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 18),
                  Text(
                    itVideos[index]['views']!,
                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
>>>>>>> 42910258dedd46af3f05ff711dec5bad285bec19
}
