import 'package:easy_localization/easy_localization.dart';
import 'package:evently_new/Screens/Home/HomeScreen.dart';
import 'package:evently_new/Screens/forgetPassword.dart';
import 'package:evently_new/Screens/signUp.dart';
import 'package:evently_new/class/fonts.dart';
import 'package:evently_new/fireBase/FireBase_Functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  static const String routeNamed = 'Login';
  var emailAddress = TextEditingController();
  var password = TextEditingController();
  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: 100),
                  Text(
                    'LoginTitle'.tr(),
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSecondary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24),
                  //TEXT LOG AND PAS
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //log
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Craete an email address'.tr();
                          }
                          if (value!.contains('@')) {
                            print('please Type @'.tr());
                          }
                          if (value!.contains('gmail')) {
                            print(
                              'Replace with'.tr()
                                  .tr(),
                            );
                          }
                          return null;
                        },
        
                        controller: emailAddress,
                        style: TextStyle(color: Color(0xff686868)),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                  ? Color(0xffDADADA)
                                  : Color(0xff002D8F),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                  ? Color(0xffDADADA)
                                  : Color(0xff002D8F),
                            ),
                          ),
                          hintText: 'LoginTitle'.tr(),
                          hintStyle: AppFont.regular16.copyWith(
                            color: Color(0xff686868),
                            fontSize: 14,
                          ),
                          prefixIcon: ImageIcon(
                            AssetImage("assets/icons/sms.png"),
                          ),
                          prefixIconColor: Color(0xffB9B9B9),
                        ),
                      ),
                      SizedBox(height: 16),
                      //pas
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password'.tr();
                          }
                          return null;
                        },
        
                        controller: password,
                        style: TextStyle(color: Color(0xff686868)),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                  ? Color(0xffDADADA)
                                  : Color(0xff002D8F),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                  ? Color(0xffDADADA)
                                  : Color(0xff002D8F),
                            ),
                          ),
                          hintText: 'passwordTitle'.tr(),
                          hintStyle: AppFont.regular16.copyWith(
                            color: Color(0xff686868),
                            fontSize: 14,
                          ),
        
                          prefixIcon: ImageIcon(
                            AssetImage("assets/icons/lock.png"),
                          ),
                          prefixIconColor: Color(0xffB9B9B9),
                          suffixIcon: ImageIcon(
                            AssetImage("assets/icons/eye-slash.png"),
                          ),
                          suffixIconColor: Color(0xffB9B9B9),
                        ),
                      ),
                      //forget
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, forgetPassword.routeNamed);
                        },
                        child: Text(
                          'ForgetTitle'.tr(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 47),
                  //ElevatedButton
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        if (fromKey.currentState!.validate()) {
                          FirebaseFunctions.signInWithEmailAndPassword(
                            emailAddress.text,
                            password.text,
                            () {
                              Navigator.pushNamed(context, Homescreen.routeNamed);
                            },
                            (message) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.grey.shade900,
                                  content: Text(
                                    message,
                                    style: const TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        'LoginBotton'.tr(),
                        style: AppFont.Bold20.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  //TextBotton
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t'.tr(),
                        style: TextStyle(color: Color(0xff686868)),
                      ),
        
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            SignUp.routeNamed,
                          );
                        },
                        child: Text(
                          'signup'.tr(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //diveder/or
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Color(0xffDADADA)
                              : Theme.of(context).colorScheme.primary,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),
                      Text(
                        'or'.tr(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Color(0xffDADADA)
                              : Theme.of(context).colorScheme.primary,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),
                    ],
                  ),
                  //withGoogal
                  SizedBox(height: 24),
                  Container(
                    alignment: Alignment.center,
                    child: Theme.of(context).brightness == Brightness.light
                        ? InkWell(
                            onTap: () {},
                            child: Image.asset('assets/icons/Main btn light.png'),
                          )
                        : InkWell(
                            onTap: () {},
                            child: Image.asset('assets/icons/Main btn dark.png'),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
