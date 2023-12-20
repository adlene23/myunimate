import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import '../models/post_model.dart';

class PostService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final CollectionReference _postsCollection =
      FirebaseFirestore.instance.collection('posts');

  Future<void> addPost(
  String content,
  File? imageFile,
  List<String> tags,
  String? university,
  String? specialty,
  String? year,
) async {
  try {
    String? downloadUrl;
    if (imageFile != null) {
      // Upload image to Firebase Storage
      String fileName = basename(imageFile.path);
      Reference storageRef = _storage.ref().child('images/$fileName');
      UploadTask uploadTask = storageRef.putFile(imageFile);
      TaskSnapshot storageSnapshot =
          await uploadTask.whenComplete(() => null);
      downloadUrl = await storageSnapshot.ref.getDownloadURL();
    }
    // Store post details with image URL and additional information in Firestore
    await _postsCollection.add({
      'content': content,
      'imageUrl': downloadUrl, // Store the URL/path of the image
      'tags': tags, // Store the list of tags
      'university': university,
      'specialty': specialty,
      'year': year,
      'upvotes': 0,
      'downvotes': 0
    });
    print("post added successfully");
  } catch (e) {
    print('Error adding post: $e');
  }
}


  Future<List<PostModel>> getAllPosts() async {
    try {
      QuerySnapshot querySnapshot = await _postsCollection.get();
      List<PostModel> posts = querySnapshot.docs.map((doc) {
        return PostModel(
          content: doc['content'],
          imageUrl: doc['imageUrl'],
          tags: List<String>.from(doc['tags']),
          universityTag: doc['university'],
          specialtyTag: doc['specialty'],
          yearTag: doc['year'],
        );
      }).toList();
      return posts;
    } catch (e) {
      print('Error getting posts: $e');
      return [];
    }
  }
}
