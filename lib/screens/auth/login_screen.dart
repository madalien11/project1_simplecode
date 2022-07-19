import 'package:flutter/material.dart';
import 'package:project1_simplecode/widgets/app_unfocuser.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_button_styles.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../generated/l10n.dart';
import 'widgets/auth_alert_dialog.dart';
import 'widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: AppUnfocuser(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(AppAssets.images.fishIcon),
              ),
              Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      AuthTextField(
                        controller: _loginController,
                        maxLength: 8,
                        hintText: S.of(context).login,
                        icon: Icons.person,
                        obscureText: false,
                        validator: (val) {
                          if (val != null) {
                            val = val.trim();
                            if (val.length < 3) {
                              return S.of(context).lengthErrorCheckLogin;
                            } else if (val != "qwerty") {
                              return S.of(context).inputErrorCheckLogin;
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      AuthTextField(
                        controller: _passwordController,
                        maxLength: 16,
                        hintText: S.of(context).password,
                        icon: Icons.lock,
                        obscureText: isObscure,
                        isPassword: true,
                        showPassword: () {
                          setState(() => isObscure = !isObscure);
                        },
                        validator: (val) {
                          if (val != null) {
                            if (val.length < 8) {
                              return S.of(context).lengthErrorCheckPassword;
                            } else if (val != "123456ab") {
                              return S.of(context).inputErrorCheckPassword;
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: AppButtonStyles.elevated,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_key.currentState != null &&
                              _key.currentState!.validate()) {
                            _loginController.clear();
                            _passwordController.clear();
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AuthAlertDialog(
                                  title: S.of(context).error,
                                  content: S
                                      .of(context)
                                      .inputErrorCheckLoginPassword,
                                );
                              },
                            );
                          }
                        },
                        child: Text(
                          S.of(context).signIn,
                          style: AppTextStyles.s16w400.copyWith(
                            color: AppColors.lightText,
                          ),
                        ),
                      ),
                      TextButton(
                        style: AppButtonStyles.textButton,
                        child: Text(
                          S.of(context).registration,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
