import 'package:flutter/material.dart';

class UserDataForm extends StatefulWidget {
  UserDataForm({Key key}) : super(key: key);
  @override
  _UserDataForm createState() => _UserDataForm();
}
class _UserDataForm extends State<UserDataForm> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _username = TextEditingController();
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _email.dispose();
  }

  void resetForm() {
    _formKey.currentState.reset();
  }

  void formSubmit() async {
    // TODO: Call the services to get the user data
  }

  // bool isValidEmail(String email) {
  //   // TODO: validate the email pattern
  //   return RegExp(kEmailPattern).hasMatch(email);
  // }

  // bool isValidPassword(String username) {
  //   // TODO: Validate username
  //   return RegExp(kPasswordPattern).hasMatch(username);
  // }
  @override
  Widget build(BuildContext context) {
    // TODO: The correct form  data
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Full Name',
              hintText: "Your Full Name",
              labelStyle: TextStyle(color: Colors.black54),
              suffixIcon: Icon(Icons.person, color: Colors.grey),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.amber[900],
                  width: 1.0,
                )
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: "Edit Email",
              labelStyle: TextStyle(color: Colors.black54),
              suffixIcon: Icon(Icons.email, color: Colors.grey),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.amber[900],
                  width: 1.0,
                )
              ),
            ),
          ),
        ],
      )
    );
  }
}


// class SignUpForm extends StatefulWidget {
//   SignUpForm({Key key}) : super(key: key);

//   @override
//   _SignUpFormState createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final service = SignUpService();

 

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             cursorColor: kPrimaryColor,
//             autofocus: true,
//             decoration: InputDecoration(
//               hintText: "Enter name",
//               labelText: "Name",
//               labelStyle: TextStyle(color: Colors.black54),
//               suffixIcon: Icon(Icons.person, color: Colors.grey),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: kPrimaryColor),
//               ),
//             ),
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             validator: (value) {
//               if (value.isEmpty) {
//                 return "*Name is required";
//               }
//               return null;
//             },
//             onSaved: (String value) {
//               _name = value;
//             },
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           TextFormField(
//             cursorColor: kPrimaryColor,
//             keyboardType: TextInputType.text,
//             textCapitalization: TextCapitalization.none,
//             decoration: InputDecoration(
//               hintText: "example@domain.com",
//               labelText: "Email",
//               labelStyle: TextStyle(color: Colors.black54),
//               suffixIcon: Icon(Icons.email_outlined, color: Colors.grey),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: kPrimaryColor),
//               ),
//             ),
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             validator: (value) {
//               if (value.isEmpty) {
//                 return "*Email is required";
//               }

//               if (!isValidEmail(value)) {
//                 return "*Please enter a valid email";
//               }

//               return null;
//             },
//             onSaved: (String value) {
//               _email = value.toLowerCase();
//             },
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           TextFormField(
//             controller: _password,
//             cursorColor: kPrimaryColor,
//             obscureText: !_showPassword,
//             decoration: InputDecoration(
//               hintText: "Enter password",
//               labelText: "Password",
//               labelStyle: TextStyle(color: Colors.black54),
//               suffixIcon: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _showPassword = !_showPassword;
//                   });
//                 },
//                 child: _showPassword
//                     ? Icon(Icons.visibility, color: Colors.grey)
//                     : Icon(Icons.visibility_off, color: Colors.grey),
//               ),
//             ),
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             autocorrect: false,
//             validator: (value) {
//               if (value.isEmpty) {
//                 return "*Password is required";
//               }
//               if (!isValidPassword(value)) {
//                 return "*The password must be a minimum of 8 characters. \nInclude an upper case letter, a lower case letter, a number, \nand a symbol.";
//               }
//               return null;
//             },
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           TextFormField(
//             controller: _confirmPassword,
//             cursorColor: kPrimaryColor,
//             obscureText: !_showConfirmPassword,
//             decoration: InputDecoration(
//               hintText: "Enter password",
//               labelText: "Confirm Password",
//               labelStyle: TextStyle(color: Colors.black54),
//               suffixIcon: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _showConfirmPassword = !_showConfirmPassword;
//                   });
//                 },
//                 child: _showConfirmPassword
//                     ? Icon(Icons.visibility, color: Colors.grey)
//                     : Icon(Icons.visibility_off, color: Colors.grey),
//               ),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: kPrimaryColor),
//               ),
//             ),
//             autocorrect: false,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             validator: (value) {
//               if (value.isEmpty) {
//                 return "*Confirm password is required";
//               }

//               if (_confirmPassword.text != _password.text) {
//                 return "*Passwords don't match";
//               }

//               return null;
//             },
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: 56.0,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colours.brandOrange,
//                 onPrimary: Colors.white,
//                 elevation: 1.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(6.0),
//                   ),
//                 ),
//               ),
//               onPressed: () {
//                 if (_formKey.currentState.validate()) {
//                   _formKey.currentState.save();
//                   formSubmit();
//                 }
//               },
//               child: Text("Sign up"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
