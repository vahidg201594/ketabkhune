import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
import '../scoped-models/user.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'name': null,
    'lastName': null,
    'email': null,
    'password': null,
  };
  Widget _buildNameFormField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Require to fill the form';
        }
      },
      decoration: InputDecoration(
          labelText: 'Name',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      onSaved: (String value) {
        _formData['name'] = value;
      },
    );
  }

  Widget _buildLastNameFormField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Require to fill the form';
        }
      },
      decoration: InputDecoration(
          labelText: 'LastName',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      onSaved: (String value) {
        _formData['lastName'] = value;
      },
    );
  }

  Widget _buildEmailFormField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Require to fill the form';
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }

  Widget _buildPasswordFormField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Require to fill the form';
        }
      },
      decoration: InputDecoration(
          labelText: 'Password',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (BuildContext context, Widget child, UserModel model) {
      return Container(
        height: 40.0,
        child: FlatButton(
            child: Text('Confirm',
                style: TextStyle(color: Theme.of(context).primaryColor)),
            onPressed: () {
              if (!_formKey.currentState.validate()) {
                return;
              }
              _formKey.currentState.save();
              _confirmFormData(model.createNewUser);
            }),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.0)),
      );
    });
  }

  void _confirmFormData(Function signUp) {
    signUp(User(
      name: _formData['name'],
      lastName: _formData['lastName'],
      email: _formData['email'],
      password: _formData['password'],
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildNameFormField(),
              SizedBox(
                height: 20.0,
              ),
              _buildLastNameFormField(),
              SizedBox(
                height: 20.0,
              ),
              _buildEmailFormField(),
              SizedBox(
                height: 20.0,
              ),
              _buildPasswordFormField(),
              SizedBox(
                height: 20.0,
              ),
              _buildConfirmButton(context),
              FlatButton(
                  child: Text('alredy signedup?'),
                  onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}
