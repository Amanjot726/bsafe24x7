import 'dart:io';

import 'package:bsafe24x7/Other_Pages/Terms_and_conditions.dart';
import 'package:bsafe24x7/Util/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            CircleAvatar(foregroundImage: AssetImage(Util.Logo),
                radius: 80.0,
                backgroundImage: NetworkImage("https://loading.io/icon/7xfhss"),
                backgroundColor: Util.color,
              ),

            SizedBox(height: 50),
            Divider(),


            Container(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  "Manage Alert Settings",
                ),
                subtitle: Text("Update Your Data for Your Account"),
                trailing: Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () {},
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: ListTile(
                leading: Icon(Icons.message),
                title: Text(
                  "Help",
                ),
                subtitle: Text("Raise your Queries"),
                trailing: Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () {},
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: ListTile(

                leading: Icon(Icons.document_scanner_outlined),
                title: Text(
                  "Terms & Conditions",
                ),
                subtitle: Text("Check our Terms and Conditions"),
                trailing: Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => TnCPage()
                  ));
                },
              ),
            ),
            Container( width: 100,
              color: Util.color,
              child: TextButton(child: Text("Logout", style: TextStyle(color: Colors.white)),
                onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Util.color)
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
