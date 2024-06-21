import 'package:hive/hive.dart';
import 'package:notely/confiq/helpers/disposable_provider.dart';
import 'package:notely/features/home/domain/note.dart';
import 'package:notely/features/home/presentation/manager/note_state.dart';

class NoteProvider extends DisposableProvider {
  var state = NoteState();

  NoteProvider() {
    loadNotesHive();
  }

  setTitle(title) {
    state.title = title;
    notifyListeners();
  }

  setBody(body) {
    state.body = body;
    notifyListeners();
  }

  saveNote(title, body) async {
    final noteBox = Hive.box<NoteModel>('myBox');
    await noteBox.add(NoteModel(title: title, body: body));
    state.allNotes.add(
      NoteModel(title: title, body: body),
    );
    notifyListeners();
  }

  updateNote(index, title, body) async {
    final noteBox = Hive.box<NoteModel>('myBox');
    final updateNote = NoteModel(title: title, body: body);
    await noteBox.putAt(index, updateNote);
    state.allNotes[index] = updateNote;
    notifyListeners();
  }

  deleteNote(int index) async {
    final noteBox = Hive.box<NoteModel>('myBox');
    await noteBox.deleteAt(index);
    state.allNotes.removeAt(index);
    notifyListeners();
  }

  loadNotesHive() async {
    state.isLoading = true;
    final noteBox = Hive.box<NoteModel>('myBox');
    state.allNotes = noteBox.values.toList().cast<NoteModel>();
    state.isLoading = false;
    notifyListeners();
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
