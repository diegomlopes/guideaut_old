import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guidealt/presentation/features/home/widgets/search_field/search_field_button.dart';
import 'package:guidealt/presentation/features/search/pages/search_page.dart';
import 'package:guidealt/theme/app_colors.dart';
import 'package:guidealt/theme/app_fonts.dart';

class SearchField extends StatelessWidget {
  
  const SearchField({ 
    Key? key,
    required this.width,
    required this.buttonColor,
  }) : super(key: key);

  final double width;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      child: TextButton(
        onPressed: () {}, 
        child: Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(25)
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Search for recomendations",
                  style: TextStyle(
                    fontFamily: AppFonts.apercu,
                    fontSize: 16,
                    color: AppColors.lightGrey
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(SearchPage.route),
                  child: SearchButton(
                    buttonColor: buttonColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}