import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:guidealt/domain/entities/user.dart';
import 'package:guidealt/domain/errors/error.dart';
import 'package:guidealt/presentation/features/home/pages/home_page.dart';
import 'package:guidealt/presentation/features/home/providers/home_providers.dart';
import 'package:guidealt/presentation/features/home/widgets/app_bar/main_app_bar.dart';
import 'package:guidealt/presentation/features/signin/providers/signin_page_providers.dart';
import 'package:guidealt/presentation/features/signup/pages/signup_page.dart';
import 'package:guidealt/theme/app_colors.dart';
import 'package:guidealt/theme/app_fonts.dart';
import 'package:guidealt/theme/app_metrics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({
    Key? key
  }) : super(key: key);

  static const String route = '/signin';

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {

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
                        "Sign In",
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
                      SizedBox(
                        width: 390,
                        height: 30,
                        child: Row(
                          children: [
                            Text(
                              "Forgot your password?",
                              style: TextStyle(
                                fontFamily: AppFonts.apercu,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: AppColors.primaryColor
                              )
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed(SignUpPage.route),
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                  fontFamily: AppFonts.apercu,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: AppColors.primaryColor
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.basic,
                        child: TextButton(
                          onPressed: () => _login(context), 
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
                                ref.watch(SigninPageProviders.isLogingProvider) ? "Loading..." : "Login",
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

  void _login(BuildContext context) async {
    final result = await SigninPageProviders.login(ref, _emailController.text, _paswordController.text);
    
    result.fold((ErrorHandler exception) {
      _showErrorDialog(context, exception.message);
    }, (User userLogged) {
      ref.read(HomeProviders.userLoggedProvider.state).state = userLogged;
      Navigator.of(context).pushNamed(HomePage.route);
    });

    ref.read(SigninPageProviders.isLogingProvider.state).state = false;
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