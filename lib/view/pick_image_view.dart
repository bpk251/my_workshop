import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageView extends StatefulWidget {
  const PickImageView({Key? key}) : super(key: key);

  @override
  State<PickImageView> createState() => _PickImageViewState();
}

class _PickImageViewState extends State<PickImageView> {
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await picker.pickImage(source: ImageSource.gallery).then(
                    (value) => {print(value)},
                  );
            },
            child: Text(
              "Gallery",
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await picker.pickImage(source: ImageSource.camera).then(
                    (value) => {print(value)},
                  );
            },
            child: Text(
              "Camera",
            ),
          ),
        ],
      ),
    );
  }
}
