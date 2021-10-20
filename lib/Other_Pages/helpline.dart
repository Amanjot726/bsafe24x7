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
        child: Column(
          children: [
            Flexible(child: Lottie.asset('assets/helpline.json'),),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) {
                  return const RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1.0,
                    colors: <Color>[Color.fromARGB(255, 255, 96, 125), Colors.black38],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: const Text('HELPLINE NUMBERS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontStyle: FontStyle.normal, letterSpacing: 0.8),),
              ),
            ),

          const SizedBox(height: 30,),

          Column(
            children: [
              InkWell(
                onTap: () {
                  launch('tel://123');
                },
                child: Container(
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [BoxShadow(
                      spreadRadius: 5,
                      blurRadius: 5,
                      color: Colors.grey.shade100,
                    )],
                  ),
                  margin: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 80,
                        margin: const EdgeInsets.only(right: 5, top: 5, left: 10, bottom: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // child: FadeInImage.assetNetwork(
                        //
                        // ),
                        // Image From database
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, left: 2.5, right: 5, top: 5),
                        padding: EdgeInsets.only(bottom: 5, left: MediaQuery.of(context).size.width*0.2, right: 5, top: 5),
                        child: const Text("Ambulance", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),

          ],
        ),
      ),
    );
  }
}
// #FF607D