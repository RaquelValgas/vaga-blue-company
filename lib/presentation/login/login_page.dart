import 'package:flutter/material.dart';
import 'package:vaga_blue_company/shared/design/colors/app_custom_colors.dart';
import 'package:vaga_blue_company/shared/extensions/size_extensions.dart';
import 'package:vaga_blue_company/shared/routes/app_routes.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final cpfEc = TextEditingController();
  final passwordEc = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    cpfEc.dispose();
    passwordEc.dispose();
    super.dispose();
  }

  void _formSubmit() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      Navigator.of(context).pushNamed(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('./assets/images/logo.png'),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                  key: _formKey,
                  child: Container(
                    constraints: BoxConstraints.expand(
                      height: context.screenHeight,
                      width: context.screenWidth,
                    ),
                    child: Column(children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: cpfEc,
                        validator: Validatorless.multiple([
                          Validatorless.required("CPF Obrigátorio"),
                          Validatorless.cpf("CPF inválido")
                        ]),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: context.colors.blue2),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: context.colors.blue2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: context.colors.blue2),
                          ),
                          label: const Text('CPF'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: passwordEc,
                          validator:
                              Validatorless.required("Senha Obrigatório"),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: context.colors.blue2),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.colors.blue2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.colors.blue2),
                            ),
                            label: const Text('Senha'),
                          ),
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.colors.grey,
                            ),
                            onPressed: _formSubmit,
                            child: Text(
                              'Entrar',
                              style: TextStyle(color: context.colors.blue1),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
