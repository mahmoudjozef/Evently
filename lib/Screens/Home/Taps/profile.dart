import 'package:easy_localization/easy_localization.dart';
import 'package:evently_new/Screens/Login.dart';
import 'package:evently_new/providers/Theme_Provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: themeProvider.themeMode == ThemeMode.light
          ? const Color(0xffF2F5FF)
          : const Color(0xff101127),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    user?.displayName ?? 'John Safwat',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user?.email ?? 'johnsafwat.route@gmail.com',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildOptionCard(
                  context,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dark mode',
                        style: _optionTextStyle(context),
                      ),
                      Switch(
                        value: themeProvider.themeMode == ThemeMode.dark,
                        onChanged: (value) {
                          themeProvider.changeTheme(
                              value ? ThemeMode.dark : ThemeMode.light);
                        },
                        activeColor: const Color(0xff143EAB),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildOptionCard(
                  context,
                  onTap: () {
                    if (context.locale == const Locale('en', 'US')) {
                      context.setLocale(const Locale('ar', 'EG'));
                    } else {
                      context.setLocale(const Locale('en', 'US'));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Language',
                        style: _optionTextStyle(context),
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Color(0xff143EAB)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildOptionCard(
                  context,
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, Login.routeNamed, (route) => false);
                  },
                  backgroundColor: const Color(0xffFF5659),
                  child: Row(
                    children: [
                      const Icon(Icons.logout, color: Colors.white),
                      const SizedBox(width: 16),
                      const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context,
      {required Widget child, Color? backgroundColor, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor ?? (Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xff101127)),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xff143EAB)),
        ),
        child: child,
      ),
    );
  }

  TextStyle _optionTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.black
          : Colors.white,
    );
  }
}
