
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mechanic_koi/pages/launcher_page.dart';
import 'package:provider/provider.dart';

import '../../auth/auth_service.dart';

import '../../providers/user_provider.dart';
import '../../utils/background.dart';
import '../../utils/constants.dart';

import '../../utils/helper_functions.dart';
import '../../utils/widget_function.dart';
import '../Signup/signup_screen.dart';
import 'components/login_screen_top_image.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String errMsg = '';
  bool isLogin = true;
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
              const LoginScreenTopImage(),
              Form(
                  key: _formKey,
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 36.0, vertical: 8.0),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 36.0, vertical: 8.0),
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
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  showSingleTextFieldInputDialog(
                                    context: context,
                                    title: 'Enter your Email Address which you provide before',
                                    onSubmit: (value) {
                                      try{
                                        EasyLoading.show();
                                        AuthService.resetPassword(value);
                                        EasyLoading.dismiss();
                                      }catch(error){
                                        EasyLoading.dismiss();
                                        showMsg(context, error.toString());
                                      }
                                    },
                                  );
                                },
                                child: const Text('Forgot Password?'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 36.0, vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _authenticate();
                              //Navigator.pushReplacementNamed(context, BottomNavBarPage.routeName);
                            },
                            child: Text("Login".toUpperCase()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /*AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName, arguments: true);
                      },
                    ),*/

                        RichText(text: TextSpan(
                          children: [
                          const TextSpan(text: 'Don\'t have an account??',
                          style: TextStyle(color: kPrimaryColor),),
                          TextSpan(text: '\tSingUp',
                            style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16,),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushNamed(context, SignUpScreen.routeName),),
                      ]
                  )),
                        const SizedBox(height: 20,),
                        const Text('OR',style: TextStyle(color: Colors.red),),
                        const SizedBox(height: 20, ),
                        const Text('Sign In with',style: TextStyle(color: kPrimaryColor),),
                        const SizedBox(height: 20, ),
                        InkWell(
                          onTap: (){},
                          child: Card(
                            elevation: 10,
                            shadowColor: kPrimaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset('assets/images/google.png',height: 20,width: 20,),
                                  const SizedBox(width: 5,),
                                  const Text('Google',style: TextStyle(fontSize: 22,color: kPrimaryColor),),
                                ],
                              ),
                            ),
                          ),
                        )
            ],
          )),
      ],
    ),)
    ,
    );
  }

  void _authenticate() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait', dismissOnTap: false);
      final email = _emailController.text;
      final password = _passwordController.text;
      try {
        if(await AuthService.login(email, password)){
          if(await userProvider.doesUserExist(AuthService.currentUser!.uid)){
            EasyLoading.dismiss();
            if(mounted)Navigator.pushReplacementNamed(context, LauncherPage.routeName);
          }else{
            EasyLoading.dismiss();
            if(mounted)showMsg(context, 'Please sign up first');
          }
        }
        EasyLoading.dismiss();

      } on FirebaseAuthException catch (error) {
        EasyLoading.dismiss();
        showMsg(context, 'Please sign up first');
      }
    }
  }


}

