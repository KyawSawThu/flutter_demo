import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPView extends StatefulWidget {
  TextStyle? textStyle;
  final Function(String) onComplete;
  final Function(String) onChange;

  OTPView({
    super.key,
    this.textStyle,
    required this.onComplete,
    required this.onChange,
  });

  @override
  State<OTPView> createState() => OTPViewState();
}

class OTPViewState extends State<OTPView> {
  TextEditingController textEditingController = TextEditingController();

  void reset() {
    textEditingController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      obscureText: false,
      keyboardType: TextInputType.number,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      animationType: AnimationType.none,
      animationDuration: Duration.zero,
      enableActiveFill: false,
      textStyle: widget.textStyle,
      cursorColor: Colors.red,
      pinTheme: _pinTheme(),
      controller: textEditingController,
      onCompleted: (code) {
        widget.onComplete(code);
      },
      onChanged: (value) {
        widget.onChange(value);
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }

  PinTheme _pinTheme() {
    return PinTheme(
      fieldHeight: 58,
      fieldWidth: 58,
      shape: PinCodeFieldShape.circle,
      borderWidth: 0.5,
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
      selectedColor: Colors.black,
      errorBorderColor: Colors.red,
    );
  }
}