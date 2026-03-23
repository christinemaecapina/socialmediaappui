import 'package:flutter/material.dart';
import '../models/post_data.dart';
import '../screens/post_detail_screen.dart';

class PostWidget extends StatefulWidget {
  final PostData data;
  final VoidCallback? onDelete;

  const PostWidget({super.key, required this.data, this.onDelete});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  void _toggleLike() {
    setState(() {
      widget.data.isLiked = !widget.data.isLiked;
      widget.data.isLiked ? widget.data.likes++ : widget.data.likes--;
    });
  }

  void _toggleRetweet() {
    setState(() {
      widget.data.isRetweeted = !widget.data.isRetweeted;
      widget.data.isRetweeted ? widget.data.retweets++ : widget.data.retweets--;
    });
  }

  void _toggleBookmark() {
    setState(() {
      widget.data.isBookmarked = !widget.data.isBookmarked;
    });
  }

  String _formatCount(int count) {
    if (count == 0) return ''; // X hides 0 counts
    if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}K';
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostDetailScreen(post: widget.data)),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 8),
        decoration: const BoxDecoration(
          // The exact subtle grey bottom border
          border: Border(bottom: BorderSide(color: Color(0xFF2F3336), width: 0.5)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            CircleAvatar(radius: 20, backgroundImage: NetworkImage(widget.data.profileUrl)),
            const SizedBox(width: 10),

            // Post Content Area
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Info Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                            widget.data.username,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xFFE7E9EA) // X exact white text
                            ),
                            overflow: TextOverflow.ellipsis
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.verified, color: Color(0xFF1D9BF0), size: 16),
                      const SizedBox(width: 4),
                      Text(
                          "${widget.data.handle} · ${widget.data.time}",
                          style: const TextStyle(color: Color(0xFF71767B), fontSize: 15) // X exact grey text
                      ),
                      const Spacer(),
                      // 3 Dots Menu
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: PopupMenuButton<String>(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.more_horiz, color: Color(0xFF71767B), size: 18),
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF2F3336)),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          onSelected: (value) {
                            if (value == 'delete' && widget.onDelete != null) widget.onDelete!();
                          },
                          itemBuilder: (BuildContext context) => [
                            const PopupMenuItem<String>(
                              value: 'delete',
                              child: Text('Delete', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Post Caption
                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 12),
                    child: Text(
                        widget.data.caption,
                        style: const TextStyle(fontSize: 15, height: 1.3, color: Color(0xFFE7E9EA))
                    ),
                  ),

                  // Optional Image
                  if (widget.data.imageUrl.isNotEmpty) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF2F3336), width: 0.5),
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 400),
                          child: Image.network(
                            widget.data.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],

                  // X Interaction Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _InteractionButton(
                          icon: Icons.chat_bubble_outline,
                          count: _formatCount(widget.data.replies),
                          hoverColor: const Color(0xFF1D9BF0),
                          onTap: () {}
                      ),
                      _InteractionButton(
                          icon: Icons.repeat,
                          count: _formatCount(widget.data.retweets),
                          color: widget.data.isRetweeted ? const Color(0xFF00BA7C) : const Color(0xFF71767B), // X Green
                          hoverColor: const Color(0xFF00BA7C),
                          onTap: _toggleRetweet
                      ),
                      _InteractionButton(
                          icon: widget.data.isLiked ? Icons.favorite : Icons.favorite_border,
                          count: _formatCount(widget.data.likes),
                          color: widget.data.isLiked ? const Color(0xFFA0153E) : const Color(0xFF71767B), // X Pink/Red
                          hoverColor: const Color(0xFFA0153E),
                          onTap: _toggleLike
                      ),
                      _InteractionButton(
                          icon: Icons.bar_chart, // X View Count Icon
                          count: "8K",
                          hoverColor: const Color(0xFF1D9BF0),
                          onTap: () {}
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: _toggleBookmark,
                            child: Icon(
                                widget.data.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                                size: 18,
                                color: widget.data.isBookmarked ? const Color(0xFF1D9BF0) : const Color(0xFF71767B)
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.share_outlined, size: 18, color: Color(0xFF71767B)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InteractionButton extends StatelessWidget {
  final IconData icon;
  final String count;
  final Color color;
  final Color hoverColor;
  final VoidCallback onTap;

  const _InteractionButton({
    required this.icon,
    required this.count,
    required this.onTap,
    this.color = const Color(0xFF71767B),
    required this.hoverColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: color),
          if (count.isNotEmpty) ...[
            const SizedBox(width: 4),
            Text(count, style: TextStyle(color: color, fontSize: 13)),
          ]
        ],
      ),
    );
  }
}