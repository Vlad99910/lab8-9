import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Будь ласка, введіть email';
    }
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    if (!RegExp(pattern).hasMatch(value)) {
      return 'Введіть правильний email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Відновлення паролю'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Логіка скидання паролю
                  }
                },
                child: Text('Відновити пароль'),
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
