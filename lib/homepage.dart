import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'firehelper.dart';
import 'loginpage.dart';

class Home extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome"),
          ElevatedButton(onPressed: () {
            FireHelper().signOut().then((v) {
              Get.to(LoginPage());
            });
          }, child: Text("SignOut"))
        ],
      ),
    ),
  );
}
}