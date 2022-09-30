import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:guidealt/presentation/features/home/widgets/app_bar/main_app_bar.dart';
import 'package:guidealt/theme/app_colors.dart';
import 'package:guidealt/theme/app_fonts.dart';
import 'package:guidealt/theme/app_metrics.dart';

class ProAutPage extends StatefulWidget {
  const ProAutPage({
    Key? key
  }) : super(key: key);

  static const String route = '/proaut';

  @override
  State<ProAutPage> createState() => _ProAutPageState();
}

class _ProAutPageState extends State<ProAutPage> {

  int _stepAbout = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppMetrics.appbarHeight),
        child: MainAppBar(),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                          "About ProAut",
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
                          "Immersion Phase",
                          style: TextStyle(
                            color: AppColors.lightGrey,
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
                          "Analyses Phase",
                          style: TextStyle(
                            color: AppColors.lightGrey,
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
                          "Ideation Phase",
                          style: TextStyle(
                            color: AppColors.lightGrey,
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
                          "Prototyping Phase",
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
                      "The ProAut",
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
                          "Home > ",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontFamily: AppFonts.apercu,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "ProAut",
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
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 700,
                        child: Stepper(
                          currentStep: _stepAbout,
                          onStepTapped: (step) {
                            setState(() {
                              _stepAbout = step;
                            });
                          },
                          controlsBuilder: (BuildContext context, ControlsDetails details) {
                            if (_stepAbout == 0) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: GestureDetector(
                                  onTap: () => setState(() { _stepAbout += 1; }),
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "Next >",
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16,
                                        fontFamily: AppFonts.apercu,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else if (_stepAbout == 4) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: GestureDetector(
                                  onTap: () => setState(() { _stepAbout -= 1; }),
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "< Back",
                                      style: TextStyle(
                                        color: AppColors.lightGrey,
                                        fontSize: 16,
                                        fontFamily: AppFonts.apercu,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () => setState(() { _stepAbout -= 1; }),
                                      child: Container(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "< Back",
                                          style: TextStyle(
                                            color: AppColors.lightGrey,
                                            fontSize: 16,
                                            fontFamily: AppFonts.apercu,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => setState(() { _stepAbout += 1; }),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 16.0),
                                        child: Container(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "Next >",
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 16,
                                              fontFamily: AppFonts.apercu,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          steps: [
                            Step(
                              title: Text(
                                "The ProAut",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontFamily: AppFonts.apercu,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              content: FutureBuilder(
                                future: DefaultAssetBundle.of(context).loadString
                                  ("proaut/proaut.md"),
                                builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                                  if (snapshot.hasData) {
                                    return SizedBox(
                                      width: 700,
                                      height: 650,
                                      child: Markdown(
                                        data: snapshot.data!, 
                                        onTapLink: (link, b, c){
                                        // setFile(link);
                                        setState((){});
                                      },
                                      ),
                                    );
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                              // const Text(
                              // ""
                              // 'O trabalho de Melo et al. (2021), descreve um processo específico para apoiar a prototipação de '
                              // 'interfaces de aplicações para pessoas autistas denominado ProAut. O ProAut tem suas etapas baseadas '
                              // 'no Design Thinking [5], são elas: Imersão, Análise, Ideação e Prototipação. Cada uma dessas etapas '
                              // 'possui atividades e artefatos a serem gerados dentro do processo que são descritos a seguir:'
                              // ""),
                              isActive: true,
                              state: _stepAbout >= 1 ? StepState.complete : StepState.indexed,
                            ),
                            Step(
                              title: Text(
                                "Design Thinking",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontFamily: AppFonts.apercu,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              content: const Text(
                              ""
                              'O trabalho de Melo et al. (2021), descreve um processo específico para apoiar a prototipação de '
                              'interfaces de aplicações para pessoas autistas denominado ProAut. O ProAut tem suas etapas baseadas '
                              'no Design Thinking [5], são elas: Imersão, Análise, Ideação e Prototipação. Cada uma dessas etapas '
                              'possui atividades e artefatos a serem gerados dentro do processo que são descritos a seguir:'
                              ""),
                              isActive: true,
                              state: _stepAbout >= 2 ? StepState.complete : StepState.indexed,
                            ),
                            Step(
                              title: Text(
                                "Colaborative Repositories",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontFamily: AppFonts.apercu,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              content: const Text(
                              ""
                              'O trabalho de Melo et al. (2021), descreve um processo específico para apoiar a prototipação de '
                              'interfaces de aplicações para pessoas autistas denominado ProAut. O ProAut tem suas etapas baseadas '
                              'no Design Thinking [5], são elas: Imersão, Análise, Ideação e Prototipação. Cada uma dessas etapas '
                              'possui atividades e artefatos a serem gerados dentro do processo que são descritos a seguir:'
                              ""),
                              isActive: true,
                              state: _stepAbout >= 3 ? StepState.complete : StepState.indexed,
                            ),
                            Step(
                              title: Text(
                                "Designing for Autists",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontFamily: AppFonts.apercu,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              content: const Text(
                              ""
                              'O trabalho de Melo et al. (2021), descreve um processo específico para apoiar a prototipação de '
                              'interfaces de aplicações para pessoas autistas denominado ProAut. O ProAut tem suas etapas baseadas '
                              'no Design Thinking [5], são elas: Imersão, Análise, Ideação e Prototipação. Cada uma dessas etapas '
                              'possui atividades e artefatos a serem gerados dentro do processo que são descritos a seguir:'
                              ""),
                              isActive: true,
                              state: _stepAbout >= 4 ? StepState.complete : StepState.indexed,
                            ),
                            Step(
                              title: Text(
                                "Other Informations",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontFamily: AppFonts.apercu,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              content: const Text(
                              ""
                              'O trabalho de Melo et al. (2021), descreve um processo específico para apoiar a prototipação de '
                              'interfaces de aplicações para pessoas autistas denominado ProAut. O ProAut tem suas etapas baseadas '
                              'no Design Thinking [5], são elas: Imersão, Análise, Ideação e Prototipação. Cada uma dessas etapas '
                              'possui atividades e artefatos a serem gerados dentro do processo que são descritos a seguir:'
                              ""),
                              isActive: true,
                              state: _stepAbout >= 5 ? StepState.complete : StepState.indexed,
                            ),
                          ]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}