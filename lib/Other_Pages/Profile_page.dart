import 'dart:io';

import 'package:bsafe24x7/Other_Pages/Terms_and_conditions.dart';
import 'package:bsafe24x7/Other_Pages/add_contacts.dart';
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
            SizedBox(height: 70),
            CircleAvatar(
              foregroundImage: AssetImage("assets/woman.png"),
              radius: 80.0,
              backgroundImage: NetworkImage("https://loading.io/icon/7xfhss"),
              backgroundColor: Colors.black12,
            ),

            SizedBox(height: 50),
            Divider(indent: 20,
              endIndent: 20,),
            ListTile(
              leading: Container(padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Icon(Icons.person)),
              title: Text(
                "Manage Profile Settings",
              ),
              subtitle: Text("Update Profile for Your Account"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {},
            ),


            ListTile(
              leading: Container(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0)
                  ,child: Icon(Icons.add_alert)),
              title: Text(
                "Manage Alert Settings",
              ),
              subtitle: Text("Update Your Alert Settings"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {},
            ),
            SizedBox(height: 10,),

            ListTile(
              leading: Container(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Icon(Icons.call)),
              title: Text(
                "Manage Contacts",
              ),
              subtitle: Text("Add or Delete Contacts"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AddContactsPage()));
              },
            ),

            SizedBox(height: 10,),
            ListTile(

              leading: Container(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Icon(Icons.message)),
              title: Text(
                "Help",
              ),
              subtitle: Text("Raise your Queries"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {},
            ),

            SizedBox(height: 10,),
            ListTile(

              leading: Container(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Icon(Icons.document_scanner_outlined)),
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
            SizedBox(height: 20,),

            Container(
              height: 35,
              width: 100,
              child: TextButton(
                onPressed: () {},
                child: Text('Log Out', style: TextStyle(color: Colors.white),),
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                      255, 255, 96, 125),
                  elevation: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}