import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:graduation_project/modules/global_variable.dart';
import 'package:graduation_project/modules/home/homescreen.dart';
import 'package:graduation_project/modules/new_project/new_project_screen.dart';
import 'package:graduation_project/shared/components/components.dart';

late List<String> objectPathsroom = [];
late List<String> objectPathsfloor = [];
late List<String> ob = [];
List<Object> objects = [];
String randomObjectPath = '';

class ViewModelScreen extends StatefulWidget {
  final int xx;

  const ViewModelScreen({Key? key, required this.xx}) : super(key: key);
  @override
  State<ViewModelScreen> createState() => _ViewModelScreenState();
}

class _ViewModelScreenState extends State<ViewModelScreen> {
  //late Object jet;
  late Object shark;
  bool isFavorite = false;

  @override
  void initState() {
    // TODO: implement initState
    objectPathsroom = [
      'assets/ready/bedrooms/1-1/merged.obj',
      'assets/ready/bedrooms/1-2/merged.obj',
      'assets/ready/bedrooms/1-3/merged.obj',
      'assets/ready/bedrooms/1-4/merged.obj',
      'assets/ready/bedrooms/1-5/merged.obj',
      'assets/ready/bedrooms/1-6/merged.obj',
      'assets/ready/bedrooms/1/merged.obj',
      'assets/ready/bedrooms/2/merged.obj',
      'assets/ready/bedrooms/3/merged.obj',
      'assets/ready/bedrooms/4/merged.obj',
      'assets/ready/bedrooms/5/merged.obj',
      'assets/ready/bedrooms/6/merged.obj',
      'assets/ready/bedrooms/7/merged.obj',
      'assets/ready/bedrooms/8/merged.obj',
      'assets/ready/bedrooms/9/merged.obj',
      'assets/ready/bedrooms/10/merged.obj',
      'assets/ready/bedrooms/11/merged.obj',
      'assets/ready/bedrooms/12/merged.obj',
      'assets/ready/bedrooms/13/merged.obj',
      'assets/ready/bedrooms/14/merged.obj',
      'assets/ready/bedrooms/15/merged.obj',
      'assets/ready/bedrooms/16/merged.obj',
      'assets/ready/bedrooms/17/merged.obj',
      'assets/ready/bedrooms/18/merged.obj',
      'assets/ready/bedrooms/19/merged.obj',
      'assets/ready/bedrooms/20/merged.obj',
      'assets/ready/bedrooms/21/merged.obj',
      'assets/ready/bedrooms/22/merged.obj',
      'assets/ready/bedrooms/23/merged.obj',
    ];
    objectPathsfloor = [
      'assets/ready/bedrooms/1-1/Plan/floor_plan.obj',
      'assets/ready/bedrooms/1-2/Plan/floor_plan.obj',
      'assets/ready/bedrooms/1-3/Plan/floor_plan.obj',
      'assets/ready/bedrooms/1-4/Plan/floor_plan.obj',
      'assets/ready/bedrooms/1-5/Plan/floor_plan.obj',
      'assets/ready/bedrooms/1-6/Plan/floor_plan.obj',
      'assets/ready/bedrooms/1/Plan/floor_plan.obj',
      'assets/ready/bedrooms/2/Plan/floor_plan.obj',
      'assets/ready/bedrooms/3/Plan/floor_plan.obj',
      'assets/ready/bedrooms/4/Plan/floor_plan.obj',
      'assets/ready/bedrooms/5/Plan/floor_plan.obj',
      'assets/ready/bedrooms/6/Plan/floor_plan.obj',
      'assets/ready/bedrooms/7/Plan/floor_plan.obj',
      'assets/ready/bedrooms/8/Plan/floor_plan.obj',
      'assets/ready/bedrooms/9/Plan/floor_plan.obj',
      'assets/ready/bedrooms/10/Plan/floor_plan.obj',
      'assets/ready/bedrooms/11/Plan/floor_plan.obj',
      'assets/ready/bedrooms/12/Plan/floor_plan.obj',
      'assets/ready/bedrooms/13/Plan/floor_plan.obj',
      'assets/ready/bedrooms/14/Plan/floor_plan.obj',
      'assets/ready/bedrooms/15/Plan/floor_plan.obj',
      'assets/ready/bedrooms/16/Plan/floor_plan.obj',
      'assets/ready/bedrooms/17/Plan/floor_plan.obj',
      'assets/ready/bedrooms/18/Plan/floor_plan.obj',
      'assets/ready/bedrooms/19/Plan/floor_plan.obj',
      'assets/ready/bedrooms/20/Plan/floor_plan.obj',
      'assets/ready/bedrooms/21/Plan/floor_plan.obj',
      'assets/ready/bedrooms/22/Plan/floor_plan.obj',
      'assets/ready/bedrooms/23/Plan/floor_plan.obj',
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
                  scene.update();
                  Object objectr = Object(fileName: objectPathsroom[widget.xx]);
                  objectr.rotation.setValues(0, 90, 0);
                  //object.position.setValues(20, 30, 10);
                  objectr.transform.setTranslationRaw(90, 0, 0);
                  objectr.position.setValues(0, 0.0, 0);
                  objectr.updateTransform();
                  scene.world.add(objectr);
                  objects.add(objectr);
                  scene.update();
                  Object objectf =
                      Object(fileName: objectPathsfloor[widget.xx]);
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
