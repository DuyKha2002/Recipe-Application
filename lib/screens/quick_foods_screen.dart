import 'package:flutter/material.dart';
import 'package:recipe/models/food.dart';
import 'package:recipe/widgets/food_card.dart';
import 'package:recipe/widgets/quick_screen_appbar.dart';
import 'package:recipe/widgets/like_button.dart';

class QuickFoodsScreen extends StatelessWidget {
  const QuickFoodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const QuickScreenAppbar(),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    final Food food = foods[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to food detail screen or handle tap event
                      },
                      child: Column(
                        children: [
                          FoodCard(food: food),
                          LikeButton(
                            isLiked: food.isLiked,
                            onTap: (newIsLiked) {
                              // Handle like button tap
                              // Typically update the food's like status here
                              // For demo, let's just print the new status
                              print('Food ${food.name} liked: $newIsLiked');
                            },
                            onNavigateToFavorite: () {
                              // Implement your navigate to favorite logic here
                              // This can be empty if you don't need to navigate
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: foods.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
