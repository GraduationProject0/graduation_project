// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/modules/edit_profile/edit_profile.dart';
import 'package:graduation_project/modules/get_id.dart';
import 'package:graduation_project/modules/global_variable.dart';
import 'package:graduation_project/modules/login/login.dart';
import 'package:graduation_project/modules/new_func_get_info_from_id.dart';
import 'package:graduation_project/modules/new_project/new_project_screen.dart';
import 'package:graduation_project/modules/old module/old_module.dart';
import 'package:graduation_project/modules/profile/profile.dart';
import 'package:graduation_project/modules/reset_profile/reset_password.dart';
import 'package:graduation_project/modules/shared_preferences.dart';
import 'package:graduation_project/modules/test/t1.dart';
import 'package:graduation_project/modules/test/t2.dart';
import 'package:graduation_project/modules/test/t3.dart';
import 'package:graduation_project/shared/components/components.dart';




class HomeScreen_2 extends StatefulWidget {
  // final String? id;
  // HomeScreen_2(this.id);



  @override
  State<HomeScreen_2> createState() => _HomeScreen_2State();
}

class _HomeScreen_2State extends State<HomeScreen_2> {
  //const HomeScreen_2({Key? key}) : super(key: key);
  int index=0;
  late Object shark;

  List<Widget>screen=[
    //HomeScreen_2(savedId),
    HomeScreen_2(),
    const t2(),
  ];
  @override
  void initState() {


    // TODO: implement initState
    shark = Object(fileName: "assets/000_scene/scene.obj");
    shark.rotation.setValues(0, 90, 0);
    shark.updateTransform();
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // علشان اشيل زرار الباك بتاع Navigator.push و يارب ما انسى دى بتاع ايه
        //automaticallyImplyLeading: false,

        title: const Text(
          'Home',
        ),
          actions: [
            IconButton(
                onPressed: () {
                  //AppCubit.get(context).changeAppMode();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                  size: 30.0,
                ))
          ],
      ),
      drawer:  Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            UserAccountsDrawerHeader(
              onDetailsPressed: () async {
                userEmail = (await getEemail(catchid))!;
                userfullname=(await gettFullName(catchid))!;
                //print(userEmail);
                // setState() async{
                //
                //
                // }

                //userEmail=(await getEmail(catchid))!;
                // getPhone=(await getphone(catchid))!;
                // getBirth=(await getbirth(catchid))!;
                //TODO fix edit



                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ));
              },
              accountName: Text("$userfullname"),
              accountEmail:  Text('$userEmail'),
              currentAccountPicture: CircleAvatar(
                child: Image.asset("assets/images/user.png"),
              ),
            ),
            ListTile(
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditProfile(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Reset Password'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResetPassword(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                removeLoginAccountFromCache();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => loginScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                defaultItemProdect(
                  width: 200,
                  height: 150,
                  functhion: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  NewProjectScreen(),
                        ));
                  },
                  color: Colors.grey,

                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: defaultItemProdect(
                    color: Colors.white,
                    icon: Icons.add,
                    width: 50,
                    height: 50,
                    borderRadius: 50,
                    functhion: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  NewProjectScreen(),
                          ));
                    },


                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Suggestion',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),

            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 270,
              //color: Colors.red,

              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(

                    decoration: BoxDecoration(
                      // نشيله بعدين
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(40),

                    ),


                    child:Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),

                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultItemImage(
                              functhion: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const oldModule(),
                                    ));
                              },
                              width: 200,
                              height: 150,
                              decoration: BoxDecoration(
//
                                image: const DecorationImage(

                                  image: AssetImage('assets/images/1.gif'),
                                  fit: BoxFit.fill,
                                ),
                                //color: color,
                                borderRadius: BorderRadius.circular(20),
                              ) ,
                              //sc: 'assets/images/room_1.gif',

                              // decoration: BoxDecoration(
                              //
                              //   // color: color,
                              //   // borderRadius: BorderRadius.circular(borderRadius!),
                              // )
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'BedRoom',
                              style: TextStyle(
                                fontSize: 25,
                                // fontWeight: FontWeight.bold,
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20.0,
                ),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(


        onTap: (indexx){
          setState(() {
            index=indexx;
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => screen[indexx],
                ));

            print(indexx);
          });
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'favorites',
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.settings,
          //   ),
          //   label: 'settings',
          // ),
        ],
      ),
    );
  }
}
