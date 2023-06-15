import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class ViewModelScreen extends StatefulWidget {
  const ViewModelScreen({Key? key}) : super(key: key);

  @override
  State<ViewModelScreen> createState() => _ViewModelScreenState();
}

class _ViewModelScreenState extends State<ViewModelScreen> {
  late Object jet;
  late Object shark;
  @override
  void initState() {
    // TODO: implement initState
    //jet = Object(fileName: "assets/ww/object_002.obj");
    shark = Object(fileName: "assets/000_scene/scene.obj");
    shark.rotation.setValues(0, 90, 0);
    shark.updateTransform();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.red,
        title: Text("Flutter 3D"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Cube(
                  onSceneCreated: (Scene scene) {
                    scene.world.add(shark);
                    scene.camera.zoom = 5;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}