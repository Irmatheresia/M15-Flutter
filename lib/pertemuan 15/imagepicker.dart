import 'package:flutter/material.dart';
import 'package:flutter_application_1/pertemuan%2015/Carousel.dart';
import 'package:flutter_application_1/pertemuan%2015/button_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pertemuan%2015/pertemuan15provider.dart';

class Pertemuan15Screen extends StatefulWidget {
  const Pertemuan15Screen({Key? key});

  @override
  State<Pertemuan15Screen> createState() => _Pertemuan15ScreenState();
}

class _Pertemuan15ScreenState extends State<Pertemuan15Screen> {
  List<String>? listImgPaths;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan15Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertemuan 15'),
      ),
      body: ListView(
        children: [
          if (prov.isImageLoaded) Image.network(prov.imgUrl!) else Container(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ButtonImagePicker(
                          isGallery: true, title: 'Open Camera'),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child:
                          ButtonImagePicker(isGallery: false, title: 'Camera'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Center(
                  child: TextButton(
                    onPressed: () async {
                      var pilihGambar = ImagePicker();
                      var hasil = await pilihGambar.pickMultiImage();
                      if (hasil == null) {
                        print('Tidak ada foto');
                      } else {
                        setState(() {
                          listImgPaths = hasil.map((e) => e.path).toList();
                        });
                      }
                    },
                    child: Text('Multi Image'),
                  ),
                ),
                SizedBox(height: 16.0),
                if (listImgPaths != null)
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 4,
                      children: listImgPaths!.map((path) {
                        return Image.network(path);
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
          const CarouselSliderWidget(),
        ],
      ),
    );
  }
}
