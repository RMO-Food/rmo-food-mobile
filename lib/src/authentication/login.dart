import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmo_food/helper/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(height: 20),
        SvgPicture.asset("assets/icons/splash.svg",
            color: Colors.red, height: 150, width: 150),
        Padding(
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
                          .copyWith(fontWeight: FontWeight.bold)),
                  Text("Sign Up to the  get started immediately ",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.red)),
                  FixedGaps.vertialGap20,
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*Required*";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: "Username"),
                      style: const TextStyle(fontSize: 12)),
                  FixedGaps.vertialGap20,
                  TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*Required*";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: "Password"),
                      style: const TextStyle(fontSize: 12)),
                  FixedGaps.vertialGap20,
                  MaterialButton(
                      onPressed: () {
                        formKey.currentState!.validate();
                      },
                      child: const Text("LOGIN"))
                ]),
          ),
        )
      ])),
    );
  }
}
