
import 'package:flutter/material.dart';
import 'package:thflutter/screens/all_recipe.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController search=TextEditingController();
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return  Container(
      height: h*.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow:const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            blurRadius: 2,
          )
        ],
      ),
      child: TextField(
        controller: search,
        style: TextStyle(
          fontSize: w*.04,
          fontWeight: FontWeight.bold,
          color: Colors.black,

        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Hãy nấu món gì đó thật ngon nào...",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: w*.03,

          ),
          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>AllRecipe(reipe: search.text ))
              );
            },
            child: Icon(
              Icons.search,
              color: Colors.deepOrangeAccent,
              size: w*.07,
            ),
          ),
        ),
      ),
    );
  }
}

