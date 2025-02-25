import 'package:bookz/auth/login_page.dart';
import 'package:bookz/models/color_set.dart';
import 'package:bookz/models/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bookz/auth/register_page.dart';

import '../screens/home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();

  String? errorMessage;
  bool isChecked = false;
  bool isHeddin = true;
  bool isLoading = false;

  Future<void> _registerWithEmail() async {
    setState(() {
      isLoading = true;
    });

    if (_passwordController.text.trim() != _cpasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match!")),
      );
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullname': _fullnameController.text.trim(),
        'email': _emailController.text.trim(),
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Navbar()),
      );
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void validateInputs() {
    setState(() {
      String fullname = _fullnameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      String cpassword = _passwordController.text.trim();

      if (fullname.isEmpty &&
          email.isEmpty &&
          password.isEmpty &&
          cpassword.isEmpty) {
        setState(() {
          errorMessage = "Please fill in all fields.";
        });
      } else if (fullname.isEmpty) {
        setState(() {
          errorMessage = "Please enter your fullname.";
        });
      } else if (fullname.length < 3) {
        setState(() {
          errorMessage = "Your fullname must be at least 3 characters long.";
        });
      } else if (email.isEmpty) {
        setState(() {
          errorMessage = "Please enter your email.";
        });
      } else if (!email.contains("@")) {
        setState(() {
          errorMessage = "Please enter a valid email address.";
        });
      } else if (password.isEmpty) {
        setState(() {
          errorMessage = "Please enter your password.";
        });
      } else if (password.length < 6) {
        setState(() {
          errorMessage = "Your password must be at least 6 characters long.";
        });
      } else if (cpassword.isEmpty) {
        setState(() {
          errorMessage = "Please enter your confirm password.";
        });
      } else if (cpassword != password) {
        setState(() {
          errorMessage = "Passwords do not match.";
        });
      } else if (isChecked == false) {
        setState(() {
          errorMessage = "Please accept the Terms & Conditions.";
        });
      } else {
        setState(() {
          errorMessage = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16.0),
                  alignment: Alignment.center,
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppColors.greyBack,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10),
                    if (errorMessage != null)
                      GestureDetector(
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 23,
                        ),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.redText,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        errorMessage!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              backgroundColor: AppColors.background,
                            ),
                          );
                        },
                      ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "Complete the form to join and start\nyour journey with us",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.greyBack,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4, bottom: 4),
                        child: Text(
                          "Fullname",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      itemTextField(_fullnameController, false),
                      Padding(
                        padding: EdgeInsets.only(left: 4, bottom: 4),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      itemTextField(_emailController, false),
                      Padding(
                        padding: EdgeInsets.only(left: 4, bottom: 4),
                        child: Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      itemTextField(_passwordController, true),
                      Padding(
                        padding: EdgeInsets.only(left: 4, bottom: 4),
                        child: Text(
                          "Confirm Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      itemTextField(_cpasswordController, true),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Checkbox(
                      activeColor: AppColors.redText,
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue!;
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      "I accept the Terms & Conditions.",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        validateInputs();
                        if (errorMessage == null) {
                          _registerWithEmail();
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.redText),
                        child: Center(
                          child: isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemTextField(TextEditingController controller, bool isObscure) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 55,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.greyBBack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            border: InputBorder.none,
            suffixIcon: isObscure
                ? IconButton(
                    icon: Icon(
                      isHeddin ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isHeddin = !isHeddin;
                      });
                    },
                  )
                : null,
          ),
          style: TextStyle(
            color: Colors.white,
            letterSpacing: isObscure
                ? isHeddin
                    ? 5
                    : 1
                : 1,
            fontSize: 16,
          ),
          obscureText: isObscure ? isHeddin : false,
        ),
      ),
    );
  }
}
