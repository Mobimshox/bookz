import 'package:bookz/models/color_set.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookz/auth/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;
  bool isHeddin = true;
  bool isLoading = false;
  String? errorMessage;

  Future<void> _signInWithEmail() async {
    setState(() {
      isLoading = true;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      String message = "An error occurred. Please try again.";
      if (e.code == 'user-not-found') {
        message = "No user found for this email.";
      } else if (e.code == 'wrong-password') {
        message = "Incorrect password. Please try again.";
      } else if (e.code == 'invalid-email') {
        message = "Invalid email format.";
      }
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
                      message,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.background,),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void validateInputs() {
    setState(() {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      if (email.isEmpty && password.isEmpty) {
        setState(() {
          errorMessage = "Please fill in all fields.";
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
                      Icons.close,
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
                      "Log In",
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
                  "Please fill up email and password\nto long in to your account",
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
                          "Email",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      itemTextField(_emailController, false, validateInputs),
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
                      itemTextField(_passwordController, true, validateInputs),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: AppColors.redText,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        validateInputs();
                        if (errorMessage == null) {
                          _signInWithEmail();
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.redText,
                        ),
                        child: Center(
                          child: isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "Log In",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => RegisterPage()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: AppColors.redText,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemTextField(
      TextEditingController controller, bool isObscure, Function onChanged) {
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
          onChanged: (value) => onChanged(),
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
