import 'package:bsafe24x7/Auth/Login.dart';
import 'package:bsafe24x7/Util/Constants.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  navigateToHome(BuildContext context){


    Future.delayed(
        Duration(seconds: 3),
            (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => LoginPage() ));
        }
    );
  }
  @override
  Widget build(BuildContext context) {

    navigateToHome(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child: Image.asset(Util.Logo),
              height: 40,
              width: 40,),
            SizedBox(height: 8,),
            Divider(),
            SizedBox(height: 4,),
            Text("Ensuring Women Safety", style: TextStyle(color: Colors.grey, fontSize: 15)),

          ],
        ),
      ),
    );
  }
}
