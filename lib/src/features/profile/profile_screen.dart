import 'package:flutter/material.dart';
import '../../widgets/text_field.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileScreen(),
  ));
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();
  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate() && _passwordController.text == _passwordRepeatController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          "Новый пароль: ${_passwordController.text}",
        )),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    _nameController.text = "Алексенко Дмитрий Тарасович";
    _emailController.text = "email@email.com";
    return Scaffold(
      appBar: AppBar(title: const Text("Регистрация")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Профиль",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/profile/profile.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
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
                child: const Text("Сохранить"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}