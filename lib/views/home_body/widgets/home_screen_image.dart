
import 'package:flutter/material.dart';
import 'package:proteinium/resources/color_const.dart';
import 'package:proteinium/resources/image_const.dart';
import 'package:proteinium/resources/text_style_const.dart';

class HomeScreenImage extends StatelessWidget {
  const HomeScreenImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: ColorConst.shadowLight,
        image: DecorationImage(
          image: NetworkImage(
            ImageConst.homeScreenImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: 180,
      width: double.infinity,
      child: Text(
        'P R O T E I N I U M',
        style: TextStyleConst.michromaMedium22.copyWith(
          color: ColorConst.surfaceText,
        ),
      ),
    );
  }
}
