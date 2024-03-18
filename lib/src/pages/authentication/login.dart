import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/full_button.dart';
import 'package:rmo_food/src/pages/authentication/helper/validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  SvgPicture.asset("assets/icons/splash.svg",
                      color: Colors.red, height: 150, width: 150),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Form(
                              key: formKey,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Let’s get started",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    Text(
                                        "Sign Up to the  get started immediately ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(color: Colors.red)),
                                    FixedGaps.verticalGap20,
                                    TextFormField(
                                        cursorColor: primaryColor,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator:
                                            FormValidation.usernameValidation,
                                        decoration: const InputDecoration(
                                            hintText: "Username"),
                                        style: const TextStyle(fontSize: 12)),
                                    FixedGaps.verticalGap20,
                                    TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        cursorColor: primaryColor,
                                        obscureText: obscureText,
                                        validator:
                                            FormValidation.passwordValidation,
                                        decoration: InputDecoration(
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  setState(() => obscureText =
                                                      !obscureText);
                                                },
                                                child: Icon(
                                                    obscureText
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color: Colors.grey)),
                                            hintText: "Password"),
                                        style: const TextStyle(fontSize: 12)),
                                    FixedGaps.verticalGap20,
                                    FullButton(
                                        onPressed: () {
                                          formKey.currentState!.validate();
                                        },
                                        btnName: "LOGIN"),
                                    const Spacer(),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/icons/splash.svg",
                                              color: Colors.red,
                                              height: 30,
                                              width: 30),
                                          Text("Join Us Now!",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                      fontFamily: "Lexend",
                                                      color: Colors.grey))
                                        ])
                                  ]))))
                ])));
  }
}
