import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:graduation_project/modules/global_variable.dart';
import 'package:graduation_project/modules/home/homescreen.dart';
import 'package:graduation_project/modules/new_project/new_project_screen.dart';
import 'package:graduation_project/shared/components/components.dart';

late List<String> objectPathslroom = [];
late List<String> objectPathslfloor = [];
late List<String> ob = [];
List<Object> objects = [];
String randomObjectPath = '';

class ViewModelScreenL extends StatefulWidget {
  final int xx;

  const ViewModelScreenL({Key? key, required this.xx}) : super(key: key);
  @override
  State<ViewModelScreenL> createState() => _ViewModelScreenLState();
}

class _ViewModelScreenLState extends State<ViewModelScreenL> {
  late Object shark;
  bool isFavorite = false;

  @override
  void initState() {
    // TODO: implement initState
    objectPathslroom = [
      'assets/ready/livingroom/1/merged.obj',
      'assets/ready/livingroom/2/merged.obj',
      'assets/ready/livingroom/3/merged.obj',
      'assets/ready/livingroom/4/merged.obj',
      'assets/ready/livingroom/5/merged.obj',
      'assets/ready/livingroom/6/merged.obj',
      'assets/ready/livingroom/7/merged.obj',
      'assets/ready/livingroom/8/merged.obj',
      'assets/ready/livingroom/9/merged.obj',
      'assets/ready/livingroom/10/merged.obj',
      'assets/ready/livingroom/11/merged.obj',
      'assets/ready/livingroom/12/merged.obj',
      'assets/ready/livingroom/13/merged.obj',
      'assets/ready/livingroom/14/merged.obj',
      'assets/ready/livingroom/15/merged.obj',
      'assets/ready/livingroom/16/merged.obj',
    ];
    objectPathslfloor = [
      'assets/ready/livingroom/1/Plan/floor_plan.obj',
      'assets/ready/livingroom/2/Plan/floor_plan.obj',
      'assets/ready/livingroom/3/Plan/floor_plan.obj',
      'assets/ready/livingroom/4/Plan/floor_plan.obj',
      'assets/ready/livingroom/5/Plan/floor_plan.obj',
      'assets/ready/livingroom/6/Plan/floor_plan.obj',
      'assets/ready/livingroom/7/Plan/floor_plan.obj',
      'assets/ready/livingroom/8/Plan/floor_plan.obj',
      'assets/ready/livingroom/9/Plan/floor_plan.obj',
      'assets/ready/livingroom/10/Plan/floor_plan.obj',
      'assets/ready/livingroom/11/Plan/floor_plan.obj',
      'assets/ready/livingroom/12/Plan/floor_plan.obj',
      'assets/ready/livingroom/13/Plan/floor_plan.obj',
      'assets/ready/livingroom/14/Plan/floor_plan.obj',
      'assets/ready/livingroom/15/Plan/floor_plan.obj',
      'assets/ready/livingroom/16/Plan/floor_plan.obj',
    ];
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    fileContent;
    super.setState(fn);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text("Generated Room"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Cube(
                onSceneCreated: (Scene scene) {
                  // print(objectPaths[xx]);
                  scene.update();
                  Object objectr =
                      Object(fileName: objectPathslroom[widget.xx]);
                  objectr.rotation.setValues(0, 90, 0);
                  //object.position.setValues(20, 30, 10);
                  objectr.transform.setTranslationRaw(90, 0, 0);
                  objectr.position.setValues(0, 0.0, 0);
                  objectr.updateTransform();
                  scene.world.add(objectr);
                  objects.add(objectr);
                  scene.update();
                  Object objectf =
                      Object(fileName: objectPathslfloor[widget.xx]);
                  objectf.rotation.setValues(0, 90, 0);
                  //object.position.setValues(20, 30, 10);
                  objectf.updateTransform();
                  scene.world.add(objectf);
                  objects.add(objectf);

                  setState(() {
                    // Object object = Object(fileName: '${fileContent.toString()}' );
                    // Add the object to the list of objects
                    objects.forEach((object) {
                      //object.rotation.setValues(0, 180, 0);
                      //object.position.setValues(0, 0, 0.5);
                      object.updateTransform();
                    });
                    scene.camera.zoom = 5;
                  });
                },
              ),
            ),
          ),
          defaultbutton(
              text: 'Home',
              color: Colors.black.withOpacity(0.3),
              width: 150,
              function: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen_2(savedId),
                    // ,eemail,birth,fName,lName,phone
                  ),
                );
              }),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
