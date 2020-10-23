import 'package:flutter/material.dart';

class ListData extends StatelessWidget {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final EdgeInsets margin;

  const ListData({this.title, this.subtitle, this.image, this.margin});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(
          top: BorderSide(color: Colors.grey[200], width: 1),
          bottom: BorderSide(color: Colors.grey[300], width: 1)
        )
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(14),
            width: 50, 
            height: 50,
            decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title, 
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              ),
              SizedBox(height: 4),
              Text(
                subtitle, 
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                )
              )
            ]
          ),
        ]
      ),
    );
  }
}
