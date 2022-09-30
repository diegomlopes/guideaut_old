import 'package:flutter/material.dart';
import 'package:guidealt/domain/entities/user.dart';
import 'package:guidealt/presentation/features/home/providers/home_providers.dart';
import 'package:guidealt/presentation/features/home/widgets/app_bar/main_app_bar.dart';
import 'package:guidealt/presentation/features/home/widgets/logged_app_bar/logged_app_bar.dart';
import 'package:guidealt/presentation/features/home/widgets/search_field/search_field.dart';
import 'package:guidealt/theme/app_colors.dart';
import 'package:guidealt/theme/app_fonts.dart';
import 'package:guidealt/theme/app_metrics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const String route = '/';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  
  final User _user = User(
    id: 1,
    email: "", 
    password: "",
    firstName: "Diego",
    secondName: "Lopes",
    type: 1
  );

  @override
  void initState() {
    super.initState();

    // CategoryDataSourceSql().addCategory(
    //   Category(description: "Texts", isMandatoryReference: true, user: _user)
    // ).then((value) => print("Conseguiu")).onError((error, stackTrace) => print("Aqui $error"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppMetrics.appbarHeight),
        child: ref.watch(HomeProviders.userLoggedProvider) == null ? const MainAppBar() : const LoggedAppBar(),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
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
        child: Center(
          child: Column(
            children: <Widget>[
              const Spacer(flex: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(
                        "assets/images/app_icon_white.png",
                      ),
                    ),
                  ),
                  Text(
                    "GuideAut",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 40,
                      fontFamily: AppFonts.apercu,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SearchField(
                width: 450,
                buttonColor: AppColors.lightGrey,
              ),
              const Spacer(flex: 10),
            ],
          ),
        ),
      ),
    );
  }
}