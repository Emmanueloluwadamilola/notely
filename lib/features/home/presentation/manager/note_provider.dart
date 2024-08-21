import 'dart:io';

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:notely/confiq/di/injector_container.dart';
import 'package:notely/confiq/helpers/disposable_provider.dart';
import 'package:notely/features/home/domain/model/note.dart';
import 'package:notely/features/home/presentation/manager/note_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

@lazySingleton
class NoteProvider extends DisposableProvider {
  var state = NoteState();
  final SpeechToText speechToText = SpeechToText();

  NoteProvider() {
    loadNotesHive();
    initSpeech();
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

  getImage(ImageSource source) async {
    final pickedFile = await state.picker.pickImage(source: source);
    if (pickedFile != null) {
      state.image = File(pickedFile.path);
    }
    notifyListeners();
  }

  deleteImage() {
    state.image = null;
    notifyListeners();
  }

  deleteVoiceToText() {
    state.body = '';
    notifyListeners();
  }

  readTextFromImage() async {
    state.isButtonLoading = true;
    notifyListeners();
    final inputImage = InputImage.fromFile(state.image!);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    state.body = recognizedText.text;
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        state.body = "${state.body}${line.text}\n";
      }
    }
    notifyListeners();

    textRecognizer.close();
    state.isButtonLoading = false;
    notifyListeners();
  }

  void listenForPermissions() async {
    final status = await Permission.microphone.status;
    if (status != PermissionStatus.granted) {
      requestForPermission();
    }
  }

  Future<void> requestForPermission() async {
    await Permission.microphone.request();
  }

  initSpeech() async {
    //  if (!state.speechEnabled) {
    state.speechEnabled = await speechToText.initialize();
    notifyListeners();
    //  }
  }

  startListening() async {
    state.isListening = true;
    notifyListeners();
    await speechToText.listen(
      listenOptions: SpeechListenOptions(),
      onResult: onSpeechResult,
      listenFor: const Duration(days: 1),
      localeId: "en_En",
      cancelOnError: false,
      partialResults: false,
      listenMode: ListenMode.confirmation,
    );
    print(state.isListening);
    //state.isListening = false;
    notifyListeners();
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void stopListening() async {
    await speechToText.stop();

    notifyListeners();
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  onSpeechResult(SpeechRecognitionResult result) {
    state.body = "${state.body}${result.recognizedWords} ";
    state.textController.text = state.body;

    state.isListening = false;

    notifyListeners();
  }



  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
