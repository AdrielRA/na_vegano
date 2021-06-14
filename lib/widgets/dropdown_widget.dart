import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final String text, error;
  final TextEditingController controller;
  final List<String> options;

  Dropdown({Key key, this.text, this.error, this.options, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: DropdownButtonFormField(
        iconEnabledColor: Theme.of(context).primaryColor,
        items: options.map((String category) {
          return new DropdownMenuItem(
              value: category,
              child: Row(
                children: <Widget>[
                  Text(
                    category,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ));
        }).toList(),
        onChanged: (newValue) {
          // do other stuff with _category
          controller.text = newValue;
        },
        value: controller.text == '' ? options[0] : controller.text,
        decoration: InputDecoration(
          labelText: text,
          errorText: error,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
