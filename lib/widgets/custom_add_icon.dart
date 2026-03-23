import 'package:flutter/material.dart';

class CustomAddIcon extends StatelessWidget {
  final bool isHome;
  const CustomAddIcon({super.key, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 45,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 38,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xff25d366), // Cyan-ish
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 38,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xffea4359), // Pink
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            left: 3.5,
            child: Container(
              width: 38,
              height: 30,
              decoration: BoxDecoration(
                color: isHome ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.add,
                color: isHome ? Colors.black : Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}