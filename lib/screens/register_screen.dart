import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:na_vegano/models/user_model.dart';
import 'package:na_vegano/services/auth_service.dart';
import 'package:na_vegano/services/firestore_service.dart';
import 'package:na_vegano/widgets/button_widget.dart';
import 'package:na_vegano/widgets/dropdown_widget.dart';
import 'package:na_vegano/widgets/input_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passConfirmController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _numController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _ufController = TextEditingController();
  TextEditingController _cityController = TextEditingController();

  String _city = "Alfenas", _uf = "MG";
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _cityController.addListener(() {
      setState(() {
        _city = _cityController.text;
      });
    });
    _ufController.addListener(() {
      setState(() {
        _uf = _ufController.text;
      });
    });
    super.initState();
  }

  Future<void> onRegister() async {
    setState(() {
      _loading = true;
    });

    if (_formKey.currentState.validate()) {
      User authUser = await AuthService.signUp(
        email: _emailController.text,
        senha: _passwordController.text,
      );

      if (authUser != null) {
        UserModel user = UserModel(
            uid: authUser.uid,
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            street: _streetController.text,
            num: _numController.text,
            district: _districtController.text,
            uf: _uf,
            city: _city);

        await FirestoreService().saveUser(user);

        Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
      }
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image(
                  image: AssetImage('lib/assets/images/01.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          "CADASTRE-SE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Input(
                          text: "Nome",
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Nome obrigatório';
                            }
                            return null;
                          },
                        ),
                        Input(
                          text: "E-mail",
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'E-mail obrigatório';
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 20,
                              child: Input(
                                text: "Senha",
                                controller: _passwordController,
                                obscureText: true,
                                validator: (value) {
                                  if (value.trim().isEmpty)
                                    return 'Senha inválida';
                                  else if (value.length < 6)
                                    return 'Senha pequena';
                                  else
                                    return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 20,
                              child: Input(
                                text: "Confirmar senha",
                                controller: _passConfirmController,
                                obscureText: true,
                                validator: (value) {
                                  if (value != _passwordController.text) {
                                    return 'Senhas divergentes';
                                  } else
                                    return null;
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.7 - 20,
                              child: Input(
                                text: 'Rua',
                                controller: _streetController,
                                keyboardType: TextInputType.streetAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Rua obrigatória';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.3 - 20,
                              child: Input(
                                text: 'Nº',
                                controller: _numController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Informe';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                        Input(
                          text: 'Bairro',
                          controller: _districtController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Bairro obrigatório';
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.3 - 20,
                              child: Dropdown(
                                text: "UF",
                                options: ["MG"],
                                controller: _ufController,
                              ),
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.7 - 20,
                              child: Dropdown(
                                text: "Cidade",
                                options: ["Alfenas"],
                                controller: _cityController,
                              ),
                            ),
                          ],
                        ),
                        Button(
                          text: "Cadastrar",
                          loading: _loading,
                          onPress: onRegister,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
