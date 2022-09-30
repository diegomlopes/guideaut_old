import 'package:flutter/material.dart';
import 'package:guidealt/presentation/features/home/pages/home_page.dart';
import 'package:guidealt/presentation/features/home/providers/home_providers.dart';
import 'package:guidealt/presentation/features/proaut/pages/proaut_page.dart';
import 'package:guidealt/presentation/features/signin/pages/signin_page.dart';
import 'package:guidealt/theme/app_colors.dart';
import 'package:guidealt/theme/app_fonts.dart';
import 'package:guidealt/theme/app_metrics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, widget) {
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
                    child: Text(
                      "ProAut",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontFamily: AppFonts.apercu,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    "Tutorial",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(ProAutPage.route),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      "Tools",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontFamily: AppFonts.apercu,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              ref.watch(HomeProviders.userLoggedProvider) != null ?
              Container() :
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(SignInPage.route),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Container(
                      width: AppMetrics.appbarHeight * 1.2,
                      height: AppMetrics.appbarHeight * 0.6,
                      decoration: BoxDecoration(
                        color: AppColors.tertiaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16,
                            fontFamily: AppFonts.apercu,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}