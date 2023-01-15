import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fleet_tracker/services/auth.dart';
import 'package:fleet_tracker/services/firestore.dart';
import 'package:fleet_tracker/shared/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet_tracker/screens/customer/customer_tracking_trucker.dart';


class UserSearching extends StatefulWidget {
  static const id = "user_tracking_driver_screen";
  const UserSearching({Key? key}) : super(key: key);

  @override
  State<UserSearching> createState() => _UserSearchingState();
}

class _UserSearchingState extends State<UserSearching> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String email="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.primary),
      body: Wrap(
        spacing: 50, // to apply margin in the main axis of the wrap
        runSpacing: 25,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.blueAccent,
            child: Image.asset('images/img.png', fit: BoxFit.cover),
          ),
          TextFormField(
            onChanged: (value){email=value;},
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: 'ABC-0123',
                labelText: 'Trucker Email',
                prefixIcon: Icon(Icons.email)),
          ),
          ElevatedButton(
              onPressed: () async { // first i have to check whether that input exists in 'active' collection if it does go to next screen
                int result = await FirestoreService().checkIfActive(email);
                if(result == 1){ // the driver exists
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>DriverLocation(driverEmail: email, status: 'active',)));
                }
                else{
                  final snackBar = FailureSnackbar("Looks Like this driver doesn't exists!");
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
              },
              child: const Text("Track!")),
          ElevatedButton(
              onPressed: () async {
                  await AuthService().signOut();
                  Navigator.pushNamedAndRemoveUntil(context, '/check', (route) => false);
                },
              child: const Text("Go Back"),),
        ],
      ),
    );
  }
}


