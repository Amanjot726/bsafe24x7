import 'dart:io';

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
      body: Column(
        children: [

          Card(child:

          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage("https://loading.io/icon/7xfhss"),
            backgroundColor: Colors.transparent,
          )),


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
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
