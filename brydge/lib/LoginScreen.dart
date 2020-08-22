import 'package:flutter/material.dart';
import './SignUp.dart';
// import './ContactsPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextStyle style = TextStyle(
    fontSize: 17.0,
  );

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    //final maxWidth = MediaQuery.of(context).size.width; // Use this
    final curScaleFactor = MediaQuery.of(context).textScaleFactor; // Use this

    // To accept user's email
    final emailField = TextField(
      obscureText: false,
      style: TextStyle(fontSize: 17),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0), //Fix This
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    // To accept user's password
    final passwordField = TextField(
      obscureText: true,
      style: TextStyle(fontSize: 17),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0), //Fix This
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    // Forgot Password button
    final forgotPassword = Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {},
        padding: EdgeInsets.only(right: 5.0),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    // For logging in -- should verify and open the main page
    final loginButon = Material(
      borderRadius: BorderRadius.circular(30.0),
      child: Ink(
        decoration: const BoxDecoration(
          color: Color(0xFF3EBFED),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => MyContacts()));
            Navigator.pop(context); // Change here
          },
          child: Text("Login",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );

    // Alternate options to login with
    final loginOptions = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              height: maxHeight * 0.07,
              width: maxHeight * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                image:
                    DecorationImage(image: AssetImage("assets/facebook.jpg")),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: maxHeight * 0.07,
              width: maxHeight * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(image: AssetImage("assets/google.jpg")),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: maxHeight * 0.07,
              width: maxHeight * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image:
                    DecorationImage(image: AssetImage("assets/linkedin.jpg")),
              ),
            ),
          ),
        ],
      ),
    );

    // To open the sign up screen
    final signUpOption = Expanded(
      child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Material(
            child: Ink(
              width: double.infinity,
              height: 0.12 * maxHeight,
              decoration: BoxDecoration(
                color: Color(0xFF3EBFED),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0)),
              ),
              child: InkWell(
                onTap: () {
                  // Animation Change
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0.03 * maxHeight, 0, 0),
                  child: Text(
                    'New User? Sign Up Here!',
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          height: maxHeight,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(maxHeight * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(5, maxHeight * 0.08, 5, 0),
                      child: Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 0.07 * curScaleFactor * maxHeight,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3EBFED),
                        ),
                      ),
                    ),
                    SizedBox(height: maxHeight * 0.04),
                    emailField,
                    SizedBox(height: maxHeight * 0.02),
                    passwordField,
                    SizedBox(height: maxHeight * 0.02),
                    forgotPassword,
                    SizedBox(height: maxHeight * 0.02),
                    loginButon,
                    SizedBox(height: maxHeight * 0.02),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: maxHeight * 0.02),
                      child: Text(
                        'or login with',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    loginOptions,
                  ],
                ),
              ),
              signUpOption,
            ],
          ),
        ),
      ),
    );
  }
}
