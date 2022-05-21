import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Card(
              margin: const EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
