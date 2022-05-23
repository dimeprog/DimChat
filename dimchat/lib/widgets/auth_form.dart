import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this._submitFn, this.isLoading);
  final bool isLoading;
  final Function(
    String email,
    String username,
    String password,
    bool isLogin,
    BuildContext context,
  ) _submitFn;
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _emailTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _FormKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _isLogin = false;

  // sunmit form method
  void _trySubmitt() {
    final isValid = _FormKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _FormKey.currentState!.save();
      widget._submitFn(
        _userEmail,
        _userName,
        _userPassword,
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Card(
              margin: const EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Form(
                  key: _FormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          key: ValueKey('email'),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _userEmail = value!;
                          },
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            label: Text(
                              'Email',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            // fillColor: Colors.pink,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (_isLogin)
                          TextFormField(
                            key: ValueKey('userName'),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 4) {
                                return 'it must be atleast 4 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _userName = value!;
                            },
                            controller: _usernameTextController,
                            decoration: InputDecoration(
                              label: Text(
                                'username',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              // fillColor: Colors.pink,
                            ),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          key: ValueKey('password'),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'it must be atleast 7 characters';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _userPassword = value!;
                          },
                          controller: _passwordTextController,
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text(
                              'password',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            // fillColor: Colors.pink,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if (widget.isLoading) const CircularProgressIndicator(),
                        if (!widget.isLoading)
                          RaisedButton(
                            onPressed: _trySubmitt,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        if (!widget.isLoading)
                          FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              _isLogin
                                  ? 'I already have an account'
                                  : 'create an account',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
