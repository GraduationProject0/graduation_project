import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/modules/firebase.dart';
import 'package:intl/intl.dart';
import 'package:graduation_project/modules/login/login.dart';

import 'package:graduation_project/shared/components/components.dart';

class signupScreen extends StatefulWidget {
  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  // const logoutScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var FName = TextEditingController();
  var LName = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var dateCtl = TextEditingController();
  var password = TextEditingController();
  var confirm = TextEditingController();
  bool obscure_1 = true;
  bool obscure_2 = true;

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
      )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 630,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          // color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  "Sign UP",
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: defaultForm(
                                        controller: FName,
                                        label: "First Name",
                                        prefix: Icons.account_circle,
                                        type: TextInputType.name,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'First Name can not be empty';
                                          }
                                          return null;
                                        },
                                        function: (s) {
                                          print(FName.text);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      child: defaultForm(
                                        controller: LName,
                                        label: "Last Name",
                                        prefix: Icons.account_circle,
                                        type: TextInputType.name,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Last Name can not be empty';
                                          }
                                          return null;
                                        },
                                        function: (s) {
                                          print(LName.text);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultForm(
                                  controller: email,
                                  label: "E-Mail",
                                  prefix: Icons.email,
                                  type: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'E-Mail can not be empty';
                                    }
                                    return null;
                                  },
                                  function: (s) {
                                    print(email.text);
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultForm(
                                  controller: phone,
                                  label: "Phone Number",
                                  prefix: Icons.phone,
                                  type: TextInputType.phone,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Phone Number can not be empty';
                                    }
                                    return null;
                                  },
                                  function: (s) {
                                    print(phone.text);
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultForm(
                                  controller: dateCtl,
                                  label: "Date Of Birth",
                                  prefix: Icons.calendar_today_rounded,
                                  type: TextInputType.datetime,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Date Of Birth can not be empty';
                                    }
                                    return null;
                                  },
                                  function: (s) {
                                    print(phone.text);
                                  },
                                  onTap: () async {
                                    // DateTime? date = DateTime(1900);
                                    // FocusScope.of(context).requestFocus(new FocusNode());
                                    DateTime? date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100));
                                    if (date != null) {
                                      setState(() {
                                        dateCtl.text = DateFormat('dd/MM/yyyy')
                                            .format(date);
                                      });
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultForm(
                                  controller: password,
                                  label: 'Password',
                                  prefix: Icons.lock,
                                  type: TextInputType.visiblePassword,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password can not be empty';
                                    }
                                    return null;
                                  },
                                  function: (ss) {
                                    print(password.text);
                                  },
                                  obscure: obscure_1,
                                  suffix: obscure_1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  sufFunction: () {
                                    setState(() {
                                      obscure_1 = !obscure_1;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultForm(
                                  controller: confirm,
                                  label: 'Confirm Password',
                                  prefix: Icons.lock,
                                  type: TextInputType.visiblePassword,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Confirm Password can not be empty';
                                    }
                                    return null;
                                  },
                                  function: (ss) {
                                    print(confirm.text);
                                  },
                                  obscure: obscure_2,
                                  suffix: obscure_2
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  sufFunction: () {
                                    setState(() {
                                      obscure_2 = !obscure_2;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                defaultbutton(
                                  text: 'SignUp',
                                  color: Colors.black,
                                  function: () async {
                                    if (formKey.currentState!.validate()) {
                                      if (password.text == confirm.text) {
                                        addUsers(
                                            FName.text.toString(),
                                            LName.text.toString(),
                                            email.text.toString(),
                                            phone.text.toString(),
                                            dateCtl.text.toString(),
                                            password.text.toString(),
                                            confirm.text.toString());
                                        print("First Name :" + FName.text);
                                        print("Last Name :" + LName.text);
                                        print("Email :" + email.text);
                                        print("Phone :" + phone.text);
                                        print("DoB :" + dateCtl.text);
                                        print("Password :" + password.text);
                                        print("Confirm Password :" +
                                            confirm.text);
                                        Fluttertoast.showToast(
                                          msg: "Successfully Signed up",
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.lightGreen,
                                          textColor: Colors.white,
                                          fontSize: 16,
                                          timeInSecForIosWeb: 1,
                                        );
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  loginScreen(),
                                            ));
                                      } else {
                                        Fluttertoast.showToast(
                                          msg:
                                              "Password doesn't match, Try again",
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
