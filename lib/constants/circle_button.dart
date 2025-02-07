import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const CircleButton({Key? key,required this.icon,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Column(
      children: [
        CircleAvatar(
          radius: w*.06,
          backgroundColor: Colors.redAccent,
          child: Center(
            child: Icon(icon,color: Colors.white,),
          ),
        ),
        SizedBox(height: h*.005,),
        Text(label),
      ],
    );
  }
}
