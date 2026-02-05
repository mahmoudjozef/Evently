import 'package:easy_localization/easy_localization.dart';
import 'package:evently_new/Screens/Add%20event/Add_event_Sceren.dart';
import 'package:evently_new/Screens/Home/Taps/Favorite.dart';
import 'package:evently_new/Screens/Home/Taps/Home_page.dart';
import 'package:evently_new/Screens/Home/Taps/profile.dart';
import 'package:evently_new/providers/Home_prov.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  static const String routeNamed = 'Homescreen';

  int BotoomNavegator = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProv(),
      builder: (context, child) {
        var HomeProvider = Provider.of<HomeProv>(context);
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            actions: [
              Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 8)),
              Image.asset(
                Theme.of(context).brightness == Brightness.light
                    ? 'assets/icons/HOME/sun.png'
                    : 'assets/icons/HOME/moon.png',
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: 15),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                child: Image.asset(
                  context.locale.languageCode == 'en'
                      ? 'assets/icons/HOME/EN.png'
                      : 'assets/icons/HOME/AR.png',
                ),
              ),
            ],
            title: ListTile(
              title: Text(
                'Welcome Back ✨',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Theme.brightnessOf(context) == Brightness.light
                      ? Color(0xff686868)
                      : Color(0xffD6D6D6),
                ),
              ),
              subtitle: Text(
                'John Safwan',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.brightnessOf(context) == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(28),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () {Navigator.pushNamed(context, AddEventSceren.routeNamed);},
            child: Icon(Icons.add, color: Colors.white),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              HomeProvider.ChangeBotoomNavegationIndex(value);
            },
            currentIndex: HomeProvider.BotoomNavegation,
            showSelectedLabels: true,
            selectedLabelStyle: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.primary,
            ),
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? Color(0xffFFFFFF)
                : Color(0xff000F30),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/Bottom/home-2.png',
                  color: HomeProvider.BotoomNavegation == 0
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/Bottom/Vector.png',
                  color: HomeProvider.BotoomNavegation == 1
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/Bottom/user.png',
                  color: HomeProvider.BotoomNavegation == 2
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
                label: 'profile',
              ),
            ],
          ),
          body: Taps[HomeProvider.BotoomNavegation],
        );
      },
    );
  }

  List<Widget> Taps = [Home(), Favorite(), profile()];
}
