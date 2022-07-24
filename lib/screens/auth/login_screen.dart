import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:project1_simplecode/screens/products_screen/products_screen.dart';
import 'package:project1_simplecode/widgets/app_unfocuser.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
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
  bool isObscure = true;
  bool _isLoading = false;
  final _key = GlobalKey<FormState>();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppUnfocuser(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  AppAssets.images.fishIcon,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryColorLight,
                ),
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is LoginLoading) {
                    setState(() => _isLoading = true);
                  } else {
                    setState(() => _isLoading = false);
                  }

                  if (state is LoginError) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AuthAlertDialog(
                          title: S.of(context).error,
                          content: state.error,
                        );
                      },
                    );
                  }

                  if (state is LoginSuccessful) {
                    Hive.box('token').put('token', state.token);
                    _loginController.clear();
                    _passwordController.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsScreen(),
                      ),
                    );
                  }
                },
                child: Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: _isLoading
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: const Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          )
                        : Column(
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
                                      return S
                                          .of(context)
                                          .lengthErrorCheckLogin;
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
                                      return S
                                          .of(context)
                                          .lengthErrorCheckPassword;
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
                                    BlocProvider.of<AuthBloc>(context).add(
                                      LoginEvent(
                                        login: _loginController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
