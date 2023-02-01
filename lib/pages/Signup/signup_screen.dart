import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mechanic_koi/pages/launcher_page.dart';
import 'package:provider/provider.dart';
import '../../auth/auth_service.dart';
import '../../models/user_model.dart';
import '../../providers/user_provider.dart';
import '../../utils/background.dart';
import '../../utils/constants.dart';
import '../../utils/helper_functions.dart';
import '../Login/login_screen.dart';
import '../bottom_nav_bar_page.dart';
import 'components/sign_up_top_image.dart';



class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLogin = true;
  String _errMsg = '';
  bool _isObscure = true;
  bool rememberPassword = false;
  final focusNode = FocusNode();

  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    super.didChangeDependencies();
  }
    @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SignUpScreenTopImage(),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0,vertical: 8.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'Enter Your Email',
                            labelText: 'Enter Your Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0,vertical: 8.0),
                      child: TextFormField(
                        obscureText: _isObscure,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.password),
                            labelText: 'Enter your password',
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 1,
                                ))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field must not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0,vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _authenticate();
                        },
                        child: Text("SignUp".toUpperCase()),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    /*AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.pushNamed(context, LoginScreen.routeName,);
                      },
                    ),*/
                    RichText(text: TextSpan(
                        children: [
                          const TextSpan(text: 'Already have an account!!',
                            style: TextStyle(color: kPrimaryColor),),
                          TextSpan(text: '\tLogin',
                            style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16,),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushNamed(context, LoginScreen.routeName),),
                        ]
                    ))
                  ],
                )),
            // const SocalSignUp()
          ],
        ),
      ),
    );
  }

  void _authenticate() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait', dismissOnTap: false);
      final email = _emailController.text;
      final password = _passwordController.text;
      try {
        await AuthService.register(email, password);
        final userModel = UserModel(
          userId: AuthService.currentUser!.uid,
          email: AuthService.currentUser!.email!,
          userCreationTime: Timestamp.fromDate(
              AuthService.currentUser!.metadata.creationTime!),
        );
        userProvider.addUser(userModel).then((value) {
          EasyLoading.dismiss();
          Navigator.pushReplacementNamed(context, LauncherPage.routeName);
        }).catchError((error) {
          EasyLoading.dismiss();
          showMsg(context, 'could not save user info');
        });
      } on FirebaseAuthException catch (error) {
        EasyLoading.dismiss();
        setState(() {
          _errMsg = error.message!;
        });
        showMsg(context, _errMsg);
      }
    }
  }
}
