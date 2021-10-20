import 'package:bsafe24x7/Util/Constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              colors: <Color>[Color.fromARGB(255, 255, 96, 125), Colors.black38],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Text(
            Util.APP_NAME,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: Column(
        children: [
          SizedBox(height: 20,),
          InkWell(
            child: CircleAvatar(
              backgroundColor: Colors.green.shade100,
              // backgroundImage: NetworkImage(imageUrl),
              radius: 150,

            ),
            onTap: () {
              Navigator.pushNamed(context, '/helpline');
            },
          ),
          SizedBox(height: 100,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/addContacts');

                  },
                  child: Container(
                    margin: EdgeInsets.all(2.5),
                    height: 200,
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 96, 125),
                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                ),
                Container(
                  margin: EdgeInsets.all(2.5),
                  height: 200,
                  width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(133, 255, 96, 125),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(2.5),
                  height: 200,
                  // color: Colors.pinkAccent,
                  width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 96, 125),

                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
