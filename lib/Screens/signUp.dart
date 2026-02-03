import 'package:easy_localization/easy_localization.dart';
import 'package:evently_new/Screens/Login.dart';
import 'package:evently_new/class/fonts.dart';
import 'package:evently_new/fireBase/FireBase_Functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  static const String routeNamed = 'signUp';
  var emailAddress = TextEditingController();
  var password = TextEditingController();
  var password2 = TextEditingController();
  var name = TextEditingController();
  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Image.asset('assets/images/logo.png'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Form(
            key: fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    //user
                    TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          print('please Enter Your name'.tr());
                        }
                      },
                      style: TextStyle(color: Color(0xff686868)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Theme.of(context).brightness == Brightness.light
                                ? Color(0xffDADADA)
                                : Color(0xff002D8F),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Theme.of(context).brightness == Brightness.light
                                ? Color(0xffDADADA)
                                : Color(0xff002D8F),
                          ),
                        ),
                        hintText: 'user'.tr(),
                        hintStyle: AppFont.regular16.copyWith(
                          color: Color(0xff686868),
                          fontSize: 14,
                        ),
                        prefixIcon: ImageIcon(AssetImage("assets/icons/user.png")),
                        prefixIconColor: Color(0xffB9B9B9),
                      ),
                    ),
                    SizedBox(height: 16),
                    //mail
                    TextFormField(
                      controller: emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please create an email address';
                        }
                        final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value);
                        if (!emailValid) {
                          return 'Please enter a valid email address'.tr();
                        }
                        if (value!.contains('@')) {
                          print('please Type @'.tr());
                        }
                        if (value!.contains('gmail')) {
                          print('Replace with '.tr());
                        }
                        return null;
                      },
                      style: TextStyle(color: Color(0xff686868)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Theme.of(context).brightness == Brightness.light
                                ? Color(0xffDADADA)
                                : Color(0xff002D8F),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Theme.of(context).brightness == Brightness.light
                                ? Color(0xffDADADA)
                                : Color(0xff002D8F),
                          ),
                        ),
                        hintText: 'LoginTitle'.tr(),
                        hintStyle: AppFont.regular16.copyWith(
                          color: Color(0xff686868),
                          fontSize: 14,
                        ),
                        prefixIcon: ImageIcon(AssetImage("assets/icons/sms.png")),
                        prefixIconColor: Color(0xffB9B9B9),
                      ),
                    ),
                    SizedBox(height: 16),
                    //pass
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text'.tr();
                        }
                        // RegExp regex = RegExp(
                        //   r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                        // );
                        // if (!regex.hasMatch(value)) {
                        //   return 'Enter valid password'.tr();
                      //}
                         else {
                          return null;
                        }
                      },
                      style: TextStyle(color: Color(0xff686868)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Theme.of(context).brightness == Brightness.light
                                ? Color(0xffDADADA)
                                : Color(0xff002D8F),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Theme.of(context).brightness == Brightness.light
                                ? Color(0xffDADADA)
                                : Color(0xff002D8F),
                          ),
                        ),
                        hintText: 'passwordTitle'.tr(),
                        hintStyle: AppFont.regular16.copyWith(
                          color: Color(0xff686868),
                          fontSize: 14,
                        ),

                        prefixIcon: ImageIcon(AssetImage("assets/icons/lock.png")),
                        prefixIconColor: Color(0xffB9B9B9),
                        suffixIcon: ImageIcon(
                          AssetImage("assets/icons/eye-slash.png"),
                        ),
                        suffixIconColor: Color(0xffB9B9B9),
                      ),
                    ),
                    SizedBox(height: 16),
                    //pass
                    TextFormField(
                      controller: password2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text'.tr();
                        }
                        // RegExp regex = RegExp(
                        //   r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                        // );
                        // if (!regex.hasMatch(value)) {
                        //   return 'Enter valid password'.tr();
                        // } else {
                        else {if(value!=password.text){
                          return 'Enter valid password'.tr();
                        }
                          return null;
                        }
                      },
                      style: TextStyle(color: Color(0xff686868)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Theme.of(context).brightness == Brightness.light
                                ? Color(0xffDADADA)
                                : Color(0xff002D8F),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Theme.of(context).brightness == Brightness.light
                                ? Color(0xffDADADA)
                                : Color(0xff002D8F),
                          ),
                        ),
                        hintText: 'passwordTitle'.tr(),
                        hintStyle: AppFont.regular16.copyWith(
                          color: Color(0xff686868),
                          fontSize: 14,
                        ),

                        prefixIcon: ImageIcon(AssetImage("assets/icons/lock.png")),
                        prefixIconColor: Color(0xffB9B9B9),
                        suffixIcon: ImageIcon(
                          AssetImage("assets/icons/eye-slash.png"),
                        ),
                        suffixIconColor: Color(0xffB9B9B9),
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
                        FirebaseFunctions.createUserWithEmailAndPassword(
                          emailAddress.text,
                          password.text,
                          name.text,
                          () {
                            Navigator.pushNamed(context, Login.routeNamed);
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
                      'SignUpBotton'.tr(),
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
                      'Already'.tr(),
                      style: TextStyle(color: Color(0xff686868)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Login.routeNamed);
                      },
                      child: Text(
                        'LoginBotton'.tr(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                //or+divider
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
    );
  }
}
