import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_api/views/PreviewView.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: (160 / 100),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        Categories(
            text: 'Nature',
            onTap: () => Get.to(PreviewView(), arguments: ['Nature', '']),
            imgURL:
                'https://thumbs.dreamstime.com/z/imge-mint-image-green-leaves-79844312.jpg'),
        Categories(
            onTap: () => Get.to(PreviewView(), arguments: ['Cars', '']),
            text: 'Cars',
            imgURL:
                'https://cdn.pixabay.com/photo/2016/11/22/23/44/porsche-1851246__340.jpg'),
        Categories(
            onTap: () => Get.to(PreviewView(), arguments: ['Food', '']),
            text: 'Food',
            imgURL:
                'https://cdn.pixabay.com/photo/2010/12/13/10/05/berries-2277_960_720.jpg'),
        Categories(
            onTap: () => Get.to(PreviewView(), arguments: ['Backgrounds', '']),
            text: 'Backgrounds',
            imgURL:
                'https://cdn.pixabay.com/photo/2016/11/29/05/45/astronomy-1867616__340.jpg'),
        Categories(
            onTap: () => Get.to(PreviewView(), arguments: [' Travel', '']),
            text: 'Travel',
            imgURL:
                'https://cdn.pixabay.com/photo/2018/07/14/15/27/cafe-3537801__340.jpg'),
        Categories(
            onTap: () => Get.to(PreviewView(), arguments: ['Computer', '']),
            text: 'Computer',
            imgURL:
                'https://cdn.pixabay.com/photo/2016/06/25/12/52/laptop-1478822__340.jpg')
      ],
    );
  }
}






class Categories extends StatelessWidget {
  const Categories(
      {Key key, @required this.text, @required this.imgURL, this.onTap})
      : super(key: key);
  final String text;
  final String imgURL;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                imgURL,
              ),
              fit: BoxFit.cover),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
