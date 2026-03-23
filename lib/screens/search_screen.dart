import 'package:flutter/material.dart';
import '../models/post_data.dart';
import '../widgets/post_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<PostData> _searchResults = [];
  bool _isSearching = false;

  // Dummy data for Trending
  final List<Map<String, String>> _trends = [
    {"category": "Trending in Philippines", "title": "#BTSComeback", "posts": "12.5K posts"},
    {"category": "Technology · Trending", "title": "Flutter 4.0", "posts": "45.2K posts"},
    {"category": "Entertainment · Trending", "title": "Enhypen", "posts": "1.2M posts"},
    {"category": "Trending in Philippines", "title": "code synechise", "posts": "5,432 posts"},
    {"category": "Sports · Trending", "title": "NBA Finals", "posts": "300K posts"},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _isSearching = false;
        _searchResults = [];
      } else {
        _isSearching = true;
        _searchResults = dummyPosts.where((post) {
          return post.caption.toLowerCase().contains(query.toLowerCase()) ||
              post.username.toLowerCase().contains(query.toLowerCase()) ||
              post.handle.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // 1. TOP SEARCH BAR (X Styled)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  // I ACTUALLY REMOVED THE CONST THIS TIME! 🎉
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage('https://image2url.com/r2/default/images/1771921523958-72225b6b-72f3-4973-af31-b174751c6031.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFF202327), // X exact search box color
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: _onSearchChanged,
                        style: const TextStyle(color: Color(0xFFE7E9EA)),
                        decoration: InputDecoration(
                          hintText: "Search X",
                          hintStyle: const TextStyle(color: Color(0xFF71767B), fontSize: 15),
                          prefixIcon: const Icon(Icons.search, color: Color(0xFF71767B), size: 20),
                          suffixIcon: _isSearching
                              ? IconButton(
                            icon: const Icon(Icons.cancel, color: Color(0xFF71767B), size: 18),
                            onPressed: () {
                              _searchController.clear();
                              _onSearchChanged('');
                            },
                          )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 9),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.settings_outlined, color: Color(0xFFE7E9EA)),
                ],
              ),
            ),

            // 2. CONTENT AREA
            Expanded(
              child: _isSearching
                  ? _buildSearchResults()
                  : _buildTrendingView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return const Center(
        child: Text("No results found", style: TextStyle(color: Color(0xFF71767B), fontSize: 16)),
      );
    }
    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) => PostWidget(data: _searchResults[index]),
    );
  }

  Widget _buildTrendingView() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // Featured News Header
        Container(
          width: double.infinity,
          height: 200,
          // I ACTUALLY REMOVED THE CONST THIS TIME! 🎉
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://picsum.photos/seed/tech/800/400'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.9), Colors.transparent],
              ),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.bottomLeft,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Technology · LIVE", style: TextStyle(color: Color(0xFFE7E9EA), fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Exploring the Future of Flutter", style: TextStyle(color: Color(0xFFE7E9EA), fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Trends for you", style: TextStyle(color: Color(0xFFE7E9EA), fontSize: 20, fontWeight: FontWeight.bold)),
        ),

        ..._trends.map((trend) => _buildTrendItem(trend)),

        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Show more", style: TextStyle(color: Color(0xFF1D9BF0), fontSize: 15)), // X Blue
        ),
      ],
    );
  }

  Widget _buildTrendItem(Map<String, String> trend) {
    return InkWell(
      onTap: () {
        _searchController.text = trend['title']!;
        _onSearchChanged(trend['title']!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(trend['category']!, style: const TextStyle(color: Color(0xFF71767B), fontSize: 13)),
                const SizedBox(height: 4),
                Text(trend['title']!, style: const TextStyle(color: Color(0xFFE7E9EA), fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(trend['posts']!, style: const TextStyle(color: Color(0xFF71767B), fontSize: 13)),
              ],
            ),
            const Icon(Icons.more_horiz, color: Color(0xFF71767B), size: 20),
          ],
        ),
      ),
    );
  }
}