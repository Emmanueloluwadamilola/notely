import 'package:notely/features/home/domain/note.dart';

class NoteState {
  List<NoteModel> allNotes = [];
  bool isLoading = false;
  bool isButtonLoading = false;
  String title = '';
  String body = '';
}
