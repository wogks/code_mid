// ignore_for_file: use_build_context_synchronously

import 'package:codefac_mid/common/const/colors.dart';
import 'package:codefac_mid/common/const/data.dart';
import 'package:codefac_mid/common/layout/default_layout.dart';
import 'package:codefac_mid/common/view/root_tab.dart';
import 'package:codefac_mid/user/view/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // deleteToken();
    checkToken();
    super.initState();
  }

  deleteToken() async {
    await storage.deleteAll();
  }

  checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if (accessToken == null || refreshToken == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const RootTab(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/img/logo/logo.png',
                width: MediaQuery.of(context).size.width / 2),
            const SizedBox(height: 16),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
