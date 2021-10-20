import 'package:bsafe24x7/Util/Db_operations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class HelplinePage extends StatefulWidget {
  const HelplinePage({Key? key}) : super(key: key);

  @override
  _HelplinePageState createState() => _HelplinePageState();
}

class _HelplinePageState extends State<HelplinePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
// top: height * 0.45,
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Lottie.asset('assets/helpline.json'),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2),
                child: ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds) {
                    return const RadialGradient(
                      center: Alignment.topLeft,
                      radius: 1.0,
                      colors: <Color>[Color.fromARGB(255, 255, 96, 125), Color.fromARGB(255, 127, 3, 29)],
                      tileMode: TileMode.mirror,
                    ).createShader(bounds);
                  },
                  child: const Text('HELPLINE NUMBERS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontStyle: FontStyle.normal, letterSpacing: 0.8),),
                ),
              ),

              const SizedBox(height: 30,),

              StreamBuilder(
                stream: fetchHelplineNumbers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.hasError){
                    return Center(
                      child: Text("Something Went Wrong", style: TextStyle(color: Colors.red),),
                    );
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: snapshot.data.docs.map<Widget>((DocumentSnapshot document){
                      Map<String, dynamic> map = document.data() as Map<String, dynamic>;

                      return Container(
                        height: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black12,
                            width: 2,
                          ),
                          // boxShadow: [BoxShadow(
                          //   spreadRadius: 5,
                          //   blurRadius: 5,
                          //   color: Colors.grey.shade100,
                          // )],
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            splashColor: Color.fromARGB(64, 201, 201, 201),
                            highlightColor: Color.fromARGB(55, 213, 213, 213),
                            borderRadius: BorderRadius.circular(8),
                            onTap: (){
                              launch('tel://123');
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  margin: const EdgeInsets.only(right: 5, top: 5, left: 10, bottom: 5),
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(44, 213, 213, 213),
                                    border: Border.all(
                                      color: Color.fromARGB(25, 102, 102, 102),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(map['image'],
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container();
                                    },
                                    loadingBuilder: (context, child, loadingProgress) {
                                      return loadingProgress == null ? child : CupertinoActivityIndicator();
                                    },
                                  ),
                                  // Image From database
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 5, left: 2.5, right: 5, top: 5),
                                  padding: EdgeInsets.only(bottom: 5, left: MediaQuery.of(context).size.width*0.2, right: 5, top: 5),
                                  child: Text(map['name'].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );

                    }).toList(),
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
// #FF607D