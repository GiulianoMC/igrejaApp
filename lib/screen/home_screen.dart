import 'package:appigreja/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appigreja/screen/profile_screen.dart';
import 'package:appigreja/screen/email_pass_screen.dart';
import 'package:appigreja/screen/register_email_pass_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void pageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      currentPageIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(''),
        centerTitle: true,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // Define a cor de fundo do `BottomNavigationBar`
          canvasColor: Color(0xFF2d4b73),
        ),
        child: BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: bottomTapped,// Definindo a cor de fundo do BottomNavigationBar
          selectedItemColor: Colors.white, // Definindo a cor do item selecionado
          unselectedItemColor: Color(0xFF99b4bf), // Definindo a cor dos itens não selecionados
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_sharp),
              label: 'Almoço',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.campaign_sharp),
              label: 'Avisos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories_sharp),
              label: 'Alimento Diário',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
      body: buildPageView(),
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: pageChanged,
      children: const <Widget>[
        EmailPassScreen(),
        //ExploreScreen(),
        //FeaturedScreen(),
      ],
    );
  }
}
