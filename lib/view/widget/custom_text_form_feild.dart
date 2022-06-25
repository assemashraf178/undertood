import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? lableText;
  final String? initValue;
  final IconData? prefexIcon;
  final IconData? sufixIcon;
  final double? width;
  final TextInputType? keyBordType;
  final Color? color;
  final bool? readOnly;
  final bool? isPassward;

  final TextEditingController? controller;
  final Function? onTap;
  final Function? suffixOnTap;
  final Function? validation;

  final Function? onChanged;
  const CustomTextField(
      {Key? key,
      this.validation,
      this.isPassward = false,
      this.keyBordType = TextInputType.text,
      this.suffixOnTap,
      this.onTap,
      this.initValue = '',
      this.onChanged,
      this.controller,
      this.color = const Color.fromARGB(255, 246, 245, 245),
      this.lableText,
      this.prefexIcon,
      this.width = double.infinity,
      this.sufixIcon,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(
          // color: const Color.fromARGB(255, 246, 245, 245),
          color: color,
          //  border: Border.all(color: ColorsApp.primaryColor),

          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 1),
            child: TextFormField(
                // initialValue: initValue!,
                readOnly: readOnly!,
                keyboardType: keyBordType,
                controller: controller,
                validator: (value) {
                  validation;
                },
                onTap: () {
                  onTap!();
                },
                obscureText: isPassward!,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: lableText,
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIconColor: Colors.teal,
                    suffixIcon: IconButton(
                      icon: Icon(sufixIcon),
                      onPressed: () {
                        suffixOnTap!();
                      },
                    ),
                    prefixIcon: Icon(prefexIcon)))));
  }
}
