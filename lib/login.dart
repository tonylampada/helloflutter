import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helloflutter/api.dart' as api;

class LoginWidget extends StatefulWidget {
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _usernameCtl = TextEditingController();
  final TextEditingController _passwordCtl = TextEditingController();
  bool _isLoading = false;

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
            child: const FlutterLogo(size: 40),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              controller: _usernameCtl,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(90.0),
                ),
                labelText: 'Username',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              controller: _passwordCtl,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(90.0),
                ),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
              height: 80,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton.icon(
                icon: _isLoading
                    ? Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2.0),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : const Icon(Icons.feedback),
                onPressed: _isLoading ? null : _onLogin,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                label: const Text('Log In'),
              )),
          TextButton(
            onPressed: _onForgot,
            child: Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onLogin() async {
    setState(() {
      _isLoading = true;
    });
    var response1 = await api.logout();
    var response2 = await api.whoami();
    var response3 = await api.login(_usernameCtl.text, _passwordCtl.text);
    var response4 = await api.whoami();
    var response5 = await api.logout();
    var response6 = await api.whoami();
    assert(!response2.data['authenticated']);
    assert(response4.data['user']['id'] is int);
    assert(!response6.data['authenticated']);
    print('login deu bom');
    setState(() {
      _isLoading = false;
    });
  }

  void _onForgot() {}
}
