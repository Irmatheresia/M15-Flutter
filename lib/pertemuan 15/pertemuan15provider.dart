import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Pertemuan15Provider extends ChangeNotifier {
  bool _isImageLoaded = false;
  bool get isImageLoaded => _isImageLoaded;

  XFile? _img;
  XFile? get img => _img;

  set setImg(XFile? val) {
    _img = val;
    notifyListeners();
  }

  String? _imgUrl;
  String? get imgUrl => _imgUrl;

  set setImgUrl(String? val) {
    _imgUrl = val;
    notifyListeners();
  }

  final ImagePicker _imagePicker = ImagePicker();

  pickImage(bool isGallery) async {
    try {
      var res = await _imagePicker.pickImage(
        source: isGallery == true ? ImageSource.gallery : ImageSource.camera,
      );
      if (res != null) {
        setImg = res;
        setImgUrl = res.path;
        _isImageLoaded = true;
        notifyListeners();
      }
    } catch (e) {
      _isImageLoaded = false;
      print(e.toString());
    }
  }
}
