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
            SizedBox(height: 90),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                height: 150,
                width: 150,
                padding: EdgeInsets.only(top: 22),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 234, 234),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Image.asset("assets/woman.png",
                  height: 150,
                ),
              ),
            ),

            SizedBox(height: 80),

            Divider(indent: 15, endIndent: 15,height: 0,),

            ListTile(
              leading: Container(padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Icon(Icons.person)),
              title: Text(
                "Manage Profile Settings",
              ),
              subtitle: Text("Update Profile for Your Account"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {},
            ),

            Divider(indent: 15, endIndent: 15,height: 0,),

            ListTile(
              leading: Container(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0)
                  ,child: Icon(Icons.add_alert)),
              title: Text(
                "Manage Alert Settings",
              ),
              subtitle: Text("Update Your Alert Settings"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {},
            ),
            // SizedBox(height: 10,),

            Divider(indent: 15, endIndent: 15,height: 0,),

            ListTile(
              leading: Container(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
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

            Divider(indent: 15, endIndent: 15,height: 0,),

            ListTile(

              leading: Container(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Icon(Icons.message)),
              title: Text(
                "Help",
              ),
              subtitle: Text("Raise your Queries"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {},
            ),

            Divider(indent: 15, endIndent: 15,height: 0,),

            ListTile(

              leading: Container(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
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

            Divider(indent: 15, endIndent: 15,height: 0,),

            SizedBox(height: 25,),

            Container(
              height: 38,
              width: 100,
              child: TextButton(
                onPressed: () {},
                child: Text('Log Out', style: TextStyle(color: Colors.white,fontSize: 16),),
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 96, 125),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}