import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/Views/widgets/main_button.dart';
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
  var _authType = AuthType.login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 28),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _authType == AuthType.login ? "Login" : 'Sign Up',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 70,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter your email' : null,
                  decoration: const InputDecoration(
                      label: Text("Email"), hintText: "Enter Your Email"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passController,
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter your password' : null,
                  decoration: const InputDecoration(
                      label: Text("Password"), hintText: "Enter Your Password"),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    child: _authType == AuthType.login
                        ? const Text("Forgot your password?")
                        : const Text(' '),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MainButton(
                  title: _authType == AuthType.login ? 'Login' : 'Sign Up',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      debugPrint('Authenticated!');
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    child: Text(_authType == AuthType.login
                        ? "Don't have an account? Register"
                        : "Already have account? Login"),
                    onTap: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        if (_authType == AuthType.login) {
                          _authType = AuthType.register;
                        } else {
                          _authType = AuthType.login;
                        }
                      });
                    },
                  ),
                ),
                const Spacer(),
                Center(
                    child: Text(
                  _authType == AuthType.login
                      ? "Or login with social account"
                      : "Or sign up with social account",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color.fromARGB(255, 232, 228, 228))),
                      height: 65,
                      width: 75,
                      child: const Icon(
                        FontAwesomeIcons.squareInstagram,
                        size: 38,
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color.fromARGB(255, 232, 228, 228))),
                      height: 65,
                      width: 75,
                      child: const Icon(
                        FontAwesomeIcons.squareFacebook,
                        size: 38,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
