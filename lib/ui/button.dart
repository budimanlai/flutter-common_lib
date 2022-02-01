part of 'ui.dart';

class Button {

  static ElevatedButton normal({
    required String label,
    Color? backgroundColor,
    MaterialStateProperty<OutlinedBorder?>? shape,
    Function()? onPressed,
  }) {
    return ElevatedButton(
      onPressed: () => {
        if (onPressed != null) {
          onPressed()
        }
      },
      child: Text(label),
      style: ButtonStyle(
        backgroundColor: backgroundColor != null ? MaterialStateProperty.all(backgroundColor) : MaterialStateProperty.all(ColorStyle.primaryBase),
        shape: shape
      ),
    );
  }

  static ElevatedButton rounded({
    required String label,
    Color? backgroundColor,
    Function()? onPressed,
  }) {

    return normal(
      label: label,
      backgroundColor: backgroundColor,
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: ColorStyle.primaryBase)
          )
        ),
      onPressed: onPressed,
    );
    // return ElevatedButton(
    //   onPressed: () => {
    //     if (onPressed != null) {
    //       onPressed()
    //     }
    //   },
    //   child: Text(label),
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(ColorStyle.primaryBase),
        // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //   RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(18.0),
        //     side: BorderSide(color: ColorStyle.primaryBase)
        //   )
    //     )
    //   ),
    // );
  }
}