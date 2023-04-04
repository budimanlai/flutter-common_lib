part of 'ui.dart';

class Button {
  static ElevatedButton normal({
    required String label,
    Color? backgroundColor,
    Color? textColor,
    Color? disabledTextColor,
    Color? disabledBgColor,
    OutlinedBorder? shape,
    bool? disabled,
    Function()? onPressed,
  }) {
    Color? _tc = textColor;
    Color? _bc = backgroundColor;

    if (disabled != null && disabled) {
      _tc = disabledTextColor == null
          ? ColorStyle.buttonTextPrimaryDisabled
          : disabledTextColor;
      _bc = disabledBgColor == null
          ? ColorStyle.buttonBgPrimaryDisabled
          : disabledBgColor;
    }

    return ElevatedButton(
      onPressed: () => {
        if (onPressed != null) {onPressed()}
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
          foregroundColor: _tc != null ? _tc : Colors.white,
          shape: shape,
          backgroundColor: _bc != null ? _bc : ColorStyle.primaryBase),
    );
  }

  static ElevatedButton rounded({
    required String label,
    Color? backgroundColor,
    Color? textColor,
    Color? backgroundColorDisabled,
    Color? textColorDisabled,
    bool? disabled = false,
    Function()? onPressed,
  }) {
    Color? _tc = textColor == null ? ColorStyle.buttonTextPrimary : textColor;
    Color? _bc = backgroundColor == null ? ColorStyle.buttonBgPrimary : backgroundColor;

    if (disabled!) {
      _tc = textColorDisabled == null
          ? ColorStyle.buttonTextPrimaryDisabled
          : textColorDisabled;
      _bc = backgroundColorDisabled == null
          ? ColorStyle.buttonBgPrimaryDisabled
          : backgroundColorDisabled;
    }

    return ElevatedButton(
        onPressed: !disabled ? () => {
          if (onPressed != null) {onPressed()}
        } : null,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(_bc),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)))),
        child: Text(label, style: TextStyle(color: _tc)));
  }

  static ElevatedButton outline({
    required String label,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    bool? disabled,
    Function()? onPressed,
  }) {
    return normal(
      label: label,
      textColor: textColor,
      disabled: disabled,
      backgroundColor: backgroundColor != null ? backgroundColor : Colors.white,
      shape: StadiumBorder(),
      onPressed: onPressed,
    );
  }
}
