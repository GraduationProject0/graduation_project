import 'package:flutter/material.dart';
import 'package:graduation_project/modules/view_model/view_model_screen.dart';
import 'package:graduation_project/shared/components/components.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class NewProjectScreen extends StatefulWidget {
  @override
  State<NewProjectScreen> createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {
  //const NewProjectScreen({Key? key}) : super(key: key);
  var formKey=GlobalKey<FormState>();

  var email=TextEditingController();

  List<dynamic>room=[];
  String? s;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.room.add({"id": 1, "label": "Simple1"});
    this.room.add({"id": 2, "label": "Simple2"});
    this.room.add({"id": 3, "label": "Simple3"});
    this.room.add({"id": 4, "label": "Simple4"});
    this.room.add({"id": 5, "label": "Simple5"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create 3D Model',
          style: TextStyle(
            fontSize: 20,
            //fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(20.0),
          ),
          //color: Colors.white,
          height: 400,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children:[
                      FormHelper.dropDownWidgetWithLabel(
                        context,
                        "Choose Room",
                        "Select Room",
                        this.s,
                        this.room,
                            (onChangedVal) {
                          this.s = onChangedVal;
                          print("select Room : $onChangedVal");
                        },
                            (onValidateVal) {
                          if (onValidateVal == null) {
                            return 'Please Select room';
                          }
                          return null;
                        },
                        borderFocusColor: Theme.of(context).primaryColor,
                        borderColor: Theme.of(context).primaryColor,
                        borderRadius: 10,
                        optionValue: 'id',
                        optionLabel: 'label',
                        paddingLeft: 0,
                        paddingRight: 0,
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: defaultbutton(
                          text: 'Generate',
                          function: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ViewModelScreen(),
                                ));
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
    );
  }
}
