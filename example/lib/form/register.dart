import 'package:flutter/material.dart';
import 'package:common_lib/ui/ui.dart' as MyUi;
import 'package:common_lib/extensions/string.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _handphoneController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
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
          title: Text("Register"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  new MyUi.TextField(
                    title: "Email *",
                    hintText: "ex: jhon@example.com",
                    controller: _emailController,
                    inputType: TextInputType.emailAddress,
                    helperText: "Contoh: john@example.com",
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
                  new MyUi.TextField(
                    title: "Handphone *",
                    controller: _handphoneController,
                    helperText: "Contoh: 081234567890",
                    inputType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nomor handphone tidak boleh kosong";
                      }

                      if (!value.startsWith("08")) {
                        return "Format nomor handphone harus diawali 08xxxx";
                      }

                      if (value.length < 10) {
                        return "Panjang nomor handphone minimal 10 angka";
                      }

                      if (!value.isNumeric()) {
                        return "Nomor handphone harus berupa angka";
                      }

                      return null;
                    },
                  ),
                  new MyUi.PasswordField(
                    title: "Password *",
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
                  new MyUi.PasswordField(
                    title: "Ulangi Password *",
                    controller: _rePasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ulangi password tidak boleh kosong";
                      }

                      if (_passwordController.text !=
                          _rePasswordController.text) {
                        return "Password dan ulangi password tidak sama";
                      }
                      return null;
                    },
                  ),
                  new MyUi.TextAreaField(
                    title: "Alamat",
                    controller: _alamatController,
                    maxLines: 6,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Alamat tidak boleh kosong";
                      }

                      return null;
                    },
                  ),
                  new MyUi.DateField(
                    title: "Tanggal Lahir",
                    controller: _dobController,
                    dateFormat: "dd/MMM/yyyy",
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MyUi.Button.normal(
                        label: "Register",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            var data = {
                              "email": _emailController.text,
                              "password": _passwordController.text,
                              "handphone":
                                  _handphoneController.text.normalizePhone(),
                              "repeat_password": _rePasswordController.text,
                              "alamat": _alamatController.text
                            };
                            print(data);
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Process register')),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
