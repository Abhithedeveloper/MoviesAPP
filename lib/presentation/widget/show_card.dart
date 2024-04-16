import 'dart:core';

import 'package:flutter/material.dart';

class widget_container extends StatelessWidget {
  String title;
  String imageUrl;
  widget_container({
    super.key,
    required this.title,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
