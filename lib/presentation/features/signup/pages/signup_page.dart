import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:guidealt/domain/entities/user.dart';
import 'package:guidealt/domain/errors/error.dart';
import 'package:guidealt/presentation/features/home/pages/home_page.dart';
import 'package:guidealt/presentation/features/home/providers/home_providers.dart';
import 'package:guidealt/presentation/features/home/widgets/app_bar/main_app_bar.dart';
import 'package:guidealt/presentation/features/signup/providers/signup_page_providers.dart';
import 'package:guidealt/theme/app_colors.dart';
import 'package:guidealt/theme/app_fonts.dart';
import 'package:guidealt/theme/app_metrics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({
    Key? key
  }) : super(key: key);

  static const String route = '/signup';

  @override
  ConsumerState<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignUpPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      if (ref.read(HomeProviders.userLoggedProvider) != null) {
        Navigator.of(context).pushNamed(HomePage.route);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppMetrics.appbarHeight),
        child: MainAppBar(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://nova-escola-producao.s3.amazonaws.com/UtwNw8zFmZHQ3NA7vk8cMdz7aMHfJh7K9bF3ksnNGKAXCJS56zA6XFSqgU2G/como-garantir-a-inclusao-de-alunos-com-autismo-nas-atividades-remotas-hibridas-ou-presencias.jpg"
            ),
            opacity: 0.1,
            fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Container(
              width: 500,
              color: Colors.white.withAlpha(125),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.network(
                            "assets/images/app_icon_white.png",
                          ),
                        ),
                      ),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: AppFonts.apercu,
                          fontWeight: FontWeight.bold,
                          fontSize: 32
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: SizedBox(
                          width: 400,
                          child: TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: SizedBox(
                          width: 400,
                          child: TextField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _paswordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.basic,
                        child: TextButton(
                          onPressed: () => _register(context), 
                          child: Container(
                            width: 400,
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(25)
                              ),
                            ),
                            child: Center(
                              child: Text(
                                ref.watch(SignupPageProviders.isLogingProvider) ? "Loading..." : "Register",
                                style: TextStyle(
                                  fontFamily: AppFonts.apercu,
                                  color: AppColors.whiteColor,
                                  fontSize: 15
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                    ]
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _register(BuildContext context) async {
    final result = await SignupPageProviders.register(ref, _emailController.text, _paswordController.text);
    
    result.fold((ErrorHandler exception) {
      _showErrorDialog(context, exception.message);
    }, (User userLogged) {
      ref.read(HomeProviders.userLoggedProvider.state).state = userLogged;
      Navigator.of(context).pushNamed(HomePage.route);
    });

    ref.read(SignupPageProviders.isLogingProvider.state).state = false;
  }

  void _showErrorDialog(BuildContext context, String message) {
    // set up the button
    Widget okButton = FlatButton(
      child: const Text("OK"),
      onPressed: () => Navigator.pop(context),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Error"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}