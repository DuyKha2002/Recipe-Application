import 'package:flutter/material.dart';
import 'package:thflutter/screens/all_recipe.dart';

class RecipreCategoryView extends StatelessWidget {
  final String name,image;
  const RecipreCategoryView({Key? key, required this.name, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context)=>AllRecipe(reipe: name))
        );
      },
      child: SizedBox(
        height: h*.105,
        width: w*.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: h*.07,
              width: w*.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Text(name,style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),),
            )
          ],
        ),
      ),
    );
  }
}
