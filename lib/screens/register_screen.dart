import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/components/textField_com.dart';
import 'add_screen.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //const RegisterScreen({ Key key }) : super(key: key);
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwardController = TextEditingController();

  TextEditingController repeatPasswardController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var isPassward = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/signup.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 125,
                  ),
                  Text(
                    'Register Now',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldComponent(
                controlleR: userNameController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your User Name';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid User Name';
                  }
                  return null;
                },
                labelText: 'User Name',
                inputType: TextInputType.name,
                preIcon: Icons.verified,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: passwardController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Passward';
                  } else if (value.length < 8) {
                    return 'The Password Should be at least 8 Letters';
                  }
                  return null;
                },
                isPassward: isPassward,
                labelText: 'Passward',
                inputType: TextInputType.visiblePassword,
                preIcon: Icons.lock,
                sufIcon: isPassward ? Icons.visibility_off : Icons.visibility,
                sufIconPressed: () {
                  setState(() {
                    isPassward = !isPassward;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: repeatPasswardController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please repeat your Passward correctly';
                  } else if (value != passwardController.text) {
                    return 'The Password doesn\'t match';
                  } else if (value.length < 8) {
                    return 'The Password Should be at least 8 Letters';
                  }
                  return null;
                },
                isPassward: isPassward,
                labelText: 'Repeat Passward',
                inputType: TextInputType.visiblePassword,
                preIcon: Icons.lock,
                sufIcon: isPassward ? Icons.visibility_off : Icons.visibility,
                sufIconPressed: () {
                  setState(() {
                    isPassward = !isPassward;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonComponent(
                () {
                  if (formKey.currentState!.validate()) {
                    print('Register success');
                    print(userNameController.text);
                    print(passwardController.text);
                    print(repeatPasswardController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return AddScreen();
                    })));
                  }
                },
                buttonName: 'Register',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('already have an account?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      print('Rs');
                    },
                    child: const Text(
                      ' Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
