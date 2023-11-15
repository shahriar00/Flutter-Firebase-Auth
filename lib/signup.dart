import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/home.dart';

import 'login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();

  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Registration Successfully",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.grey,
        ));

        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));

      } on FirebaseException catch (e) {
        if(e.code == 'weak-password'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Password is very weak",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.grey,
        ));

        }else if(e.code == 'email-already-in-user'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Account already exists",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.grey,
        ));
        }
      }
    }
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF283793),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 130.0, left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello...!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontFamily: 'Pacifico'),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF4c59a5),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          controller: namecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Colors.white,
                              ),
                              hintText: 'Your Name',
                              hintStyle: TextStyle(color: Colors.white60)),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF4c59a5),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          controller: mailcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter E-mail';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                              hintText: 'Your E-mail',
                              hintStyle: TextStyle(color: Colors.white60)),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF4c59a5),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.password_outlined,
                                color: Colors.white,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white60)),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailcontroller.text;
                              name = namecontroller.text;
                              password = passwordcontroller.text;
                            });
                          }
                          registration();
                        },
                        child: Center(
                          child: Container(
                            width: 150,
                            height: 55,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xFFf95f3b),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Text(
                              "Signup",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                ),
                Row(
                  children: [
                    // Image.asset(
                    //   "images/im3.jpg",
                    //   height: 130,
                    //   width: 50,
                    //   fit: BoxFit.fill,
                    // ),
                    Spacer(),
                    Text(
                      "Already Have Account?",
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LogIn()));
                        },
                        child: Text(
                          " Login",
                          style: TextStyle(
                              color: Color(0xFFf95f3b),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )),
                    Spacer(),
                    // Image.asset(
                    //   "images/img1.jpg",
                    //   height: 130,
                    //   width: 70,
                    //   fit: BoxFit.fill,
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
