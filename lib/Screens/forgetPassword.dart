import 'package:easy_localization/easy_localization.dart';
import 'package:evently_new/class/fonts.dart';
import 'package:evently_new/fireBase/FireBase_Functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forgetPassword extends StatelessWidget {
  forgetPassword({super.key});

  static const String routeNamed = 'forgetPassword';
  var emailAddress = TextEditingController();
var fromKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .surface,
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .surface,
        title: Text(('ForgetTitle'.tr())),
        titleTextStyle: TextStyle(
          color: Theme
              .of(context)
              .brightness == Brightness.light
              ? Colors.black
              : Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        iconTheme: IconThemeData(
          color: Theme
              .of(context)
              .brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                Theme
                    .of(context)
                    .brightness == Brightness.light
                    ? 'assets/images/forget/change-setting.png'
                    : 'assets/images/forget/change-setting-dark.png',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: TextFormField(
                  controller: emailAddress,
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
              ),
        
              SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                  ),
                  onPressed: () {
                    FirebaseFunctions.sendPasswordReset(
                      emailAddress.text,
                          () {
                            if (emailAddress.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('please_enter_your_email'.tr()),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
        
        
                          },(message) {
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
                    },);
                  },
                  child: Text(
                    'Reset password'.tr(),
                    style: AppFont.Bold20.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
