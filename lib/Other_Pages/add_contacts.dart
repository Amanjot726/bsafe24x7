import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddContactsPage extends StatefulWidget {
  const AddContactsPage({Key? key}) : super(key: key);

  @override
  _AddContactsPageState createState() => _AddContactsPageState();
}

class _AddContactsPageState extends State<AddContactsPage> {

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
            Flexible(child: Image.asset('addContacts.png', height: 350,),),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1.0,
                    colors: <Color>[Colors.yellow, Colors.deepOrange.shade900],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: Text('ADD CONTACTS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontStyle: FontStyle.normal, letterSpacing: 0.8),),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.all(20),
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
                          color: Colors.deepPurple,
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
                          color: Colors.deepPurple,
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
            SizedBox(height: 10,),
            Container(
              height: 35,
              width: 100,
              child: TextButton(
                onPressed: () {},
                child: Text('ADD', style: TextStyle(color: Colors.white),),
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
// #FF607D