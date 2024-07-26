//import 'dart:html';
import 'package:punto_venta/api/authentication_api.dart';
//import 'package:punto_venta/pages/home_page.dart';
import 'package:punto_venta/utils/dialogs.dart';
//import 'package:punto_venta/utils/routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:punto_venta/utils/responsive.dart';
import 'package:punto_venta/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final Uri _url = Uri.parse('https://www.google.com/');
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _email = '', _password = '';
  final AuthenticationApi _authenticationApi = AuthenticationApi();

  Future<void> _submit() async {
    final isOk = _formKey.currentState?.validate();
    //print("form is: $isOk");
    if (isOk != null && isOk == true) {
      ProgressDialog.show(context);
      await _authenticationApi.register(
        email: _email,
        password: _password,
      );
      // ignore: use_build_context_synchronously
      ProgressDialog.dismiss(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.istTablet ? 500 : 360,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "email",
                obscureText: false,
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  if (!text!.contains("@")) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              InputText(
                keyboardType: TextInputType.visiblePassword,
                label: "Password",
                obscureText: true,
                onChanged: (text) {
                  _password = text;
                },
                validator: (text) {
                  if (text!.trim().isEmpty) {
                    return "Invalid password";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 255, 255, 1)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black87),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                  ),
                  onPressed: _submit,
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: responsive.dp(1.3)),
                  ),
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿Eres nuevo? Regístrate",
                    style: TextStyle(fontSize: responsive.dp(1.4)),
                  ),
                  TextButton(
                    onPressed: _launchUrl,
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                        ),
                        foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 190, 1, 97),
                        )),
                    child: Text(
                      "aquí",
                      style: TextStyle(fontSize: responsive.dp(1.4)),
                    ),
                  )
                ],
              ),
              SizedBox(height: responsive.dp(20))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
