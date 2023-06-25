import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/modules/view_model/view_model_screen.dart';
import 'package:graduation_project/modules/view_model/view_model_screen_l.dart';
import 'package:graduation_project/shared/components/components.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

String? v;
String dd = '';
String? selectvalue = '';
bool isLoading = false;
int numb = -1;
int numl = -1;
var fileContent;

class NewProjectScreen extends StatefulWidget {
  @override
  State<NewProjectScreen> createState() => _NewProjectScreenState();
}

const List<String> list = <String>['Bed Room', 'Living Room'];

class _NewProjectScreenState extends State<NewProjectScreen>
    with TickerProviderStateMixin {
  //const NewProjectScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  String dropdownValue = list.first;
  bool isShow = false;

  List<dynamic> room = [];
  String? s;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getFileFromServer(String ss) async {
    var url =
        'http://10.0.2.2:5000/api/test'; // Replace with your Flask server endpoint
    //final data = {'condition': ss};
    print('555');
    // print(ss);
    // print(data);

    final jsonData = jsonEncode({'condition': ss});
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonData,
      );

      // Check the response status code to handle errors, if any
      if (response.statusCode == 200) {
        print('100/100');
        // Process the response file here
        // For example, you can save the file locally or display its content
        fileContent = response.body;
        print('nice $fileContent');
        Fluttertoast.showToast(
          msg: "Done Generate",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16,
          timeInSecForIosWeb: 1,
        );

        setState(() {
          isShow = true;
        });
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        Fluttertoast.showToast(
          msg: "Error Generate",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16,
          timeInSecForIosWeb: 1,
        );
        setState(() {
          isShow = false;
        });
      }
    } catch (e) {
      print('dddd $e');
      Fluttertoast.showToast(
        msg: "Error Generate",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,
        timeInSecForIosWeb: 1,
      );
      setState(() {
        isShow = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create 3D Model',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: 400,
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Select Room Type ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            // This is called when the user selects an item.
                            setState(() {
                              selectvalue = value;
                              dropdownValue = value!;
                              v = value;
                              print(value);
                              s = value;
                              print('lol : $s');
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: isLoading
                                ? SpinKitFadingCircle(
                                    color: Colors.black,
                                    size: 50.0,
                                    controller: AnimationController(
                                      vsync: this,
                                      duration:
                                          const Duration(milliseconds: 1200),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: defaultbutton(
                                      width: 250,
                                      color: Colors.black,
                                      text: 'Run Model Generation',
                                      function: () async {
                                        setState(() {
                                          isLoading =
                                              true; // Set isLoading to true when the button is clicked
                                        });
                                        print(selectvalue);
                                        await getFileFromServer(s!);
                                        setState(() {
                                          isLoading =
                                              false; // Set isLoading back to false after the operation is complete
                                        });
                                      },
                                    ),
                                  ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Ready To Show Room',
                            style: TextStyle(
                                color: isShow ? Colors.green : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        isShow
                            ? const Center(
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/down-arrow.png'),
                                  height: 50,
                                ),
                              )
                            : const SizedBox(
                                height: 30,
                              ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: defaultbutton(
                            color: isShow ? Colors.green : Colors.white,
                            text: 'Show Room',
                            function: () {
                              if (selectvalue == 'Bed Room') {
                                setState(() {
                                  numb = numb + 1;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ViewModelScreen(xx: numb),
                                    ));
                                print(selectvalue);
                              } else if (selectvalue == 'Living Room') {
                                setState(() {
                                  numl = numl + 1;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ViewModelScreenL(xx: numl),
                                    ));
                                print(selectvalue);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> wait15Seconds() async {
  bool t = Timer(const Duration(seconds: 15), () {
    // Code to be executed after 15 seconds
    print('15 seconds have passed!');
  }) as bool;
  return t;
}

// void performHotReload() {
//   WidgetsFlutterBinding.ensureInitialized().reload();
// }
