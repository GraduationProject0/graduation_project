import 'package:flutter/material.dart';
import 'package:graduation_project/modules/edit_profile/edit_profile.dart';
import 'package:graduation_project/modules/global_variable.dart';
import 'package:graduation_project/modules/login/login.dart';
import 'package:graduation_project/modules/new_project/new_project_screen.dart';
import 'package:graduation_project/modules/suggest/suggest_screen.dart';
import 'package:graduation_project/modules/profile/profile.dart';
import 'package:graduation_project/modules/reset_paasword/reset_password.dart';
import 'package:graduation_project/modules/shared_preferences.dart';
import 'package:graduation_project/shared/components/components.dart';

List<String> gifs = [
  'assets/ready/gifs/Bedroom-193.gif',
  'assets/ready/gifs/Bedroom-35352.gif'
];
List<String> Namegifs = [
  'Bedroom-193',
  'Bedroom-35352',
];

class HomeScreen_2 extends StatefulWidget {
  final String? id;
  HomeScreen_2(this.id);
  @override
  State<HomeScreen_2> createState() => _HomeScreen_2State();
}

class _HomeScreen_2State extends State<HomeScreen_2> {
  @override
  void initState() {
    super.initState();
    getUserData(widget.id!);
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
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
              onDetailsPressed: () async {
                //TODO fix edit
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ));
              },
              accountName: Text("$fName $lName"),
              accountEmail: Text('${eemail}'),
              currentAccountPicture: CircleAvatar(
                child: Image.asset("assets/images/user.png"),
              ),
            ),
            ListTile(
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Change Password'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPassword(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                removeAllDataFromCache();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginScreen(),
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
                  width: 235,
                  height: 185,
                  functhion: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewProjectScreen(),
                        ));
                  },
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: defaultItemImage(
                    functhion: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewProjectScreen(),
                          ));
                    },
                    width: 220,
                    height: 170,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/add.png'),
                        fit: BoxFit.cover,
                      ),
                      //color: color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
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
                            builder: (context) => NewProjectScreen(),
                          ));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Suggestion',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 290,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        //color: Colors.blue,
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
                                    builder: (context) => oldModule(
                                      index: index,
                                    ),
                                  ));
                            },
                            width: 230,
                            height: 220,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(gifs[index].toString()),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            ' ${Namegifs[index]}',
                            style: const TextStyle(
                              fontSize: 25,
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
                itemCount: gifs.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
