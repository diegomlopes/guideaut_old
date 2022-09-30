import 'package:flutter/material.dart';
import 'package:guidealt/presentation/features/home/widgets/app_bar/main_app_bar.dart';
import 'package:guidealt/presentation/features/home/widgets/search_field/search_field.dart';
import 'package:guidealt/theme/app_colors.dart';
import 'package:guidealt/theme/app_fonts.dart';
import 'package:guidealt/theme/app_metrics.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key
  }) : super(key: key);

  static const String route = '/search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppMetrics.appbarHeight),
        child: MainAppBar(),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Any Date",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14,
                    fontFamily: AppFonts.apercu,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Since 2022",
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 14,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Since 2019",
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 14,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Since 2018",
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 14,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Specific Period...",
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 14,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 150,
                  child: Divider(
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Order by Relevance",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Order by Date",
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 14,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 150,
                  child: Divider(
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Any Language",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Only English",
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 14,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SearchField(
                    width: 700,
                    buttonColor: AppColors.primaryColor,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SearchItem(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SearchItem(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SearchItem(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SearchItem(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SearchItem(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SearchItem(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SearchItem(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 8.0),
      child: SizedBox(
        width: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Developing user interface design application for children with autism",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontFamily: AppFonts.apercu,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "MF Kamaruzaman, NM Rani, HM Nor… - Procedia-Social and …, 2016 - Elsevier",
                style: TextStyle(
                  color: AppColors.tertiaryColor,
                  fontSize: 12,
                  fontFamily: AppFonts.apercu,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                ""'… with autism, this paper is establishing the design process of TaLNA, an application to assist '
                  'the teaching of children with autism basic numeracy and calculation, following the design …'"",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 12,
                  fontFamily: AppFonts.apercu,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star_border,
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    "Evaluate",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.edit_note,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    "Cite",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "78 Releated Articles",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12,
                        fontFamily: AppFonts.apercu,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}