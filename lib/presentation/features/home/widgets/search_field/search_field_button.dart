import 'package:flutter/material.dart';
import 'package:guidealt/theme/app_colors.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.buttonColor,
  }) : super(key: key);

  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Icon(
              Icons.search,
              size: 20,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}