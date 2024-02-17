import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test/Controllers/auth_controller.dart';
import 'package:test/Views/widgets/main_button.dart';
import 'package:test/Views/widgets/social_media_icon.dart';
import 'package:test/services/auth.dart';
import 'package:test/utils/app_router.dart';
import 'package:test/utils/enums.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passFocusNode = FocusNode();

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if (!mounted) return;
      Navigator.of(context).pushNamed(AppRouter.navBarPage);
    } on Exception catch (e) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                backgroundColor: Colors.white,
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Ok",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ))
                ],
                content: Text(
                  e.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                title: Text(
                  "Error",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ));
    }
  }

  @override
  void dispose() {
    _emailController.clear();
    _passController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthController>(
        create: (context) => AuthController(authBase: Auth()),
        child: Consumer<AuthController>(
          builder: (_, model, __) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 55, horizontal: 28),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.authType == AuthType.login
                              ? "Login"
                              : 'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        TextFormField(
                          onChanged: (val) {
                            model.updateEmail(val);
                          },
                          textInputAction: TextInputAction.next,
                          focusNode: _emailFocusNode,
                          controller: _emailController,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                          validator: (val) =>
                              val!.isEmpty ? 'Please Enter your email' : null,
                          decoration: const InputDecoration(
                              label: Text("Email"),
                              hintText: "Enter Your Email"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (val) {
                            model.updatePassword(val);
                          },
                          obscureText: true,
                          focusNode: _passFocusNode,
                          controller: _passController,
                          validator: (val) => val!.isEmpty
                              ? 'Please Enter your password'
                              : null,
                          decoration: const InputDecoration(
                              label: Text("Password"),
                              hintText: "Enter Your Password"),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            child: model.authType == AuthType.login
                                ? Text(
                                    "Forgot your password?",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  )
                                : const Text(' '),
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MainButton(
                          title: model.authType == AuthType.login
                              ? 'Login'
                              : 'Sign Up',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _submit(model);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            child: Text(
                              model.authType == AuthType.login
                                  ? "Don't have an account? Register"
                                  : "Already have account? Login",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            onTap: () {
                              _formKey.currentState!.reset();
                              _emailController.clear();
                              _passController.clear();
                              model.toggleAuthFormType(model.authType);
                            },
                          ),
                        ),
                        const Spacer(),
                        Center(
                            child: Text(
                          model.authType == AuthType.login
                              ? "Or login with social account"
                              : "Or sign up with social account",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialMediaIcon(
                                icon: FontAwesomeIcons.squareFacebook,
                                color: Colors.blue),
                            SizedBox(
                              width: 16,
                            ),
                            SocialMediaIcon(
                                icon: FontAwesomeIcons.squareInstagram,
                                color: Colors.pink),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
