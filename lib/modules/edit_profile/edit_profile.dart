import 'package:flutter/material.dart';
import 'package:graduation_project/modules/delete_info.dart';
import 'package:graduation_project/modules/edit_info.dart';
import 'package:graduation_project/modules/get_id.dart';
import 'package:graduation_project/modules/global_variable.dart';
import 'package:graduation_project/modules/login/login.dart';
import 'package:intl/intl.dart';
import 'package:graduation_project/modules/reset_profile/reset_password.dart';
import 'package:graduation_project/shared/components/components.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}


class _EditProfileState extends State<EditProfile> {
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
          'Edit',
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
                    borderRadius: BorderRadius.circular(20.0),

                  ),
                  //color: Colors.white,
                  height: 600,
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
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
                                height: 35.0,
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

                                controller: email,
                                label: "E-Mail",
                                prefix: Icons.email,
                                type: TextInputType.emailAddress,
                                validate: (value){
                                  if(value!.isEmpty){
                                    return 'E-Mail can not be empty';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              defaultForm(

                                controller: phone,
                                label: "Phone",
                                prefix: Icons.phone,
                                type: TextInputType.phone,
                                validate: (value){
                                  if(value!.isEmpty){
                                    return 'Phone can not be empty';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              defaultForm(
                                controller: dateCtl,
                                label: "Date Of Birth",
                                prefix: Icons.calendar_today_rounded,
                                type: TextInputType.datetime,
                                validate: (value){
                                  if(value!.isEmpty){
                                    return 'Date Of Birth can not be empty';
                                  }
                                  return null;
                                },
                                onTap: () async{
                                  // DateTime? date = DateTime(1900);
                                  // FocusScope.of(context).requestFocus(new FocusNode());
                                  DateTime? date = await showDatePicker(
                                      context: context,
                                      initialDate:DateTime.now(),
                                      firstDate:DateTime(2000),
                                      lastDate: DateTime(2100));
                                  if(date !=null){
                                    setState(() {
                                      dateCtl.text = DateFormat('dd/MM/yyyy').format(date);
                                    });
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              defaultbutton(
                                color: Colors.black,
                                text: 'Confirm',
                                function: (){
                                  if(formKey.currentState!.validate()){
                                    updateInfo(
                                      catchid,
                                      email.text.toString(),
                                      phone.text.toString(),
                                      dateCtl.text.toString()
                                    );
                                    print("Email :"+email.text);
                                    print("Phone :"+phone.text);
                                    print("DoB :"+dateCtl.text);

                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(builder: (context) => loginScreen(),
                                    //     ));
                                  }
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => ResetPassword(),
                                  //     ));
                                },
                              ),
                              const SizedBox(
                                height: 90.0,
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