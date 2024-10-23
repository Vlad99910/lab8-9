import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';

  // Валідація email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Будь ласка, введіть логін';
    }
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    if (!RegExp(pattern).hasMatch(value)) {
      return 'Введіть правильний email';
    }
    return null;
  }

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле обов\'язкове';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введіть пароль';
    }
    if (value.length < 7) {
      return 'Пароль має містити не менше 7 символів';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Реєстрація'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Ім\'я користувача'),
                validator: _validateField,
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Пароль'),
                obscureText: true,
                validator: _validatePassword,
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Логіка реєстрації
                  }
                },
                child: Text('Зареєструватися'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);  // Повернутися на екран авторизації
                },
                child: Text('Назад до авторизації'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
