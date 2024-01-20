// import 'package:flutter/material.dart';

// class MyTextFormWidget extends StatelessWidget {
//   const MyTextFormWidget(
//       {super.key,
//       required this.controller,
//       required this.myFocusNode,
//       required this.labelText,
//       required this.prefixIcon,
//       this.suffixIcon,
//       this.togglePassword,
//       required this.obscureText,
//       required this.onChange,
//       this.validator,
//       required this.myTextInputAction});

//   final TextEditingController? controller;
//   final FocusNode myFocusNode;
//   final TextInputAction myTextInputAction;
//   final String labelText;
//   final Icon prefixIcon;
//   final Icon? suffixIcon;
//   final Function()? togglePassword;
//   final bool obscureText;
//   final Function(String)? onChange;
//   final String? Function(String?)? validator;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       focusNode: myFocusNode,
//       textInputAction: myTextInputAction,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(10),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//           label: Text(labelText),
//           prefixIcon: prefixIcon,
//           suffix: IconButton(
//               onPressed: togglePassword,
//               icon: suffixIcon ??
//                   SizedBox(
//                     height: 0,
//                   ))),
//       obscureText: obscureText,
//       validator: validator,
//       onChanged: onChange,
//     );
//   }
// }
