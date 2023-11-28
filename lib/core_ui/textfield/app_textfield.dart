import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/core/rx/controllers/textfield_controller.dart';
import 'package:flutter_demo/resources/app_color.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class AppTextField extends StatefulWidget {
  String placeholder;
  String? error;
  bool isEnabled;
  int? maxLength;
  TextFieldController? controller;
  Function(String)? onTextChanged;
  TextInputType keyboard;
  List<TextInputFormatter>? formatters;

  AppTextField({
    super.key,
    this.placeholder = "",
    this.error,
    this.isEnabled = true,
    this.maxLength,
    this.controller,
    this.onTextChanged,
    this.keyboard = TextInputType.text,
    this.formatters,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _showTitlePlaceholder = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _showTitlePlaceholder ? widget.placeholder : "",
                style: AppTextStyle.osL12.smokeGrey,
              ),
              Spacer(),
            ],
          ),
        ),
        _textView(),
        SizedBox(height: 6),
        Container(
          height: 0.5,
          color: widget.error == null ? AppColor.darkGrey : AppColor.lightRed,
        ),
        widget.error == null
            ? SizedBox(height: 20)
            : Container(
                height: 20,
                alignment: Alignment.bottomLeft,
                child:
                    Text(widget.error ?? "", style: AppTextStyle.osL12.darkRed),
              )
      ],
    );
  }

  Widget _textView() {
    return SizedBox(
      height: 24,
      child: TextField(
        style: AppTextStyle.osL16,
        enabled: widget.isEnabled,
        maxLength: widget.maxLength,
        onChanged: (value) {
          setState(() {
            _showTitlePlaceholder = value.isNotEmpty;
          });
          if (widget.onTextChanged != null) {
            widget.onTextChanged!(value);
          }
          widget.controller?.handleOnChange(value);
        },
        keyboardType: widget.keyboard,
        inputFormatters: widget.formatters,
        obscureText: false,
        decoration: widget._none.copyWith(
          hintText: widget.placeholder,
          hintStyle: AppTextStyle.osL16.darkBlack,
        ),
        cursorWidth: 1.5,
        cursorHeight: 20,
        cursorColor: AppColor.black,
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}

extension AppTextFieldDecoration on AppTextField {
  InputDecoration get _none => InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
      );
}
