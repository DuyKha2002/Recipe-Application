import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LikeButton extends StatelessWidget {
  final bool isLiked;
  final void Function(bool) onTap;
  final VoidCallback onNavigateToFavorite; // Callback để chuyển đến màn hình yêu thích

  const LikeButton({
    Key? key,
    required this.isLiked,
    required this.onTap,
    required this.onNavigateToFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(!isLiked);
        if (!isLiked) {
          onNavigateToFavorite(); // Gọi callback để chuyển đến màn hình yêu thích
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          isLiked ? Iconsax.heart5 : Iconsax.heart,
          color: isLiked ? Colors.red : Colors.grey,
          size: 24,
        ),
      ),
    );
  }
}
