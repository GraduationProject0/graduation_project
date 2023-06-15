import 'package:flutter/material.dart';

Widget defaultForm({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? function,
  bool obscure = false,
  void Function()? onTap,
  String? Function(String?)? validate,
  required String? label,
  required IconData prefix,
  IconData? suffix,
  void Function()? sufFunction,
  void Function(String)? onChanged,
  bool? enable=true,
}) =>
    TextFormField(

      enabled: enable,
      cursorColor: Colors.black,

      controller: controller,
      keyboardType: type,
      obscureText: obscure,
      onFieldSubmitted: function,
      validator: validate,
      onTap: onTap,
      // onChanged: (enter){
      //   print(enter);
      // },
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
         borderSide: BorderSide(color: Colors.black),
       ),
        prefixIcon: Icon(
          prefix,
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: sufFunction,
          icon: Icon(
            suffix,
            color: Colors.black,
          ),
        ),
      ),
    );

Widget defaultbutton({
  double width = double.infinity,
  Color color = Colors.blue,
  bool isUpperCase = true,
  double radius = 10.0,
  required String text,
  required void Function()? function,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultItemProdect({
  double? height=100,
  double? width,
  double? borderRadius=20.0,
  required void Function()? functhion,
  Color? color=Colors.white60,
  IconData? icon ,


})=>InkWell(
  onTap: functhion,
  child: Container(
    decoration: BoxDecoration(

      color: color,
      borderRadius: BorderRadius.circular(borderRadius!),
    ),
    height: height,
    width: width,
    child: Icon(icon),
  ),
);

Widget defaultItemImage({
  double? height=100,
  double? width,
  double? borderRadius=20.0,
  required void Function()? functhion,
  //Color? color=Colors.white60,
  IconData? icon ,
  Decoration? decoration,
  String sc='',

})=>InkWell(
  onTap: functhion,
  child: Container(
    decoration: decoration,
    height: height,
    width: width,
    // child: Image(
    //   height: 50,
    //   width: 60,
    //
    //   image: AssetImage(sc),
    //   //fit: BoxFit.contain,
    //
    // ),
  ),
);