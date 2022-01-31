import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String errorText;
  final bool isObscure;
  final bool isIcon;
  final bool enabled;
  final TextInputType inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode focusNode;
  final ValueChanged onFieldSubmitted;
  final ValueChanged onChanged;
  final Function onEditingComplete;
  final bool autoFocus;
  final TextInputAction inputAction;
  final bool isValid;
  final String suffixIcon;
  final VoidCallback onSuffixPress;
  final InputBorder inputBorder;
  final String Function(String v) validator;

  const TextFieldWidget(
      {Key key,
      this.icon,
      this.hint,
      this.errorText,
      this.isObscure = false,
      this.inputType,
      this.textController,
      this.isIcon = true,
      this.enabled,
      this.padding = const EdgeInsets.all(0),
      this.hintColor = Colors.grey,
      this.iconColor = Colors.grey,
      this.focusNode,
      this.onFieldSubmitted,
      this.onChanged,
      this.autoFocus = false,
      this.inputAction,
      this.onEditingComplete,
      this.isValid = false,
      this.suffixIcon,
      this.onSuffixPress,
      this.inputBorder,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: TextFormField(
            enabled: enabled,
            controller: textController,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            autofocus: autoFocus,
            textInputAction: inputAction,
            obscureText: isObscure,
            keyboardType: inputType,
            style: Theme.of(context).textTheme.bodyText2,
            validator: validator,
            onEditingComplete: onEditingComplete,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              border: inputBorder,
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: hintColor,
                    //fontWeight: FontWeight.w100,
                  ),
              errorText: errorText,
              counterText: '',
            )));
  }
}
