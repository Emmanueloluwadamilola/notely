import 'package:flutter/material.dart';
import 'package:notely/features/home/presentation/manager/note_state.dart';

class NoteProvider extends ChangeNotifier {
  var state = NoteState();
}
