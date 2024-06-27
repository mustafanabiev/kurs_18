import 'package:flash_chat/modules/auth/pages/login_page.dart';
import 'package:flash_chat/modules/auth/pages/register_page.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 59,
      child: ElevatedButton(
        onPressed: isLogin
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              }
            : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isLogin ? const Color(0xff61B1EA) : const Color(0xff2571B6),
          ),
          shadowColor:
              MaterialStateProperty.all<Color>(const Color(0x40198DE1)),
          elevation: MaterialStateProperty.all<double>(8.0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        child: Text(
          isLogin ? 'Login' : 'Register',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            height: 29.05 / 24,
          ),
        ),
      ),
    );
  }
}
