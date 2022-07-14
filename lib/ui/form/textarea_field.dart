part of 'package:common_lib/ui/ui.dart';

class TextAreaField extends StatefulWidget {
  final TextEditingController? controller;
  final String title;
  final String? hintText;
  final String? helperText;
  final bool? readOnly;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final Key? fieldKey;

  const TextAreaField(
      {required this.title,
      this.fieldKey,
      this.readOnly,
      this.hintText,
      this.validator,
      this.onSaved,
      this.onFieldSubmitted,
      this.helperText,
      this.controller,
      this.maxLines});

  @override
  State<TextAreaField> createState() => _TextAreaFieldState();
}

class _TextAreaFieldState extends State<TextAreaField> {
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
          maxLines: widget.maxLines,
          readOnly: widget.readOnly ?? false,
          keyboardType: TextInputType.multiline,
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validator,
          decoration: InputDecoration(
              hintText: widget.hintText, helperText: widget.helperText),
        )
      ]),
    );
  }
}