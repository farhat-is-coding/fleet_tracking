// ignore: use_build_context_synchronously

// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fleet_tracker/services/auth.dart';
import 'package:fleet_tracker/services/firestore.dart';
import 'package:fleet_tracker/shared/snackbars.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AdminLogin extends StatefulWidget {
  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String username = "", secretkey="", password = "";
  bool saving = false;
  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: saving,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        body: Wrap(
          spacing: 50, // to apply margin in the main axis of the wrap
          runSpacing: 25,
          children: [
            Text(
              'Welcome Admin',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            TextFormField(
              onChanged: (value){
                username = value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'agksdng',
                  labelText: 'UserName',
                  prefixIcon: Icon(Icons.star)),
            ),
            TextFormField(
              onChanged: (value){
                password = value;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                prefixIcon: const Icon(Icons.password),
              ),
            ),
            TextFormField(
              onChanged: (value){
                secretkey = value;
              },
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                  hintText: 'xxzz',
                  labelText: 'secret key',
                  prefixIcon: Icon(Icons.security)),
            ),

            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  try{
                    setState((){
                      saving = true;
                    });
                     int result = await FirestoreService().AdminLogin(username, secretkey, password);
                    if(result == 1){ //admin credentials match
                      await AuthService().emailLogin("radcowboy@gmail.com", "cnproject", context);

                      Navigator.pushNamedAndRemoveUntil(context, '/check', (route) => false);

                    }else{
                      final snackBar = FailureSnackbar("No Admin Exists with these credentials");
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                      //Navigator.pop(context);
                    }
                    setState((){
                      saving = false;
                    });
                  }
                  catch(e){
                    setState((){
                      saving = false;
                    });
                    log(e.toString());
                    final snackBar = FailureSnackbar(e.toString());
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }
                },
                child: const Text("Login")
            ),

            ElevatedButton(
                onPressed: () async {

                    await AuthService().anonLogin();
                    Navigator.pushNamedAndRemoveUntil(context, '/check', (route) => false);
                },
                child: const Text("Track a Truck with mail")
            ),
          ],
        ),
      ),
    );
  }
}
