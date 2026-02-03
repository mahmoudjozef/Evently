import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../class/colors.dart';
import '../class/fonts.dart';
import '../providers/Theme_Provider.dart';
import 'intro_screen.dart';

class OnbordingScreen extends StatelessWidget {
  OnbordingScreen({super.key});

  static const String routeNamed = 'OnbordingScreen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: //logo
            Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? 'assets/images/logo.png'
                  : "assets/images/logo in dark.png",
            ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? 'assets/images/OnBording/being-creative.png'
                  : 'assets/images/OnBording/dark/being-creative.png',
            ),
            SizedBox(height: 24),
            //title
            Text(
              'Title'.tr(),
              style: AppFont.Bold20.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            SizedBox(height: 8),
            //SubTitle
            Text(
              'SubTitle'.tr(),
              style: AppFont.regular16.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            SizedBox(height: 16),
            //language
            Row(
              children: [
                Text(
                  'language'.tr(),
                  style: AppFont.regular16.copyWith(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('en', 'US'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'english'.tr(),
                    style: AppFont.Bold20.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('ar', 'EG'));
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  child: Text(
                    'arabic'.tr(),
                    style: AppFont.Bold20.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            //theme
            Row(
              children: [
                Text(
                  'theme'.tr(),
                  style: AppFont.regular16.copyWith(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                Spacer(),
                //sun
                ElevatedButton(
                  onPressed: () {
                    provider.changeTheme(ThemeMode.light);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/OnBording/sun.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                //moon
                ElevatedButton(
                  onPressed: () {
                    provider.changeTheme(ThemeMode.dark);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/OnBording/moon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // botton
            SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    intro_screen.routeNamed,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),

                child: Text(
                  'start'.tr(),
                  style: AppFont.Bold20.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
