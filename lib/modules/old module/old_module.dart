import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/shared/components/components.dart';

class oldModule extends StatelessWidget {
  const oldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text('Old Module'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         //AppCubit.get(context).changeAppMode();
        //       },
        //       icon: const Icon(
        //         Icons.brightness_4_outlined,
        //         size: 30.0,
        //       ))
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => defaultItemProdect(
                      width: double.infinity,
                      height: 150,
                      functhion: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => screens[index],
                        //     ));
                      },
                      color: Colors.white60,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 30.0,
                    ),
                    itemCount: 7,
                  ),
                  // Expanded(
                  //   child: InkWell(
                  //     onTap: () {
                  //     },
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.white60,
                  //         borderRadius: BorderRadius.circular(20.0),
                  //       ),
                  //       width: double.infinity,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 15.0,
                  // ),
                  // Expanded(
                  //   child: InkWell(
                  //     onTap: () {},
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.white60,
                  //         borderRadius: BorderRadius.circular(20.0),
                  //       ),
                  //       width: double.infinity,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 15.0,
                  // ),
                  // Expanded(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.white60,
                  //       borderRadius: BorderRadius.circular(20.0),
                  //     ),
                  //     width: double.infinity,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 30.0,
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: ConvexAppBar(
      //   style: TabStyle.fixedCircle,
      //   items: const [
      //     TabItem(
      //       icon: Icon(
      //         Icons.menu,
      //       ),
      //       title: "Menu",
      //     ),
      //     TabItem(
      //       icon: Icon(
      //         Icons.add,
      //       ),
      //       title: "Add",
      //     ),
      //     TabItem(
      //       icon: Icon(
      //         Icons.settings,
      //       ),
      //       title: "Settings",
      //     ),
      //   ],
      // ),
      //body: ,
    );
  }
}
