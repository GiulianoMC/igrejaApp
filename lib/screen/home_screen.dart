import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appigreja/screen/profile_screen.dart';
import 'package:appigreja/screen/email_pass_screen.dart';

import '../provider/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  int bottomSelectedIndex = 0;

  @override
  void didChangeDependencies() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (mounted) authProvider.updateEmailVerificationState();
    super.didChangeDependencies();
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: const <Widget>[
        ProfileScreen(),
        ProfileScreen(),
        ProfileScreen(),
        ProfileScreen(),
        ProfileScreen(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      currentPageIndex = index;
      pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, model, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF253C59),
          title: const Text(
            '',
          ),
          centerTitle: true,
          actions: [
            StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  return (snapshot.hasData)
                      ? Center(
                      child: IconButton(
                        onPressed: () {
                          model.logOut();
                        },
                        icon: const Icon(Icons.logout,color: Colors.white),

                      )
                  )
                      : IconButton(
                      icon: const Icon(Icons.login, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const EmailPassScreen()));
                      });
                }),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: bottomTapped,
          selectedIndex: currentPageIndex,
          shadowColor: Colors.blue,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Image(
                image: AssetImage(
                  'assets/images/home_02.png',
                ),
                height: 35,
              ),
              icon: Image(
                image: AssetImage(
                  'assets/images/home_01.png',
                ),
                height: 35,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Image(
                image: AssetImage(
                  'assets/images/cardapio_02.png',
                ),
                height: 35,
              ),
              icon: Image(
                image: AssetImage(
                  'assets/images/cardapio_01.png',
                ),
                height: 35,
              ),
              label: 'Cardápio',
            ),
            NavigationDestination(
              selectedIcon: Image(
                image: AssetImage(
                  'assets/images/avisos_02.png',
                ),
                height: 35,
              ),
              icon: Image(
                image: AssetImage(
                  'assets/images/avisos_01.png',
                ),
                height: 35,
              ),
              label: 'Avisos',
            ),
            NavigationDestination(
              selectedIcon: Image(
                image: AssetImage(
                  'assets/images/perfil_02.png',
                ),
                height: 35,
              ),
              icon: Image(
                image: AssetImage(
                  'assets/images/perfil_01.png',
                ),
                height: 35,
              ),
              label: 'Perfil',
            ),
          ],
        ),
        body: buildPageView(),);
    });
  }
}