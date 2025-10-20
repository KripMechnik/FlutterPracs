import 'package:flutter/material.dart';
import '../../widgets/text_field.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          "Email: ${_emailController.text}, "
          "Пароль: ${_passwordController.text}",
        )),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Добро пожаловать!\nВойдите в аккаунт или создайте новый",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                inputType: InputFieldType.email,
                labelText:"Email:",
                hintText: "example@mail.com",
                prefIcon: const Icon(Icons.email),
                controller: _emailController,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                inputType: InputFieldType.password,
                labelText: "Пароль:",
                hintText: "Пароль не менее 6 символов",
                prefIcon: const Icon(Icons.security),
                controller: _passwordController,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                textInputAction: TextInputAction.next,
              ),
              InkWell(
                onTap: (){

                },
                child: Text(
                  "Забыли пароль?",
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submit(context),
                child: const Text("Войти"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}