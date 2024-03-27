import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmo_food/bloc/login/login_bloc.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/back_button.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/full_button.dart';
import 'package:rmo_food/src/components/widget_helper.dart';
import 'package:rmo_food/src/pages/authentication/helper/validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoggingIn) {
            showDialog(
                context: context,
                builder: (context) => const Dialog(
                    backgroundColor: Colors.transparent,
                    child: CupertinoActivityIndicator(
                      color: Colors.white,
                    )));
          }
          if (state is LoggedIn) {
            Navigator.popUntil(context, (route) => route.isFirst);
          }
          if (state is LogginError) {
            Navigator.pop(context);
            AppWidgetHelper.bottomSheet(
                context: context, message: state.errorMessage);
          }
        },
        child: GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          const Positioned(
                              top: 30, left: 10, child: AppBackButton()),
                          Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset("assets/icons/splash.svg",
                                color: Colors.red, height: 150, width: 150),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Form(
                                  key: formKey,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Let’s get started",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        Text(
                                            "Sign Up to the  get started immediately ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(color: Colors.red)),
                                        FixedGaps.verticalGap20,
                                        TextFormField(
                                            controller: _emailController,
                                            cursorColor: primaryColor,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: FormValidation
                                                .usernameValidation,
                                            decoration: const InputDecoration(
                                                hintText: "Username"),
                                            style:
                                                const TextStyle(fontSize: 12)),
                                        FixedGaps.verticalGap20,
                                        TextFormField(
                                            controller: _passwordController,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            cursorColor: primaryColor,
                                            obscureText: obscureText,
                                            validator: FormValidation
                                                .passwordValidation,
                                            decoration: InputDecoration(
                                                suffixIcon: InkWell(
                                                    onTap: () {
                                                      setState(() =>
                                                          obscureText =
                                                              !obscureText);
                                                    },
                                                    child: Icon(
                                                        obscureText
                                                            ? Icons
                                                                .visibility_off
                                                            : Icons.visibility,
                                                        color: Colors.grey)),
                                                hintText: "Password"),
                                            style:
                                                const TextStyle(fontSize: 12)),
                                        FixedGaps.verticalGap20,
                                        FullButton(
                                            onPressed: () async {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                BlocProvider.of<LoginBloc>(
                                                        context)
                                                    .add(LoginButtonPressed(
                                                        email: _emailController
                                                            .text,
                                                        password:
                                                            _passwordController
                                                                .text));
                                              }
                                            },
                                            btnName: "LOGIN"),
                                        const Spacer(),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/iaincons/splash.svg",
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
                    ]))));
  }
}
