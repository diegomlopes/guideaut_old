import 'package:flutter/material.dart';
import 'package:guidealt/theme/app_colors.dart';
import 'package:guidealt/theme/app_fonts.dart';

class CanvasWidget extends StatefulWidget {
  const CanvasWidget({Key? key}) : super(key: key);

  @override
  State<CanvasWidget> createState() => _CanvasWidgetState();
}

class _CanvasWidgetState extends State<CanvasWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) { 
        final double firstColumWidthFactor = 0.3;
        final double secondThirsdColumWidthFactor = 0.35;
        final double heightFactor = 0.333333;

        final double totalWidth = constraints.maxWidth;
        final double totalHeight = constraints.maxHeight;

        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: AppColors.blackColor
            )
          ),
          child: Stack(
            children: [
              Container(
                width: constraints.maxWidth * firstColumWidthFactor,
                height: constraints.maxHeight * heightFactor * 2.0,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  border: Border.all(
                    width: 1.0,
                    color: AppColors.blackColor
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 1000,
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: constraints.maxHeight * heightFactor * 2.0),
                width: totalWidth / 2.0,
                height: constraints.maxHeight * heightFactor,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  border: Border.all(
                    width: 1.0,
                    color: AppColors.blackColor
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Relashionship with Sw/App Technologies",
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 1000,
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: constraints.maxWidth * firstColumWidthFactor),
                width: constraints.maxWidth * secondThirsdColumWidthFactor,
                height: constraints.maxHeight * heightFactor,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  border: Border.all(
                    width: 1.0,
                    color: AppColors.blackColor
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Social and Family Aspects",
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 1000,
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only( 
                  left: totalWidth * firstColumWidthFactor + totalWidth * secondThirsdColumWidthFactor
                ),
                width: constraints.maxWidth * secondThirsdColumWidthFactor,
                height: constraints.maxHeight * heightFactor,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  border: Border.all(
                    width: 1.0,
                    color: AppColors.blackColor
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stereotypes / Quirks",
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 1000,
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: constraints.maxHeight * heightFactor, 
                  left: totalWidth * firstColumWidthFactor + totalWidth * secondThirsdColumWidthFactor
                ),
                width: constraints.maxWidth * secondThirsdColumWidthFactor,
                height: constraints.maxHeight * heightFactor,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  border: Border.all(
                    width: 1.0,
                    color: AppColors.blackColor
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Activities that Stress",
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 1000,
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: constraints.maxHeight * heightFactor, left: constraints.maxWidth * firstColumWidthFactor ),
                width: constraints.maxWidth * secondThirsdColumWidthFactor,
                height: constraints.maxHeight * heightFactor,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  border: Border.all(
                    width: 1.0,
                    color: AppColors.blackColor
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Activities that Calm",
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 1000,
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: constraints.maxHeight * heightFactor * 2.0, left: totalWidth / 2.0),
                width: totalWidth / 2.0,
                height: constraints.maxHeight * heightFactor,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  border: Border.all(
                    width: 1.0,
                    color: AppColors.blackColor
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remarks as to the Sw/App",
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 1000,
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}