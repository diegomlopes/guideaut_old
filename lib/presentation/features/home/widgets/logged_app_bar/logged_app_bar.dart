import 'package:flutter/material.dart';
import 'package:guidealt/presentation/features/home/pages/home_page.dart';
import 'package:guidealt/presentation/features/proaut/pages/proaut_page.dart';
import 'package:guidealt/theme/app_colors.dart';
import 'package:guidealt/theme/app_fonts.dart';
import 'package:guidealt/theme/app_metrics.dart';

class LoggedAppBar extends StatelessWidget {
  const LoggedAppBar({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      height: AppMetrics.appbarHeight,
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(HomePage.route),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  "assets/images/app_icon_white.png",
                ),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(HomePage.route),
              child: Text(
                "GuideAut",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 20,
                  fontFamily: AppFonts.apercu,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const Spacer(),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(ProAutPage.route),
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    shape: BoxShape.circle,
                    image: const DecorationImage(image: 
                      NetworkImage("https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
                    ),
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}