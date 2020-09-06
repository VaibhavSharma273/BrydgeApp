import 'package:brydge/CreateProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import './SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brydge/ContactsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_linkedin/linkedloginflutter.dart';
// import './ContactsPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final String redirectUrl =
      'http://brydge.example.com/linkedin-oauth2/callback';
  final String clientId = '78hswhzzxxxmq5';
  final String clientSecret = 'ulBxOENAz6RtBSNp';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // FirebaseUser _user;
  String email, password;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  TextStyle style = TextStyle(
    fontSize: 17.0,
  );

  @override
  void initState() {
    LinkedInLogin.initialize(context,
        clientId: clientId,
        clientSecret: clientSecret,
        redirectUri: redirectUrl);
    super.initState();
  }

  Future<void> handleSignInGoogle() async {
    try {
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: gSA.idToken, accessToken: gSA.accessToken);

      AuthResult authResult = await _auth.signInWithCredential(credential);
      if (authResult.additionalUserInfo.isNewUser) {
        _newUserPage();
      } else {
        _existingUserPage();
      }
    } catch (e) {}
  }

  String removeSpaces(String text) {
    String textSpecial;
    textSpecial = text.split(' ').join('');
    return textSpecial;
  }

  Future<void> handleSignInLinkedin() async {
    LinkedInLogin.loginForAccessToken(
        destroySession: true,
        appBar: AppBar(
          title: Text('Demo Login Page'),
        )).then((accessToken) {
      print(accessToken);
      _newUserPage();
    }).catchError((err) {
      print(err.toString());
    });
  }

  void _signIn({String em, String pw}) {
    _auth.signInWithEmailAndPassword(email: em, password: pw).then((value) {
      print(value.user.isEmailVerified);
      if (value.user.isEmailVerified) {
        if (value.additionalUserInfo.isNewUser) {
          _newUserPage();
        } else {
          _existingUserPage();
        }
      } else {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                    'Your email has not been verified. Please verify and then try again'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    }).catchError((err) {
      if (err.code == 'ERROR_WRONG_PASSWORD') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('The password was incorrect, please try again'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      } else if (err.code == 'ERROR_INVALID_EMAIL') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('Please enter a valid email'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      } else if (err.code == 'ERROR_USER_NOT_FOUND') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                    'No account is associated with this email, Sign up instead'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      } else {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('Please try again after some time'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    });
  }

  void _signInFacebook() async {
    FacebookLogin facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    final token = result.accessToken.token;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
    print(graphResponse.body);
    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.getCredential(accessToken: token);
      _auth.signInWithCredential(credential);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyContacts(
                    userEmail: 'Facebook',
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    //final maxWidth = MediaQuery.of(context).size.width; // Use this
    final curScaleFactor = MediaQuery.of(context).textScaleFactor; // Use this

    // To accept user's email
    final emailField = TextField(
      onChanged: (textVal) {
        setState(() {
          email = textVal;
        });
      },
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
      onChanged: (textVal) {
        setState(() {
          password = textVal;
        });
      },
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
            _signIn(em: removeSpaces(email), pw: password);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => MyContacts()));// Change here
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
          InkWell(
            onTap: () {
              _signInFacebook();
            },
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
          InkWell(
            onTap: () {
              handleSignInGoogle();
            },
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
          InkWell(
            onTap: () {
              handleSignInLinkedin();
            },
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

  void _newUserPage() {
    //Navigate to New User Page
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => CreateProfile()));
  }

  void _existingUserPage() {
    //Navigate to New User Page
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyContacts(
                  userEmail: 'Existing User!',
                )));
  }
}
