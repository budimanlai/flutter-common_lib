import 'package:common_lib/ui/ui.dart' as MyUi;
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                new MyUi.TextField(title: "Username", hintText: "Lorem ipsum"),
                new MyUi.TextField(
                    title: "Email",
                    hintText: "ex: jhon@example.com",
                    inputType: TextInputType.emailAddress),
                new MyUi.PasswordField(
                    title: "Password",
                    helperText: "Panjang password minimal 6 karakter"),
              ],
            ),
          ),
        ));
  }
}
