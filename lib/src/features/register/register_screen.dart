import 'package:flutter/material.dart';
import '../../widgets/text_field.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegisterPage(),
  ));
}

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();
  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate() && _passwordController.text == _passwordRepeatController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          "Имя: ${_nameController.text}, "
              "Email: ${_emailController.text}, "
              "Пароль: ${_passwordController.text}",
        )),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Регистрация")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                inputType: InputFieldType.name,
                labelText: "Имя:",
                hintText: "Введите ваше имя",
                prefIcon: const Icon(Icons.person),
                controller: _nameController,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                textInputAction: TextInputAction.next,
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
              const SizedBox(height: 20),
              CustomTextFormField(
                inputType: InputFieldType.password,
                labelText: "Повторите пароль",
                hintText: "Пароль не менее 6 символов",
                prefIcon: const Icon(Icons.security),
                controller: _passwordRepeatController,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submit(context),
                child: const Text("Зарегистрироваться"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}