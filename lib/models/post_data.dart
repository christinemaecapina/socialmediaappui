class PostData {
  final String username;
  final String handle;
  final String time;
  final String caption;
  final String profileUrl;
  final String imageUrl;

  // Mutable state for interactions
  int likes;
  int retweets;
  int replies;
  bool isLiked;
  bool isRetweeted;
  bool isBookmarked;

  PostData({
    required this.username,
    required this.handle,
    required this.time,
    required this.caption,
    required this.profileUrl,
    this.imageUrl = '', // Optional so text-only posts work
    this.likes = 0,
    this.retweets = 0,
    this.replies = 0,
    this.isLiked = false,
    this.isRetweeted = false,
    this.isBookmarked = false,
  });
}

List<PostData> dummyPosts = [
  PostData(
    username: "sunootini",
    handle: "@tinysunootini",
    time: "10h",
    caption: "The sunset is beautiful isn't it?",
    profileUrl: "https://image2url.com/r2/default/images/1771919838587-8262b91c-d727-46c4-875d-d0d47b6c8552.jpg",
    imageUrl: "https://image2url.com/r2/default/images/1771919753639-ae6f4a8a-d3c7-4e0b-b712-d6e22b526ddc.jpg",
    likes: 1400, retweets: 220, replies: 12,
  ),
  PostData(
    username: "eli ★",
    handle: "@ftalsunoo",
    time: "15h",
    caption: "Manifesting Enhypen world tour in the Philippines! ✨ #enhypen #engene",
    profileUrl: "https://image2url.com/r2/default/images/1771919868680-e93cb161-dab9-4db1-a68b-e4061ddfc0bb.jpg",
    imageUrl: "https://image2url.com/r2/default/images/1772502306770-10422446-5184-430b-a017-58076c65dfc9.png",
    likes: 850, retweets: 105, replies: 5,
  ),
  PostData(
    username: "tinytin",
    handle: "@tin",
    time: "1h",
    caption: "Building an Enhypen fan app using Flutter is so fun! 🚀 #flutter #enhypen",
    profileUrl: "https://image2url.com/r2/default/images/1771919943834-0ba1ef41-f512-45e6-85ed-6e6cf2e34de0.jpg",
    imageUrl: "https://image2url.com/r2/default/images/1771919794362-fd346cda-33e2-469b-a738-541352f2d096.jpg",
    likes: 320, retweets: 12, replies: 2,
  ),
];