import 'package:flutter/material.dart';
import 'package:graduation_project/modules/delete_info.dart';
import 'package:graduation_project/modules/edit_profile/edit_profile.dart';
import 'package:graduation_project/modules/global_variable.dart';
import 'package:graduation_project/modules/home/home_2.dart';
import 'package:graduation_project/modules/login/login.dart';
import 'package:graduation_project/modules/signup/signup.dart';
import 'package:graduation_project/shared/components/components.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var FullName=TextEditingController(text: '$userfullname');
  var email=TextEditingController(text: '$userEmail');
  var phone=TextEditingController(text: '$getPhone');
  var dateCtl=TextEditingController(text: '$getBirth');

  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
      ),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),

                  ),
                  //color: Colors.white,
                  height: 600,
                  child: Center(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children:[
                              CircleAvatar(
                                radius: 50,
                                child: Image.asset("assets/images/user.png",),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                            defaultForm(
                              enable: false,
                              controller: FullName,
                              label: "Full Name",
                              prefix: Icons.account_circle,
                              type: TextInputType.name,
                          ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              defaultForm(
                                enable: false,
                                controller: email,
                                label: "E-Mail",
                                prefix: Icons.email,
                                type: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              defaultForm(
                                enable: false,
                                controller: phone,
                                label: "Phone",
                                prefix: Icons.phone,
                                type: TextInputType.phone,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              defaultForm(
                                enable: false,
                                controller: dateCtl,
                                label: "Date Of Birth",
                                prefix: Icons.calendar_today_rounded,
                                type: TextInputType.datetime,
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              defaultbutton(
                                color: Colors.black,
                                text: 'Edit Profile',
                                function: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditProfile(),
                                        ));
                                },
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),

                              defaultbutton(
                                color: Colors.black,
                                text: 'Delete Account',
                                function: (){
                                  deleteDocument(catchid);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => loginScreen(),
                                      ));
                                },
                              ),
                              const SizedBox(
                                height: 10.0,
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
    );
  }
}
