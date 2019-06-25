import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/user.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextContriller = TextEditingController();

  Widget _buildEmailTextFormField() {
    return TextFormField(
      controller: _emailTextController,
      decoration: InputDecoration(
          labelText: 'Email',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordTextFormField() {
    return TextFormField(
      controller: _passwordTextContriller,
      decoration: InputDecoration(
          labelText: 'Password',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
  }

  Widget _buildLoginButton(
      BuildContext context, Function logIn, Function emailValidation) {
    return Container(
      height: 40.0,
      child: FlatButton(
          child: Text('LOGIN',
              style: TextStyle(color: Theme.of(context).primaryColor)),
          onPressed: () async {
            if (await emailValidation(_emailTextController.text) == false) {
              return;
            }
            _submitLogin(logIn);
          }),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.0)),
    );
  }

  void _submitLogin(Function logIn) async {
    if (await logIn(_emailTextController.text, _passwordTextContriller.text)) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print('falsee');
    }
  }


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (BuildContext context, Widget child, UserModel model) {
      return Scaffold(
          appBar: AppBar(
            title: Text('LOGIN'),
            elevation: 0,
          ),
          body: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  _buildEmailTextFormField(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildPasswordTextFormField(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildLoginButton(
                      context, model.logIn, model.emailValidation),
                  FlatButton(
                    child: Text('SignUp'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  )
                ],
              ),
            ),
          ));
    });
  }
}
