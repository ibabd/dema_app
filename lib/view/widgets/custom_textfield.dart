import 'package:flutter/material.dart';

class CustomizedTextField extends StatefulWidget {
  final TextEditingController myController;
  final String? hintText;
   bool? isPassword;
  final FormFieldValidator<String> validate;

    CustomizedTextField(
      {Key? key,
        required this.myController,
        required this.hintText,
        required this.isPassword,
        required this.validate})
      : super(key: key);

  @override
  State<CustomizedTextField> createState() => _CustomizedTextFieldState();
}

class _CustomizedTextFieldState extends State<CustomizedTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: widget.validate,
        textAlign: TextAlign.right,
        // keyboardType:TextInputType.emailAddress,
        keyboardType: widget.isPassword!
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        enableSuggestions: widget.isPassword! ? false : true,
        autocorrect: widget.isPassword! ? false : true,
        obscureText: widget.isPassword! ,
        controller: widget.myController,
         maxLines:widget.isPassword! ?1: 5,
         minLines: 1,


        decoration: InputDecoration(
          prefixIcon: widget.isPassword!
              ? IconButton(
            icon:widget.isPassword! ?const Icon( Icons.visibility_off, color: Colors.grey):
            const Icon( Icons.visibility, color: Colors.grey),
            onPressed: () {
              // setState((){
              //   widget.isPassword=!widget.isPassword!;
              // });
            },
          )
              : null,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
              borderRadius: BorderRadius.circular(10)),
          fillColor: const Color(0xffE8ECF4),
          filled: true,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

      ),
    );
  }
}