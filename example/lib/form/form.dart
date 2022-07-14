import 'package:common_lib/ui/ui.dart' as MyUi;
import 'package:example/form/register.dart';
import 'package:flutter/material.dart';
import 'package:common_lib/extensions/string.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _emailController =
      TextEditingController(text: "budiman.lai@gmail.com");
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  new MyUi.TextField(
                    title: "Email",
                    hintText: "ex: jhon@example.com",
                    controller: _emailController,
                    inputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong";
                      }

                      if (!value.isValidEmail()) {
                        return "Format email salah. Contoh: john@example.com";
                      }

                      return null;
                    },
                  ),
                  new MyUi.PasswordField(
                    title: "Password",
                    controller: _passwordController,
                    helperText: "Panjang password minimal 6 karakter",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password tidak boleh kosong";
                      }

                      if (value.length < 6) {
                        return "Minimal panjang password adalah 6 karakter";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MyUi.Button.normal(
                        label: "Login",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            var data = {
                              "email": _emailController.text,
                              "password": _passwordController.text
                            };
                            print(data);
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login to server')),
                            );
                          }
                        }),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MyUi.Button.rounded(
                        label: "Clear",
                        backgroundColor: Colors.red,
                        onPressed: () {
                          _emailController.clear();
                          _passwordController.clear();
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: MyUi.Button.outline(
                          label: "Register",
                          textColor: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
