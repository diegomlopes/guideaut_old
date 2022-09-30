import 'package:flutter/material.dart';
import 'package:guidealt/presentation/features/home/widgets/logged_app_bar/logged_app_bar.dart';
import 'package:guidealt/presentation/features/search/pages/search_page.dart';
import 'package:guidealt/theme/app_colors.dart';
import 'package:guidealt/theme/app_fonts.dart';
import 'package:guidealt/theme/app_metrics.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({
    Key? key,
  }) : super(key: key);

  static const String route = '/panel';

  @override
  State<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppMetrics.appbarHeight),
        child: LoggedAppBar(),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Recomendations",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontFamily: AppFonts.apercu,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Divider(),
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: 16,
                          fontFamily: AppFonts.apercu,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const VerticalDivider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "My Recomendations",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 32,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Panel > ",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontFamily: AppFonts.apercu,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Recomendations",
                        style: TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: 14,
                          fontFamily: AppFonts.apercu,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: SearchItem(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: SearchItem(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: SearchItem(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: SearchItem(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}