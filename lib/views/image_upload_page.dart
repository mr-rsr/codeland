import 'dart:io';

import 'package:codeland/components/custom_elevated_button.dart';
import 'package:codeland/res/colors.dart';
import 'package:codeland/res/image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadPage extends StatefulWidget {
  const ImageUploadPage({super.key});

  @override
  State<ImageUploadPage> createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker(BuildContext cxt) async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(cxt).showSnackBar(
        const SnackBar(
          content: Text("No image selected"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SizedBox.expand(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "Upload a Image",
                    style: TextStyle(
                      color: fontColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: DottedBorder(
                    dashPattern: const [8, 4],
                    color: fontColor.withOpacity(0.66),
                    child: SizedBox(
                      height: 500,
                      width: 300,
                      child: Center(
                          child: _image == null
                              ? Image.asset(imageIcon,
                                  width: 100, height: 100, fit: BoxFit.contain)
                              : Image.file(_image!)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomElevatedButton(
                        label: "Upload",
                        width: 120,
                        height: 35,
                        fontSize: 14,
                        onPressed: () => _openImagePicker(context),
                      ),
                      CustomElevatedButton(
                        label: "View",
                        width: 120,
                        height: 35,
                        fontSize: 14,
                        fontcolor: fontColor,
                        color: const Color(0xffD3D3D6),
                        onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Image Preview"),
                                content: _image == null
                                    ? const Text("No image selected")
                                    : Image.file(_image!),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Close"))
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                const SizedBox()
              ]),
        )),
      ),
    );
  }
}
