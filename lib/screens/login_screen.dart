import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:na_vegano/services/auth_service.dart';
import 'package:na_vegano/widgets/button_widget.dart';
import 'package:na_vegano/widgets/input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  alert(msg) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Atenção'),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                isLoading = false;
              });
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> signIn() async {
    try {
      setState(() {
        isLoading = true;
      });
      if (_formKey.currentState.validate()) {
        User user = await AuthService.signIn(
          email: _emailController.text,
          senha: _passwordController.text,
        );
        if (user != null) {
          Navigator.pushNamedAndRemoveUntil(context, '/menu', (_) => false);
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = true;
      });
      var msg = '';
      if (e.code == 'user-not-found') {
        msg = 'Usuário não encontrado';
      } else if (e.code == 'wrong-password') {
        msg = "Senha incorreta";
      } else {
        msg = "Ouve um erro inesperado, tente novamente";
      }
      alert(msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 210,
                      child:
                          Image(image: AssetImage('lib/assets/icons/logo.png')),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Na'Vegano",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Input(
                      text: 'Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Informe o e-mail';
                        }
                        return null;
                      },
                    ),
                    Input(
                      text: 'Senha',
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Informe a senha';
                        }
                        return null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Button(
                        text: "ENTRAR",
                        onPress: () => signIn(),
                        loading: isLoading,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
