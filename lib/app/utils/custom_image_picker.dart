import 'package:flutter/material.dart';

class CustomImagePicker {
  void showImagePicker(
      BuildContext context, Function _forCamera, Function _forGallery) {
    // File _image;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            width: double.infinity,
            height: 90,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                            child: Container(
                              child: Column(
                                children: [
                                  Icon(Icons.image),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Gallery",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            onTap: _forGallery()
                            // imgFromGallery().then((value) => _image=value);
                            )),
                    Expanded(
                        child: InkWell(
                      child: Container(
                        child: Column(
                          children: [
                            Icon(Icons.camera_alt_sharp),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Camera",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      onTap: _forCamera(),
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
