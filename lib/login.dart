import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController _usernameCtl = TextEditingController();
  TextEditingController _passwordCtl = TextEditingController();
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
                onPressed: _isLoading ? null : onLogin,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                label: const Text('Log In'),
              )),
          TextButton(
            onPressed: onForgot,
            child: Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  void onLogin() {
    print(_usernameCtl.text);
    print(_passwordCtl.text);
    setState(() {
      _isLoading = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void onForgot() {}
}
