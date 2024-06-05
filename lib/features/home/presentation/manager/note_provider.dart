import 'package:notely/confiq/helpers/disposable_provider.dart';
import 'package:notely/features/home/domain/note.dart';
import 'package:notely/features/home/presentation/manager/note_state.dart';

class NoteProvider extends DisposableProvider {
  var state = NoteState();

  setTitle(title) {
    state.title = title;
    notifyListeners();
  }

  setBody(body) {
    state.body = body;
    notifyListeners();
  }

  saveNote(title, body) {
    state.allNotes.add(
      NoteModel(title: title, body: body),
    );
    notifyListeners();
  }

  deleteNote(int index) {
    state.allNotes.removeAt(index);
    notifyListeners();
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
