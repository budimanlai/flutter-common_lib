part of 'package:common_lib/ui/ui.dart';

class PasswordField extends StatefulWidget {
  final String title;
  final bool? readOnly;
  final String? hintText;
  final String? helperText;
  final TextInputType? inputType;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final Key? fieldKey;
  final int? maxLength;
  final TextEditingController? controller;

  const PasswordField(
      {required this.title,
      this.fieldKey,
      this.readOnly,
      this.hintText,
      this.inputType,
      this.validator,
      this.onSaved,
      this.onFieldSubmitted,
      this.helperText,
      this.maxLength,
      this.controller});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.title,
          style: Style.textFormLabel(),
        ),
        TextFormField(
          controller: widget.controller,
          autocorrect: false,
          autofocus: false,
          readOnly: widget.readOnly ?? false,
          obscureText: _obscureText,
          keyboardType: widget.inputType ?? TextInputType.text,
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validator,
          decoration: InputDecoration(
              hintText: widget.hintText ?? "",
              helperText: widget.helperText,
              suffixIcon: new GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: new Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              )),
        )
      ]),
    );
  }
}
