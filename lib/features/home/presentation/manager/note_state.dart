import 'package:flutter/material.dart';
import 'package:notely/features/home/domain/note.dart';

class NoteState {
  List<Note> allNotes = [];
  bool isLoading = false;
  bool isButtonLoading = false;
 String title = '';
  String body = '';
  
}
