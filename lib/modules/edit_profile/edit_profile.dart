import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/modules/edit_info.dart';
import 'package:graduation_project/modules/global_variable.dart';
import 'package:graduation_project/modules/home/homescreen.dart';
import 'package:intl/intl.dart';
import 'package:graduation_project/shared/components/components.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var FullName = TextEditingController(text: '$fName $lName');
  var email = TextEditingController(text: '$eemail');
  var pphone = TextEditingController(text: '$phone');
  var dateCtl = TextEditingController(text: '$birth');
  var formKey = GlobalKey<FormState>();

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
                  height: 600,
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                child: Image.asset(
                                  "assets/images/user.png",
                                ),
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
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'E-Mail can not be empty';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              defaultForm(
                                controller: pphone,
                                label: "Phone",
                                prefix: Icons.phone,
                                type: TextInputType.phone,
                                validate: (value) {
                                  if (value!.isEmpty) {
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
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Date Of Birth can not be empty';
                                  }
                                  return null;
                                },
                                onTap: () async {
                                  DateTime? date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100));
                                  if (date != null) {
                                    setState(() {
                                      dateCtl.text =
                                          DateFormat('dd/MM/yyyy').format(date);
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
                                function: () async {
                                  if (formKey.currentState!.validate()) {
                                    updateInfo(
                                        savedId!,
                                        email.text.toString(),
                                        pphone.text.toString(),
                                        dateCtl.text.toString());
                                    updatedData = await updateInfo(
                                        savedId!,
                                        email.text.toString(),
                                        pphone.text.toString(),
                                        dateCtl.text.toString());
                                    if (updatedData != null) {
                                      eemail = updatedData!['email'];
                                      phone = updatedData!['phone'];
                                      birth = updatedData!['birth'];

                                      print('Email: $eemail');
                                      print('Phone: $phone');
                                      print('Birth: $birth');
                                    } else {
                                      print('Update failed.');
                                    }
                                    print("Email :" + email.text);
                                    print("Phone :" + pphone.text);
                                    print("DoB :" + dateCtl.text);

                                    Fluttertoast.showToast(
                                      msg: "Changes Saved Successfully.",
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.lightGreen,
                                      textColor: Colors.white,
                                      fontSize: 16,
                                      timeInSecForIosWeb: 1,
                                    );
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen_2(savedId),
                                        ));
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 90.0,
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
    );
  }
}
