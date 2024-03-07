import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class PhotoService {
  Future<String> getImageGallery();
}

class PhotoServiceDefault implements PhotoService {
  @override
  Future<String> getImageGallery() async {
    if (await Permission.camera.request().isGranted) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image?.path == null) return '';

      return image!.path;
    }

    return '';
  }
}
