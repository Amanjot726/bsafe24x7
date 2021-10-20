import 'package:bsafe24x7/Auth/verify_phone.dart';
import 'package:bsafe24x7/Modal/guardian.dart';
import 'package:bsafe24x7/Util/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AddContactsPage extends StatefulWidget {
  // String? userID = FirebaseAuth.instance.currentUser!= null ? FirebaseAuth.instance.currentUser!.uid : "SnQV4CwP0xlcRmmfbAVk";
  String userID = "SnQV4CwP0xlcRmmfbAVk";
  AddContactsPage({Key? key, userID="SnQV4CwP0xlcRmmfbAVk"}) : super(key: key);

  @override
  _AddContactsPageState createState() => _AddContactsPageState();
}

class _AddContactsPageState extends State<AddContactsPage> {

  final _Form_key = GlobalKey<FormState>();

  addContacts(){
    MyGuardian guardian = MyGuardian(
        name: nameController.text,
        phno: phoneController.text
    );
    var dataToSave = guardian.toMap();
    FirebaseFirestore.instance.collection(Util.USER_COLLECTION)
        .doc(widget.userID)
        .collection(Util.GUARDIANS_COLLECTION)
        .doc()
        .set(dataToSave)
        .whenComplete(() {
          Show_Snackbar(context: context, message: "Contact Saved");
        });
    nameController.text = "";
    nameController.clear();
    phoneController.text = "";
    phoneController.clear();
    setState(() {
      _Form_key.currentState!.reset();
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
// top: height * 0.45,
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return const RadialGradient(
              center: Alignment.topLeft,
              radius: 1.0,
              colors: <Color>[Color.fromARGB(255, 255, 96, 125), Color.fromARGB(255, 179, 26, 75)],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Text(
            "BSafe-24x7",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // centerTitle: true,
        backgroundColor: Colors.pink.shade100,
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Image.asset('assets/addContacts.png',
              height: 280,
            ),
            // SingleChildScrollView(
            //   physics: BouncingScrollPhysics(),
            //   scrollDirection: Axis.horizontal,
            //   child: Container(
            //     color: Color.fromARGB(255, 255, 255, 255),
            //     child: Row(
            //       children: [
            //         Container(
            //           margin: EdgeInsets.all(6),
            //           height: 180,
            //           width: MediaQuery.of(context).size.width/2,
            //           decoration: BoxDecoration(
            //             color: Color.fromARGB(255, 255, 96, 125),
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //         ),
            //         Container(
            //           margin: EdgeInsets.all(6),
            //           height: 180,
            //           width: MediaQuery.of(context).size.width/2,
            //           decoration: BoxDecoration(
            //             color: Color.fromARGB(133, 255, 96, 125),
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //         ),
            //         Container(
            //           margin: EdgeInsets.all(6),
            //           height: 180,
            //           // color: Colors.pinkAccent,
            //           width: MediaQuery.of(context).size.width/2,
            //           decoration: BoxDecoration(
            //             color: Color.fromARGB(255, 255, 96, 125),
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) {
                  return RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1.0,
                    colors: <Color>[Color.fromARGB(255, 255, 96, 125), Colors.black38],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: Text('ADD CONTACTS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontStyle: FontStyle.normal, letterSpacing: 0.8),),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: _Form_key,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                      autofocus: false,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return 'Name is required';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                        filled: true,
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.grey,
                        ),
                        // contentPadding: EdgeInsets.only(left: 30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          gapPadding: 0,
                          borderSide: BorderSide.none,
                        ),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 96, 125),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: phoneController,
                      autofocus: false,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return 'Phone number is required';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Mobile Number',
                        filled: true,
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 25,
                          color: Colors.grey,
                        ),
                        // contentPadding: EdgeInsets.only(left: 30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          gapPadding: 0,
                          borderSide: BorderSide.none,
                        ),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 96, 125),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 10,),
            Container(
              height: 40,
              width: 100,
              margin: EdgeInsets.symmetric(horizontal: 122),
              child: TextButton(
                onPressed: () {
                  addContacts();
                },
                child: Text('ADD', style: TextStyle(color: Colors.white),),
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 96, 125),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
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
// #FF607D