part of 'ui.dart';

class Button {
  static ElevatedButton normal({
    required String label,
    Color? backgroundColor,
    Color? textColor,
    OutlinedBorder? shape,
    Function()? onPressed,
  }) {
    return ElevatedButton(
        onPressed: () => {
              if (onPressed != null) {onPressed()}
            },
        child: Text(label),
        
        style: ElevatedButton.styleFrom(
          shape: shape,
            primary: backgroundColor != null
                ? backgroundColor
                : ColorStyle.primaryBase,
            onPrimary: textColor != null ? textColor : Colors.white
              ),
        );
  }

  static ElevatedButton rounded({
    required String label,
    Color? backgroundColor,
    Color? textColor,
    Function()? onPressed,
  }) {
    return normal(
      label: label,
      textColor: textColor,
      backgroundColor: backgroundColor,
      shape: StadiumBorder(),
      onPressed: onPressed,
    );
  }

  static ElevatedButton outline({
    required String label,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    Function()? onPressed,
  }) {
    return normal(
      label: label,
      textColor: textColor,
      backgroundColor: backgroundColor != null ? backgroundColor : Colors.white,
      shape: StadiumBorder(),
      onPressed: onPressed,
    );
  }
}
