import 'package:flutter/material.dart';


class CardDropDownField extends StatefulWidget {
  const CardDropDownField({
    super.key,
    required this.dropDownList,
    this.labelText,
    this.hintText,
    this.leading,
    this.trailing,
    this.validator,
    this.onChange,
  });

  final String? labelText;
  final String? hintText;
  final Widget? leading;
  final Widget? trailing;
  final String? Function(dynamic)? validator;
  final Function(dynamic)? onChange;
  final List<DropdownMenuItem> dropDownList;

  @override
  State<CardDropDownField> createState() => _CardDropDownFieldState();
}

class _CardDropDownFieldState extends State<CardDropDownField> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (widget.labelText != null) ...[
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Text(
            widget.labelText!,
            style:
           TextStyle()
          ),
        ),
        Spacer(),
      ],

      DropdownButtonFormField(
        items: widget.dropDownList,
        onChanged: widget.onChange,
        isDense: true,
        // validator: widget.validator,
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(
              maxHeight: 32, maxWidth: 32, minHeight: 30, minWidth: 30),
          filled: true,
          hintText: widget.hintText ?? '',

          focusColor: Colors.grey,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          contentPadding:
          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),
      )
    ]);
  }
}
