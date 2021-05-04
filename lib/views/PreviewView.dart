import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_api/views/imagePreview.dart';
import 'package:wallpaper_api/controller/controller.dart';
import 'package:wallpaper_api/model/imagemodel.dart';

class PreviewView extends StatefulWidget {
  @override
  _PreviewViewState createState() => _PreviewViewState();
}

class _PreviewViewState extends State<PreviewView> {
  var data = Get.arguments;
  String get query => data[0];
  String get color => data[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
                          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    query,
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    " 20 photo available",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400 , color: Colors.grey),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                 FutureBuilder(
                        future: getData(query, color,false),
                        builder: (context, snapshot) {
                          ImageModel img = snapshot.data;
                          if (snapshot.connectionState == ConnectionState.none ||
                              img == null) {
                            return GridView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount:6,

                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                                childAspectRatio: (110 / 150),
                                
                              ),
                              itemBuilder: (context, index) {
                                
                                return 
                                        ClipRRect(
                                         
                                          borderRadius: BorderRadius.circular(10),
                                          child:Container(color: Colors.grey,child: Center(child: CircularProgressIndicator(),))
                                          
                                     );
                              },
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return GridView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: img.hits.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                                childAspectRatio: (110 / 150),
                              ),
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
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          img.hits[index].largeImageURL,
                                          fit: BoxFit.cover,
                                        )));
                              },
                            );
                          }else {
                          return Container();
                        }
                        }),
                   
                ],
              ),
            ),
          
        ),
      ),
    );
  }
}
