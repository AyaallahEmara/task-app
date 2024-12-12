import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/widgets/space_widget.dart';
import 'package:task/core/widgets/custom_buttons.dart';
import 'package:task/view/widgets/login_view_item.dart';

class RegisterView extends StatefulWidget {
   RegisterView({super.key});

  static String registerid = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
   String? email;

   String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kMainColor,
        body:  Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: ListView(
                children: [
                  VerticalSpace(5),
                  Text(
                    'Let\'s Register.',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 50,
                    ),
                  ),
                  VerticalSpace(2),
                  Text(
                    'Welcome here.',
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
                    hintText: 'Password',
                    obscureText: true,
                    onChanged: (data)
                    {
                      password = data;
                    },
                  ),
                  VerticalSpace(15),
                  CustomGeneralButton(
                    text: 'Sign Up',
                    onTap: () async
                    {
                      if (formKey.currentState!.validate()) {
                        isLoading=true;
                        setState(() {

                        });
                        try {
                          await registerUser();
                          showSnackBar(context, 'Successfully Registeration');
                          Navigator.pop(context);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(context,'The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context, 'The account already exists for that email.');
                          }
                        }  catch (e) {
                         showSnackBar(context, e.toString());
                        }
                        isLoading=false;
                        setState(() {

                        });
                      }else {}
                    },
                  ),
                  VerticalSpace(1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ?',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(left: 8),
                          child: Text('Signin',
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
    );;
  }

  void showSnackBar(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message)));
  }

  Future<void> registerUser() async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
