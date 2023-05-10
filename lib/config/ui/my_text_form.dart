import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:rental_vendor/auth/models/sign_up_model.dart';

class MyTextForm extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final IconData icon;
  String labelText;
  bool isPassword;
  bool isPhone;
  bool isDate;
  Function? setValue;
  MyTextForm(
      {Key? key,
      required this.controller,
      this.setValue,
      this.isDate = false,
      this.isPhone = false,
      this.isPassword = false,
      required this.onChanged,
      required this.icon,
      required this.labelText})
      : super(key: key);

  @override
  State<MyTextForm> createState() => _MyTextFormState();
}

@override
class _MyTextFormState extends State<MyTextForm> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (String value) => widget.onChanged!(value),
      onTap: widget.isDate ? () => onTapFunc(context) : () {},
      keyboardType: widget.isPhone ? TextInputType.phone : null,
      inputFormatters: widget.isPhone
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
      obscureText: widget.isPassword,
      controller: widget.controller,
      decoration: InputDecoration(
        icon: Icon(widget.icon),
        labelText: (widget.labelText),
      ),
    );
  }

  // void onTapFunc(BuildContext context) async {
  //   showDatePicker(
  //     context: context,
  //     initialDate: _selectedDate,
  //     firstDate: DateTime(1990),
  //     lastDate: DateTime(2050),
  //   );

  //   widget.labelText = _selectedDate.toString();
  //   // showDialog(
  //   //   context: context,
  //   //   builder: (context) {
  //   //     return AlertDialog(
  //   //       title: Text(widget.labelText),
  //   //       content: SizedBox(
  //   //         width: 300,
  //   //         height: 300,
  //   //         child:showDatePicker(context: context, initialDate: DateTime(1990), firstDate: DateTime(2050), lastDate: DateTime(2050))
  //   //       ),
  //   //     );
  //   //   },
  //   // );
  // }

  void onTapFunc(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1990),
      lastDate: DateTime(2050),
    );

    if (selectedDate != null) {
      final dateFormat = DateFormat("yyyy-MM-dd");
      setState(() {
        _selectedDate = selectedDate;
        widget.labelText = dateFormat.format(selectedDate);
      });
      widget.onChanged!(dateFormat.format(selectedDate));
    }
  }
}
