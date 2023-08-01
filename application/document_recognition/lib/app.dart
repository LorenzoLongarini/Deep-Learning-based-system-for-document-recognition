import 'dart:io';

import 'package:document_recognition/classifier/classifier.dart';
import 'package:document_recognition/classifier/classifier_quant.dart';
import 'package:document_recognition/utils/labels.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

import 'custom_elements/picker_button.dart';
import 'custom_elements/text_element.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final picker = ImagePicker();
  late Classifier _classifier;
  var logger = Logger();
  String text = '';
  List<String> lines = [];
  int totalLines = 0;
  File? _image;
  Image? _imageWidget;
  img.Image? fox;
  Category? category;

  @override
  void initState() {
    super.initState();
    _classifier = ClassifierQuant();
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imageWidget = Image.file(_image!);
        _predict();
      }
    });
  }

  void _predict() async {
    img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    var pred = _classifier.predict(imageInput);

    setState(() {
      category = pred;
      text = getLabel(category!.label);
      lines = text.split("\n");
      totalLines = lines.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Document recognizer',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: _image == null
                ? const TextElement(
                    text: 'Upload an image \nto start prediction',
                  )
                : Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    padding: const EdgeInsets.all(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: _imageWidget,
                    ),
                  ),
          ),
          Column(
            children: lines.map((e) => TextElement(text: e)).toList(),
          ),
          PickerButton(
            onPressed: getImage,
          )
          // Text(
          //   category != null
          //       ? 'Confidence: ${category!.score.toStringAsFixed(3)}'
          //       : '',
          //   style: const TextStyle(fontSize: 16),
          // ),
        ],
      ),
    );
  }
}
