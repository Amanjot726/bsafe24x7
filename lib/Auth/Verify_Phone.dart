import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:first_app/Model/user.dart';
import 'package:bsafe24x7/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


FocusNode _Phone_focus_node = new FocusNode();
FocusNode _Button_focus_node = new FocusNode();
TextEditingController PhoneController = new TextEditingController();
bool progressIndicator = false;

TextEditingController NameController = new TextEditingController();
TextEditingController loginIDController = new TextEditingController();
TextEditingController PasswordController = new TextEditingController();

final _FormKey = GlobalKey<FormState>();

bool showLoader = false;


class Show_Snackbar{
  String message;
  BuildContext context;
  Show_Snackbar({required this.context,required this.message}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(this.message.toString()),
      duration: Duration(seconds: 5),
    )
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: (){
            _Phone_focus_node.unfocus();
            _Button_focus_node.unfocus();
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/3.2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Util.color,
                              Color.fromARGB(255, 245, 137, 157)
                            ],
                            tileMode: TileMode.clamp
                        )
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/4.6,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color.fromARGB(255, 245, 137, 157),
                              Color.fromARGB(0, 234, 135, 155),
                            ],
                            tileMode: TileMode.clamp
                        )
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Container(
                          color: Color.fromARGB(0, 243, 243, 243),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                // 640 --> redmi 2
                // 872 --> redmi note 9 pro
                height: (MediaQuery.of(context).size.height<680) ?
                MediaQuery.of(context).size.height/2-((MediaQuery.of(context).size.height/2)/1.55)
                    :
                MediaQuery.of(context).size.height/2-((MediaQuery.of(context).size.height/2)/1.8),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Login",
                      style: TextStyle(
                        fontSize: 38,
                        color: Color.fromARGB(255, 217, 37, 67),
                        fontFamily: 'Pacifico',
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    )
                  ],
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.center,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 20,
                    semanticContainer: false,
                    // margin: EdgeInsets.symmetric(horizontal: card_horizontal_margin,vertical: card_vertical_margin),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          // height: MediaQuery.of(context).size.height/2.5,
                          width: MediaQuery.of(context).size.width/1.2,
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: _FormKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 8,),
                                TextFormField(
                                  onTap: (){
                                    setState(() {
                                      FocusScope.of(context).requestFocus(_Phone_focus_node);
                                    });
                                  },
                                  focusNode: _Phone_focus_node,
                                  controller: PhoneController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  enabled: true,
                                  autofocus: false,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Color.fromARGB(255, 245, 81, 111),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Phone is required. Please Enter.';
                                    } else if (value.trim().length == 0) {
                                      return 'Phone is required. Please Enter.';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blueGrey
                                  ),
                                  decoration: InputDecoration(
                                    // filled: true,
                                    // alignLabelWithHint: true,
                                      labelText: "Phone",
                                      labelStyle: TextStyle(
                                        fontWeight: _Phone_focus_node.hasFocus ? FontWeight.bold : FontWeight.normal,
                                        // color: _Email_focus_node.hasFocus ? Color.fromARGB(243, 93, 177, 108) : Colors.black54
                                        // color: Colors.grey
                                      ),
                                      hintText: '8426736886',
                                      hintStyle: TextStyle(
                                          color: Colors.grey
                                      ),
                                      isDense: true,
                                      prefixIcon: Icon(Icons.email,size: 22,color: _Phone_focus_node.hasFocus ? Color.fromARGB(255, 255, 96, 125) : Colors.black45),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        gapPadding: 4,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(255, 255, 96, 125),
                                              width: 1.5
                                          )
                                      )
                                  ),

                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    progressIndicator==true?
                                    CircularProgressIndicator()
                                        :
                                    InkWell(
                                        focusNode: _Button_focus_node,
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: (){
                                          // Show_Snackbar(context: context, message: "Height = "+MediaQuery.of(context).size.height.toString());
                                          _Phone_focus_node.unfocus();
                                          FocusScope.of(context).requestFocus(_Button_focus_node);
                                          if (_FormKey.currentState!.validate()) {
                                            setState(() {
                                              progressIndicator = true;
                                            });
                                            // authenticateUser(context);
                                          }
                                        },
                                        enableFeedback: true,
                                        canRequestFocus: true,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 11),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              // color: Color.fromARGB(97, 32, 194, 53)
                                              color: Util.color,
                                              border: Border.all(color: Colors.black38),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(96, 255, 96, 125),
                                                  blurRadius: 8.0,
                                                  spreadRadius: 3.0,
                                                ),
                                              ]
                                          ),
                                          child: Text("Verify",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 15),),
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}