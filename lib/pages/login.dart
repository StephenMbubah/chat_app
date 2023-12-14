import 'package:chat_app/pages/registerPage.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String email="";
    String password= "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2, vertical: 80
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Groupie", style:  TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 40
                ),),
                SizedBox(
                  height: 10,
                ),
                Text("Login Now to see what they are talking about",
                  style:  TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 15
                ),),
                Image.asset("assets/images/login.png"),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email, color: Theme.of(context).primaryColor,),

                  ),
                    onChanged: (val){
                    setState(() {
                      email=val;
                      print(email);
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
                      prefixIcon: Icon(Icons.lock, color: Theme.of(context).primaryColor,),
                    ),
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Password must be at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val){
                      setState(() {
                        email=password;
                      });
                    }
                ),
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
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                    },
                  ),
                ),
    const SizedBox(
    height: 10,
    ),
    Text.rich(TextSpan(
    text: "Don't have an account? ",
    style: const TextStyle(
    color: Colors.black, fontSize: 14),
    children: <TextSpan>[
    TextSpan(
    text: "Register here",
    style: const TextStyle(
    color: Colors.black,
    decoration: TextDecoration.underline),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
      nextScreen(context, RegisterPage());

      }),
              ],
            ),
          ),]
        ),
      ),
    )));
  }
}
