import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:graduation_project/modules/global_variable.dart';
import 'package:graduation_project/modules/home/homescreen.dart';
import 'package:graduation_project/shared/components/components.dart';

import '../view_model/view_model_screen.dart';

class oldModule extends StatelessWidget {
  final int index;
  const oldModule({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Suggeted Model",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Cube(
                onSceneCreated: (Scene scene) {
                  if (index == 0) {
                    List<String> gifs_obj_1 = [
                      'assets/suggestion/1/merged.obj',
                      'assets/suggestion/1/floor/floor_plan.obj',
                    ];
                    for (int i = 0; i < gifs_obj_1.length; i++) {
                      Object object = Object(fileName: '${gifs_obj_1[i]}');
                      object.rotation.setValues(0, 90, 0);
                      object.position.setValues(0.2, 0, 0);
                      object.updateTransform();
                      scene.world.add(object);
                      objects.add(object);
                    }
                    // Add the object to the list of objects

                    objects.forEach((object) {
                      object.rotation.setValues(0, 180, 0);
                      object.position.setValues(0, 0, 0.5);
                      object.updateTransform();
                    });
                    scene.camera.zoom = 5;
                  } else if (index == 1) {
                    List<String> gifs_obj_2 = [
                      'assets/suggestion/2/merged.obj',
                      'assets/suggestion/2/floor/floor_plan.obj',
                    ];
                    for (int i = 0; i < gifs_obj_2.length; i++) {
                      Object object = Object(fileName: '${gifs_obj_2[i]}');
                      object.rotation.setValues(0, 90, 0);
                      object.position.setValues(0.2, 0, 0);
                      object.updateTransform();
                      scene.world.add(object);
                      objects.add(object);
                    }
                    // Add the object to the list of objects
                    objects.forEach((object) {
                      object.rotation.setValues(0, 180, 0);
                      object.position.setValues(0, 0, 0.5);
                      object.updateTransform();
                    });
                    scene.camera.zoom = 5;
                  }
                },
              ),
            ),
          ),
          defaultbutton(
              text: 'Home',
              color: Colors.black.withOpacity(0.3),
              width: 150,
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen_2(savedId),
                  ),
                );
              }),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
