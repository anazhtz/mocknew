import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mocknew/regis.dart';

import 'firehelper.dart';
import 'homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  String? email;
  String? pwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1575936123452-b67c3203c357"
                    "?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3f"
                    "DB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                height: 100,
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade400),
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Mobile Number or Email Address',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  validator: (uname) {
                    if (uname!.isEmpty) {
                      return "Enter Some value";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (name) {
                    email = name;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey[500]),),
                  validator: (password) {
                    if (password!.isEmpty) {
                      return "Password cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (pass) {
                    pwd = pass;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      FireHelper().signIn(mail: email!, pass: pwd!).then((value){
                        if(value == null){
                          Get.to(Home());
                        }else{
                          Get.snackbar("Error", "User not found $value");
                        }
                      });
                    }
                  },
                  child: const Text("Login"),style: ElevatedButton.styleFrom(backgroundColor: Colors.red,fixedSize: Size(200, 50)),),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(RegistrationPAGE());
                  },
                  child: const Text("SignUp Here"),style: TextButton.styleFrom(backgroundColor: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }
}