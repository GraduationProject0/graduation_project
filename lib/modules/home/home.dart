import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/login/login.dart';
import 'package:graduation_project/modules/old%20module/old_module.dart';
import 'package:graduation_project/modules/signup/signup.dart';
import 'package:graduation_project/shared/components/components.dart';
//import 'package:project_v1/shared/cubit/cubit.dart';

class homeScreen extends StatelessWidget {
  //const homeScreen({Key? key}) : super(key: key);
  List<Widget>screens=[
    const oldModule(),
    loginScreen(),
    signupScreen(),
    //const SettingsScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => defaultItemProdect(
                    width: 200,
                    //height: 80,
                    functhion: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => oldModule(),
                          ));
                    },
                    color: Colors.white60,
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => defaultItemProdect(
                                      width: double.infinity,
                                       height: 150,
                                      functhion: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => screens[index],
                                            ));
                                      },
                                      color: Colors.white60,
                                    ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 30.0,
                ),
                itemCount: 3,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        
        style: TabStyle.fixedCircle,
        onTap: (index){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screens[index],
              ));

        },
        items: const [
          TabItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            title: "Acount",
          ),
          TabItem(
            icon: Icon(
              Icons.add,
            ),
            title: "Add",
          ),
          TabItem(
            icon: Icon(
              Icons.settings,
            ),
            title: "Settings",
          ),
        ],
      ),
    );
  }
}
