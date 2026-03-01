import 'package:easy_localization/easy_localization.dart';
import 'package:evently_new/Screens/Login.dart';
import 'package:evently_new/class/fonts.dart';
import 'package:evently_new/fireBase/FireBase_Functions.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  static const String routeNamed = 'signUp';
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  final name = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo.png', height: 40),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: fromKey,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'تسجيل الدخول إلى حسابك', // النص كما في الصورة
                  style: TextStyle(
                    color: Color(0xff002D8F),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                // الاسم
                _buildTextField(
                  controller: name,
                  hint: 'أدخل اسمك',
                  icon: Icons.person_outline,
                ),
                SizedBox(height: 16),
                // البريد
                _buildTextField(
                  controller: emailAddress,
                  hint: 'تسجيل الدخول إلى حسابك', // حسب الصورة
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: 16),
                // الباسورد
                _buildTextField(
                  controller: password,
                  hint: 'أدخل كلمة المرور',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                SizedBox(height: 16),
                // تأكيد الباسورد
                _buildTextField(
                  controller: password2,
                  hint: 'أدخل كلمة المرور',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                SizedBox(height: 40),
                // زر إنشاء حساب
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff143EAB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        FirebaseFunctions.createUserWithEmailAndPassword(
                          emailAddress.text,
                          password.text,
                          name.text,
                          () => Navigator.pushNamed(context, Login.routeNamed),
                          (msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg))),
                        );
                      }
                    },
                    child: Text('إنشاء حساب', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, Login.routeNamed),
                      child: Text('تسجيل الدخول', style: TextStyle(color: Color(0xff143EAB), decoration: TextDecoration.underline)),
                    ),
                    Text('هل لديك حساب بالفعل؟'),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text('أو')),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 20),
                // زر جوجل
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    side: BorderSide(color: Color(0xff143EAB)),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/google.png', height: 24), // تأكد من وجود الأيقونة
                      SizedBox(width: 10),
                      Text('Login with Google', style: TextStyle(color: Color(0xff143EAB), fontSize: 18)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String hint, required IconData icon, bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: Icon(icon, color: Colors.grey),
        prefixIcon: isPassword ? Icon(Icons.visibility_off_outlined, color: Colors.grey) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
      ),
    );
  }
}
