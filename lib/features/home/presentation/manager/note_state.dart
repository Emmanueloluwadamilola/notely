import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notely/features/home/domain/note.dart';

class NoteState {
  List<NoteModel> allNotes = [];
  bool isLoading = false;
  bool isButtonLoading = false;
  String title = '';
  String body = '';
  File? image;
  final picker = ImagePicker();
  bool speechEnabled = false;
 // String voiceText = '';
  final TextEditingController textController = TextEditingController();
  bool isListening = false;
}
