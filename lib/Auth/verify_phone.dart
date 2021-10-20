import 'package:bsafe24x7/Auth/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:first_app/Model/user.dart';
import 'package:bsafe24x7/Util/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pin_put/pin_put.dart';


FocusNode _Button_focus_node = new FocusNode();
String? _verificationCode;
final TextEditingController _pinPutController = TextEditingController();
final FocusNode _pinPutFocusNode = FocusNode();
final BoxDecoration pinPutDecoration = BoxDecoration(
  color: const Color.fromARGB(96, 248, 79, 111),
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(
    color: const Color.fromRGBO(45, 49, 50, 0.42745098039215684),
  ),
);
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

class VerifyOTPPage extends StatefulWidget {
  final String phone;
  const VerifyOTPPage({Key? key,required this.phone}) : super(key: key);
  @override
  _VerifyOTPPageState createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+1${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: (){
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
                                Text('Enter OTP',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Righteous',
                                      color: Colors.pink[600]
                                  ),
                                ),
                                SizedBox(height: 14,),
                                PinPut(
                                  fieldsCount: 6,
                                  textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                                  eachFieldWidth: 40.0,
                                  eachFieldHeight: 45.0,
                                  focusNode: _pinPutFocusNode,
                                  controller: _pinPutController,
                                  submittedFieldDecoration: pinPutDecoration,
                                  selectedFieldDecoration: pinPutDecoration,
                                  followingFieldDecoration: pinPutDecoration,
                                  pinAnimationType: PinAnimationType.fade,
                                  onSubmit: (pin) async {
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithCredential(PhoneAuthProvider.credential(
                                          verificationId: _verificationCode!, smsCode: pin))
                                          .then((value) async {
                                        if (value.user != null) {
                                          // Navigator.pushAndRemoveUntil(
                                          //     context,
                                          //     MaterialPageRoute(builder: (context) => Home()),
                                          //         (route) => false);
                                        }
                                      });
                                    } catch (e) {
                                      FocusScope.of(context).unfocus();
                                      Show_Snackbar(context: context,message: "Invalid Otp");
                                    }
                                  },
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        focusNode: _Button_focus_node,
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: (){
                                          // Show_Snackbar(context: context, message: "Height = "+MediaQuery.of(context).size.height.toString());
                                          FocusScope.of(context).requestFocus(_Button_focus_node);
                                          if (_FormKey.currentState!.validate()) {
                                            Navigator.pushNamed(context, "/verify");
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
                                          child: Text("Send OTP",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 15),),
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4,),
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
