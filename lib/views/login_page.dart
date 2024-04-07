import 'package:codeland/components/custom_elevated_button.dart';
import 'package:codeland/components/custom_textfield.dart';
import 'package:codeland/res/colors.dart';
import 'package:codeland/res/image.dart';
import 'package:codeland/views/image_upload_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // usernameController.addListener(()=>setState((){}));
    passwordController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    codelandLogo,
                    width: 186,
                    height: 118,
                  ),
                  Image.asset(
                    codelandCloudLogo,
                    width: 165,
                    height: 158,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Biomedical  Kiosk',
                    style: TextStyle(
                      color: fontColor,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 220,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "for HCE’s",
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      label: 'Username',
                      isPasswordField: false,
                      controller: usernameController),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    label: 'Password',
                    isPasswordField: true,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomElevatedButton(
                    label: "Login",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ImageUploadPage()));
                        usernameController.clear();
                        passwordController.clear();
                        //focus on username field
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'For Assistance & Login Details Contact: ',
                      style: TextStyle(
                        color: fontColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'English, Kannada & Telugu : ',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '7406333800',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: accentColor,
                          decorationColor: accentColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'English, Kannada & Hindi : ',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '9071386515',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: accentColor,
                          decorationColor: accentColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'v1.7 © 2023, Codeland Infosolutions Pvt Ltd.',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
