import 'package:chat_app/pages/login.dart';
import 'package:chat_app/service/auth_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String email = "";
    String password = "";
    String fullname = "";

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: _isLoading? Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor)):SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 80),
          child: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Groupie",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Create your account now to chart and explore",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  Image.asset("assets/images/register.png"),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                      labelText: "Full Name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        fullname=val;
                      });
                    },
                    validator: (val) {
                      if (val!.isNotEmpty){
                        return null;
                      }else{
                        return "Name cannot be empty";
                      }
                    }
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        email=val;
                      });
                    },
                    validator: (val) {
                      return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!)
                          ? null
                          : "Please enter a valid email";
                    },
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: textInputDecoration.copyWith(
                        labelText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      validator: (val) {
                        if (val!.length < 6) {
                          return "Password must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          password= val;
                        });
                      }),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {

                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Login",
                            style: const TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                nextScreen(context, LoginPage());
                              }),
                      ],
                    ),
                  ),
                ]),
          ),
        )));
    void register()async {
      if(formKey.currentState!.validate()){
        setState(() {
          _isLoading= true;
        });
        // await AuthService.register

      }
    }
  }


}
