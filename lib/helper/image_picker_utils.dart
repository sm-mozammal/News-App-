import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  ImagePickerUtils._();

  static ImagePicker pickImage = ImagePicker();

  static Future<XFile?> pickFromCamera() async {
    final XFile? file = await pickImage.pickImage(source: ImageSource.camera);
    return file;
  }

  static Future<XFile?> pickFromGallary() async {
    final XFile? file = await pickImage.pickImage(source: ImageSource.gallery);
    return file;
  }
}
