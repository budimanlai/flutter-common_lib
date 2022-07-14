part of 'package:common_lib/ui/ui.dart';

class TextField extends StatefulWidget {
  final String title;
  final bool? readOnly;
  final bool? obscureText;
  final String? hintText;
  final String? helperText;
  final TextInputType? inputType;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final Key? fieldKey;
  final int? maxLength;
  final TextEditingController? controller;
  final int? maxLines;

  const TextField(
      {required this.title,
      this.fieldKey,
      this.readOnly,
      this.obscureText,
      this.hintText,
      this.inputType,
      this.validator,
      this.onSaved,
      this.onFieldSubmitted,
      this.helperText,
      this.maxLength,
      this.controller,
      this.maxLines});

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
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
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          readOnly: widget.readOnly ?? false,
          obscureText: widget.obscureText ?? false,
          keyboardType: widget.inputType ?? TextInputType.text,
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validator,
          decoration: InputDecoration(
              hintText: widget.hintText ?? "", helperText: widget.helperText),
        )
      ]),
    );
  }
}
