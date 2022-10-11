import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_media_project/padding_values.dart';
import 'package:social_media_project/progress_indicator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ProgressIndicatorView, PaddingValues {
  bool _isLoging = false;
  TextEditingController? _userController;
  final String _imgPath = "lib/assets/bkg.jpg";
  final String _labelText = "User Name";
  final String _buttonText = "Login";
  @override
  void initState() {
    _userController = TextEditingController();
    super.initState();
  }

  void changedIsLoging() {
    setState(() {
      _isLoging = !_isLoging;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: _isLoging ? ProgressIndicatorView().circularProgressIndicator() : const SizedBox.shrink(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              _imgPath,
            ),
          ),
          Padding(
            padding: PaddingValues().PD_TLR_10,
            child: TextField(
                controller: _userController,
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                  labelText: _labelText,
                  prefixIcon: const Icon(Icons.person_outline),
                )),
          ),
          Padding(
            padding: PaddingValues().PD_T_10,
            child: OutlinedButton(
                onPressed: () {
                  changedIsLoging();
                  print(_userController?.text);
                  //TODO: create user login controller
                  // changedIsLoging();
                },
                child: Padding(
                  padding: PaddingValues().PD_ALL_10,
                  child: Text(
                    _buttonText,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
