import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadResume(String uid, PlatformFile file) async {
    try {
      final ref = _storage.ref('resumes/$uid/${file.name}');
      
      if (file.bytes != null) {
        await ref.putData(file.bytes!);
      } else {
        await ref.putFile(File(file.path!));
      }
      
      return await ref.getDownloadURL();
    } catch (e) {
      throw 'Failed to upload resume: $e';
    }
  }
}
