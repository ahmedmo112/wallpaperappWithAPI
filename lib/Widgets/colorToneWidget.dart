import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_api/views/PreviewView.dart';

class ColorTone extends StatelessWidget {
  final Color color;
  final Function onTap;

  const ColorTone({Key key, this.color, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(4)),
            height: 40,
            width: 40,
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}

class ColorsToneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: [
          ColorTone(
            onTap: () => Get.to(PreviewView(), arguments: ['', 'red']),
            color: Colors.red,
          ),
          ColorTone(
            onTap: () => Get.to(PreviewView(), arguments: ['', 'blue']),
            color: Colors.blue,
          ),
          ColorTone(
            onTap: () => Get.to(PreviewView(), arguments: ['', 'lilac']),
            color: Colors.purple,
          ),
          ColorTone(
            onTap: () => Get.to(PreviewView(), arguments: ['', 'green']),
            color: Colors.greenAccent,
          ),
          ColorTone(
            onTap: () => Get.to(PreviewView(), arguments: ['', 'black']),
            color: Colors.black,
          ),
          ColorTone(
            onTap: () => Get.to(PreviewView(), arguments: ['', 'yellow']),
            color: Colors.yellowAccent,
          ),
          ColorTone(
            onTap: () => Get.to(PreviewView(), arguments: ['', 'pink']),
            color: Colors.pink.shade400,
          ),
          ColorTone(
            onTap: () => Get.to(PreviewView(), arguments: ['', 'orange']),
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
