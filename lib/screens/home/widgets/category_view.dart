import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final List<String> categories = [
    'Work',
    'Studies',
    'Home',
  ];

  int _category = 0;

  void selectBackward() {
    setState(() {
      _category--;
    });
  }

  void selectFoward() {
    setState(() {
      _category++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          disabledColor: Colors.white54,
          onPressed: _category > 0
            ? selectBackward
            : null,
        ),
        Text(categories[_category].toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            letterSpacing: 2,
            fontWeight: FontWeight.w100)
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios_rounded),
          disabledColor: Colors.white54,
          onPressed: _category < categories.length - 1
            ? selectFoward
            : null, 
        ),
      ],
    );
  }
}
