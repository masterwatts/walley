import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:walley/root_page.dart';
import 'package:walley/util/navigation_util.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  bool passwordHidden = true;

  attemptRegisterAccount() async {
    if (_form.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        await users.doc(emailController.text).set(
          {
            'name': nameController.text,
          },
        );

        if (mounted) {
          NavigationUtil.navigateToWithoutBack(const RootPage(), context);
        }
      } on FirebaseAuthException catch (e) {
        String msg() {
          switch (e.code) {
            case "weak-password":
              return "Your password needs to be between 8 and 50 characters long.";
            case "email-already-in-use":
              return "This email is already used for another account";
            default:
              return "An unexpected error occurred. Please report this error code to the developer team: ${e.code}";
          }
        }

        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Text(msg()),
              title: Row(
                children: [
                  const Icon(Icons.error_rounded),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    e.code
                        .split("-")
                        .map(
                          (e) =>
                              e[0].toUpperCase() +
                              (e.length > 1 ? e.substring(1) : ''),
                        )
                        .join(" "),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      } on Exception catch (e) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Text(
                "An unexpected issue occurred on our end. Please report this error message to the developer: ${e.toString()}",
              ),
              title: const Text("Error"),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/text_logo.svg',
          semanticsLabel: 'Text Logo',
          height: 90,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => NavigationUtil.pop(context),
                    child: Text(
                      " Log in here.",
                      style: TextStyle(
                        fontSize: 14,
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Colors.blue.shade600
                            : Colors.blue.shade800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _form,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      autocorrect: false,
                      maxLines: 1,
                      validator: ValidationBuilder().required().build(),
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailController,
                      autocorrect: false,
                      maxLines: 1,
                      validator: ValidationBuilder().email().build(),
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwordController,
                      autocorrect: false,
                      maxLines: 1,
                      obscureText: passwordHidden,
                      validator: ValidationBuilder()
                          .minLength(8)
                          .maxLength(50)
                          .build(),
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: IconButton(
                          icon: passwordHidden
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility_rounded),
                          onPressed: () => setState(
                            () {
                              passwordHidden = !passwordHidden;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: attemptRegisterAccount,
                  child: const Text("Proceed"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
