import 'package:farm_tech/scr/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  const BottomNavIcon({@required this.image, this.name, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Column(
          children: [
            Image.asset('images/$image', width: 18, height: 18),
            SizedBox(height: 2),
            CustomText(text: name, size: 14),
          ],
        ),
      ),
    );
  }
}
