import 'package:flutter/material.dart';
import 'package:graduation_project/modules/edit_info.dart';
import 'package:graduation_project/modules/global_variable.dart';
import 'package:graduation_project/shared/components/components.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var password= TextEditingController();
  var confirm= TextEditingController();
  bool obscure_1=true;
  bool obscure_2=true;
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
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children:[
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
                                obscure: obscure_1,
                                suffix: obscure_1? Icons.visibility:Icons.visibility_off,
                                sufFunction: () {
                                  setState(() {
                                    obscure_1=!obscure_1;
                                  }
                                  );
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
                                validate: (value){
                                  if(value!.isEmpty){
                                    return 'Confirm Password can not be empty';
                                  }
                                  return null;
                                },
                                function: (ss){
                                  print(confirm.text);
                                },
                                obscure: obscure_2,
                                suffix: obscure_2? Icons.visibility:Icons.visibility_off,
                                sufFunction: () {
                                  setState(() {
                                    obscure_2=!obscure_2;
                                  }
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              defaultbutton(
                                color: Colors.black,
                                text: 'Change Password',
                                function: (){

                                  if(formKey.currentState!.validate()){
                                    updatepass(
                                      catchid,
                                      password.text.toString(),
                                      confirm.text.toString()
                                    );
                                    print(password.text);
                                    print(confirm.text);
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(builder: (context) => HomeScreen_2(),
                                    //     ));
                                  }

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
