import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'firehelper.dart';
import 'loginpage.dart';

class RegistrationPAGE extends StatelessWidget {
  String? email;
  String? pass;
  String? name;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:formkey,
        child: ListView(
          children: [
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/295/295128.png",
              height: 100,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: " Name",
                  fillColor: Colors.grey[200],
                  filled: true,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  prefixIcon: const Icon(Icons.text_fields),
                  labelStyle: TextStyle(color: Colors.grey[500]),
                ),
                validator: (name) {
                  if (name!.isEmpty) {
                    return "Enter  value";
                  } else {
                    return null;
                  }
                },
                onSaved: (ename) {
                  name = ename;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: " Email",
                  fillColor: Colors.grey[200],
                  filled: true,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  prefixIcon: const Icon(Icons.text_fields),
                  labelStyle: TextStyle(color: Colors.grey[500]),
                ),
                validator: (uname) {
                  if (uname!.isEmpty) {
                    return "Enter  value";
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
                  labelText: " Name",
                  fillColor: Colors.grey[200],
                  filled: true,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  prefixIcon: const Icon(Icons.text_fields),
                  labelStyle: TextStyle(color: Colors.grey[500]),
                ),
                validator: (password) {
                  if (password!.isEmpty) {
                    return "Password cannot be empty";
                  } else {
                    return null;
                  }
                },
                onSaved: (pwd) {
                  pass = pwd;
                },
              ),
            ),
            ElevatedButton(onPressed: () {
              if(formkey.currentState!.validate()){
                formkey.currentState!.save();
                FireHelper().signUp(mail: email!, password :pass!).then((value) {
                  if(value == null){
                    Get.to(LoginPage());
                  }else{
                    Get.snackbar("Error", value);
                  }
                });
              }
            }, child: const Text("Register"),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
          ],
        ),
      ),
    );
  }
}