import 'package:flutter/material.dart';

class CustomRadioList<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final ValueChanged<T?> onChange;

  const CustomRadioList(
      {required this.value,
      required this.groupValue,
      required this.leading,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChange(value),
      child: Container(
        height: 56,
        width: 56,
        child: _customRadioButtton,
      ),
    );
  }

  Widget get _customRadioButtton {
    final isSelected = value == groupValue;
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          color: isSelected ? Color(0xff643ff9) : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff643ff9), width: 1)),
      child: Center(
          child: Text(
        leading,
        style: TextStyle(
            color: isSelected ? Colors.white : Color(0xff643ff9),
            fontFamily: 'Kanit',
            fontSize: 18),
      )),
    );
  }
}
