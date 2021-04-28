import 'package:flutter/material.dart';

class UserDataForm extends StatefulWidget {
  final String username;
  final String email;
  final Function onSubmit;
  
  UserDataForm(
    {
      @required this.username,
      @required this.email,
      @required this.onSubmit,
    }
  );

  @override
  _UserDataForm createState() => _UserDataForm();
}
class _UserDataForm extends State<UserDataForm> {
  TextEditingController usernameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();

  @override
  void initState() {
    usernameInputController = TextEditingController();
    emailInputController = TextEditingController();
    usernameInputController.text = widget.username;
    emailInputController.text = widget.email;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    usernameInputController.dispose();
    emailInputController.dispose();
  }

  bool isValidEmail(String email) {
    // TODO: validate the email pattern
    // check if the email is already taken
    return true;
  }

  bool isValidUsername(String username) {
    // TODO: Validate username
    return true;
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Basic info',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: usernameInputController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Full Name',
              hintText: "Your Full Name",
              isDense: true,
              labelStyle: TextStyle(color: Colors.black54),
              contentPadding: new EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0
              ),
              suffixIcon: Icon(
                Icons.person, 
                color: Colors.grey,
              ),
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
            controller: emailInputController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              enabled: false,
              hintText: "example@domain.com",
              isDense: true,
              contentPadding: new EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0
              ),
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
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 47.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber[900],
                onPrimary: Colors.white,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
              ),
              onPressed: (){
                final String email = emailInputController.text;
                final String username = usernameInputController.text;
                final bool emailValid = isValidEmail(email);
                final bool usernameValid = isValidUsername(username);
                // set invalid 
                final Map<String,dynamic> response = usernameValid && emailValid?
                  {
                    'username': username,
                    'email': email
                  }
                  : null;
                widget.onSubmit(response);

              },
              child: Text("Save"),
            ),
          ),
        ],
      )
    );
  }
}


