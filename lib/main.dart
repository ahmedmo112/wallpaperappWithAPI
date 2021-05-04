import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_api/views/imagePreview.dart';
import 'package:wallpaper_api/controller/controller.dart';
import 'package:wallpaper_api/model/imagemodel.dart';
import 'package:wallpaper_api/views/homeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // getData("car",'black');
    return GetMaterialApp(
      title: 'wallpaper',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}




// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
 
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: FutureBuilder<ImageModel>(
//         future: getData('', ''),
//         builder: (context, snapshot) {
//           ImageModel img = snapshot.data;

//           return img == null
//               ? Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                   itemCount: img.hits.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     String url = img.hits[index].largeImageURL;
//                     return GestureDetector(
                   
//                       onTap: () {
//                         showDialog(
//                             context: context,
//                             builder: (BuildContext context) => ImagePreviewWidget(url: url));
//                       },
                    

//                       child: Container(
//                         height: 100,
//                         width: 100,
//                         child: Image.network(img.hits[index].previewURL),
//                       ),
//                     );
//                   },
//                 );

         
//         },
//       ),
      
     
//     );
//   }
// }
