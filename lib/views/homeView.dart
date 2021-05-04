import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_api/Widgets/CategoriesWidget.dart';
import 'package:wallpaper_api/Widgets/colorToneWidget.dart';
import 'package:wallpaper_api/views/imagePreview.dart';
import 'package:wallpaper_api/controller/controller.dart';
import 'package:wallpaper_api/model/imagemodel.dart';
import 'package:wallpaper_api/views/PreviewView.dart';

class HomeView extends StatelessWidget {
  TextEditingController searchBar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: TextFormField(
                    controller:searchBar ,
                    onFieldSubmitted: (value) {
                      
                      Get.to(PreviewView(), arguments: [searchBar.text, '']);
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintText: "Find Wallpaper",
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Best of the month',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 170,
                  child: FutureBuilder(
                      future: getData('', '', true),
                      builder: (context, snapshot) {
                        ImageModel img = snapshot.data;
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          ImagePreviewWidget(
                                              url: img
                                                  .hits[index].largeImageURL));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        img.hits[index].largeImageURL,
                                        fit: BoxFit.cover,
                                        height: 160,
                                        width: 120,
                                      )),
                                ),
                              );
                            },
                          );
                        } else if (snapshot.connectionState ==
                                ConnectionState.none ||
                            img == null) {
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                        height: 160,
                                        width: 120,
                                        color: Colors.grey.shade400,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ))),
                              );
                            },
                          );
                        } else {
                          return Container();
                        }
                      })),
              SizedBox(
                height: 20,
              ),
              Text(
                'The color tone',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              ColorsToneWidget(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Categories',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
             CategoriesWidget()
            ],
          ),
        ),
      ),
    );
  }
}
