import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/widgets/space_widget.dart';
import 'package:task/core/widgets/custom_buttons.dart';
import 'package:task/view/register_view.dart';
import 'package:task/view/widgets/login_view_item.dart';

class LoginView extends StatefulWidget {

   LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return  ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor:  kMainColor,
        body:  Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: ListView(
                  children: [
                  VerticalSpace(5),
                  Text(
                  'Let\'s Sign you in.',
                  style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 50,
                  ),
                  ),
                  VerticalSpace(2),
                  Text(
                  'Welcome back.',
                  style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                  ),
                  ),
                  Text(
                  'You\'ve been missed!',
                  style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                  ),
                  ),
                  VerticalSpace(5),
                  LoginViewItem(
                  text: 'Email',
                  hintText: 'Your email',
                    onChanged: (data)
                    {
            email = data;
                    },
                  ),
                  VerticalSpace(3),
                  LoginViewItem(
                  text: 'Password',
                  obscureText: true,
                  hintText: 'Password',
                    onChanged:(data)
                    {
            password = data;
                    },
                  ),
                  VerticalSpace(15),
                  CustomGeneralButton(
                  text: 'Sign in',
                    onTap: () async
                    {

            if (formKey.currentState!.validate()) {
              isLoading = true;
              setState(() {

              });
              try {
                await loginUser();
                showSnackBar(context, 'Successfully Login');
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  showSnackBar(context, 'No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  showSnackBar(context, 'Wrong password provided for that user.');
                }
              }
              isLoading = false;
              setState(() {

              });
            }
                    },
                  ),
                  VerticalSpace(1),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Don\'t have an account ?',
                  style: TextStyle(
                  color: Colors.black45,
                  fontSize: 18,
                  ),
                  ),
                  GestureDetector(
                    onTap: (){
            Navigator.pushNamed(context, RegisterView.registerid);
                    },
                    child: Padding(
                    padding:  EdgeInsets.only(left: 8),
                    child: Text('Register',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    ),
                    ),
                    ),
                  ),
                  ],
                  ),
                  ]
                  ),
          ),
      ),
      ),
    );
  }

  Future<void> loginUser() async {
     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!
    );
  }

   void showSnackBar(BuildContext context,String message) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text(message)));
   }
}
