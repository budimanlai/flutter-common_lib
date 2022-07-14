part of 'package:common_lib/ui/ui.dart';

// ignore: must_be_immutable
class DateField extends StatefulWidget {
  final String title;
  final String? hintText;
  final String? helperText;
  final String? dateFormat;
  final TextInputType? inputType;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final Key? fieldKey;
  TextEditingController? controller;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  DateField(
      {required this.title,
      this.fieldKey,
      this.hintText,
      this.inputType,
      this.validator,
      this.onSaved,
      this.onFieldSubmitted,
      this.helperText,
      this.controller,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.dateFormat = "yyyy-MM-dd"});

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime? _currentValue;

  @override
  void initState() {
    _currentValue = widget.initialDate;

    if (widget.controller == null) {
      widget.controller = TextEditingController();
    }
    super.initState();
  }

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
          readOnly: true,
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validator,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: _currentValue ?? DateTime.now(),
                firstDate: widget.firstDate ??
                    DateTime(
                        1970), //DateTime.now() - not to allow to choose before today.
                lastDate: widget.lastDate ?? DateTime(2101));

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat(widget.dateFormat).format(pickedDate);

              if (widget.controller != null) {
                setState(() {
                  _currentValue = pickedDate;
                  widget.controller!.text = formattedDate;
                });
              }
            } else {
              print("Date is not selected");
            }
          },
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.calendar_month_outlined),
              hintText: widget.hintText ?? "",
              helperText: widget.helperText),
        )
      ]),
    );
  }
}
