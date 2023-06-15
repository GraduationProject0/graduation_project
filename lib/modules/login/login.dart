// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/modules/get_id.dart';
import 'package:graduation_project/modules/global_variable.dart';
import 'package:graduation_project/modules/home/home.dart';
import 'package:graduation_project/modules/home/home_2.dart';
import 'package:graduation_project/modules/shared_preferences.dart';
import 'package:graduation_project/modules/signup/signup.dart';
import 'package:graduation_project/shared/components/components.dart';


class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  // const loginScreen({Key? key}) : super(key: key);



  var email=TextEditingController();

  var password=TextEditingController();

  var formKey=GlobalKey<FormState>();

  bool obscure=true;
  late QuerySnapshot nameEmailSnapshot;
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2AB16E),
            Color(0xFF6E2AB1),
            Color(0xFF165C39),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // const Image(
              //   height: double.infinity,
              //   width: double.infinity,
              //   image: AssetImage('assets/images/login.jpg'),
              //   fit: BoxFit.cover,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 10,
                  start: 20,
                  end: 20,
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20.0),

                    ),
                    //color: Colors.white,
                    height: 500,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children:[
                                const Text(
                                  "Login",
                                  style:TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                defaultForm(
                                  controller: email,
                                  label: 'E-Mail',
                                  prefix: Icons.email,
                                  type: TextInputType.emailAddress,
                                  validate: (value){
                                    if(value!.isEmpty){
                                      return 'E-Mail can not be empty';
                                    }
                                    return null;
                                  },
                                  function: (s){
                                    print(email.text);
                                  },
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                defaultForm(
                                  controller: password,
                                  label: 'Password',
                                  prefix: Icons.lock,
                                  type: TextInputType.visiblePassword,
                                  validate: (value){
                                    if(value!.isEmpty){
                                      return 'Password can not be empty';
                                    }
                                    return null;
                                  },
                                  function: (ss){
                                    print(password.text);
                                  },
                                  obscure: obscure,
                                  suffix: obscure? Icons.visibility:Icons.visibility_off,
                                  sufFunction: () {
                                    setState(() {
                                      obscure=!obscure;
                                    }
                                    );

                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultbutton(
                                  color: Colors.black,
                                  text: 'login',
                                  function: ()async{


                                    if(formKey.currentState!.validate()){
                                      try{
                                        nameEmailSnapshot = await db
                                            .collection('users')
                                            .where('E-Mail', isEqualTo: email.text.toString())
                                            .where('Password', isEqualTo: password.text.toString())
                                            .get();

                                        userEmail=email.text.toString();
                                        catchid =await getID(userEmail);
                                        saveLoginAccountToCache(catchid);

                                        userfullname=await getUserFullName(userEmail);
                                        getPhone= await getUserphone(userEmail) ;
                                        getBirth= await getUserbirth(userEmail) ;
                                        //print(catchid);

                                        Fluttertoast.showToast(
                                          msg: "E-Mail or password wrong",
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.lightGreen,
                                          textColor: Colors.white,
                                          fontSize: 16,
                                          timeInSecForIosWeb: 1,
                                        );

                                        print(email.text);
                                        print(password.text);

                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => HomeScreen_2(),
                                            ));

                                      }catch(e){
                                        Fluttertoast.showToast(
                                          msg: "E-Mail or password wrong",
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16,
                                          timeInSecForIosWeb: 1,
                                        );
                                      }
                                    }

                                  },
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("don't have an account?"),
                                    TextButton(
                                      onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => signupScreen(),
                                            ));
                                    },
                                      child:Text('Register Now'),
                                    )
                                  ],
                                ),
                                // MaterialButton(
                                //   color: Colors.blue,
                                //     child: Text("ggg"),
                                //     onPressed: (){
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(builder: (context) => HomeScreen_2(),
                                //       ));
                                // })
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
