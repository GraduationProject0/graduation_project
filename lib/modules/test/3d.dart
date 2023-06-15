import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:object_3d/object_3d.dart';
//import 'package:vector_math/vector_math_64.dart' as math;

class model_3d extends StatefulWidget {
  //const model_3d({Key? key}) : super(key: key);
  late Object shark;

  @override
  State<model_3d> createState() => _model_3dState();

}

class _model_3dState extends State<model_3d> {
  late Object shark;
  @override
  void initState() {
    // TODO: implement initState
    //jet = Object(fileName: "assets/ww/object_002.obj");
    shark = Object(fileName: "assets/000_scene/scene.glb");
    shark.rotation.setValues(0, 90, 0);
    shark.updateTransform();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ModelViewer(
          src: "assets/000_scene/scene.obj",
          autoRotate: true,
          backgroundColor: Colors.white,
        ),
      ),

    );
  }
}