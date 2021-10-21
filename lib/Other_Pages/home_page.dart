import 'package:bsafe24x7/Util/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map imageUploaded = {
    'imageURL' : '',
    'imageName' : 'Select to Upload Image',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          IconButton(
            onPressed: () async {
              imageUploaded = await Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    ImagePickerPage(
                      folderName: Util.USER_COLLECTION,
                      imageName: DateTime.now().toString(),
                    ),
              ));
              FirebaseFirestore.instance
                  .collection(Util.USER_COLLECTION)
                  .doc(Util.uid).collection("databaseOfUser").doc("images")
                  .set({'images':[]},SetOptions(merge: true));
              FirebaseFirestore.instance
                  .collection(Util.USER_COLLECTION)
                  .doc(Util.uid).collection("databaseOfUser").doc("images")
                  .set({'images':[imageUploaded['imageURL']]},SetOptions(merge: true));
            },
            icon: Icon(Icons.upload_rounded),
          ),
        ],
        // centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tooltip(
                message: "Danger!! ALERT Guardians",
                verticalOffset: 140,
                child: Container(
                  height: 260,
                  width: 260,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(69, 26, 26, 26),
                          blurRadius: 6.0,
                          spreadRadius: 3.0,
                          offset: Offset(
                            -0.0,
                            1.0,
                          ),
                        ),
                      ]
                  ),
                  child: Material(
                    shape: CircleBorder(),
                    // clipBehavior: Clip.hardEdge,
                    color: Color.fromARGB(255, 246, 246, 246),
                    child: InkWell(
                      splashColor: Color.fromARGB(64, 201, 201, 201),
                      highlightColor: Color.fromARGB(65, 206, 206, 206),
                      borderRadius: BorderRadius.circular(150),
                      child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Image.asset('assets/danger2.png',
                          fit: BoxFit.contain,
                          height: 180,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/helpline');
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      splashColor: Color.fromARGB(64, 201, 201, 201),
                      highlightColor: Color.fromARGB(65, 212, 212, 212),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black12,
                            width: 2
                          )
                        ),
                        child: Image.asset("assets/add_contact.png",
                          height: 80,
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/addContacts');
                      },
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text("Add Emergency Contacts",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Courgette",
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    InkWell(
                      splashColor: Color.fromARGB(64, 201, 201, 201),
                      highlightColor: Color.fromARGB(65, 212, 212, 212),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black12,
                                width: 2
                            )
                        ),
                        child: Image.asset("assets/helpline.png",
                          height: 80,
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/helpline');
                      },
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text("Helpline Numbers",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Courgette",
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    InkWell(
                      splashColor: Color.fromARGB(64, 201, 201, 201),
                      highlightColor: Color.fromARGB(65, 212, 212, 212),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black12,
                                width: 2
                            )
                        ),
                        child: Image.asset("assets/setting.png",
                          height: 80,
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/profile');
                      },
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text("My Profile",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Courgette",
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      splashColor: Color.fromARGB(64, 201, 201, 201),
                      highlightColor: Color.fromARGB(65, 212, 212, 212),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black12,
                                width: 2
                            )
                        ),
                        child: Image.asset("assets/medicine-box.png",
                          height: 80,
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/healthcare');
                      },
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text("First Aid",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Courgette",
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    InkWell(
                      splashColor: Color.fromARGB(64, 201, 201, 201),
                      highlightColor: Color.fromARGB(65, 212, 212, 212),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black12,
                                width: 2
                            )
                        ),
                        child: Image.asset("assets/tips.png",
                          height: 80,
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/womensafety');
                      },
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text("Tips For Women Safety",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Courgette",
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    InkWell(
                      splashColor: Color.fromARGB(64, 201, 201, 201),
                      highlightColor: Color.fromARGB(65, 212, 212, 212),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black12,
                                width: 2
                            )
                        ),
                        child: Image.asset("assets/fire-exit.png",
                          height: 80,
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/escapethreat');
                      },
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text("Tips to Escape Threat",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Courgette",
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
