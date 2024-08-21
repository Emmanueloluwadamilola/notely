import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';
import 'package:notely/app/views/widgets/tool_bar.dart';
import 'package:notely/features/home/domain/model/note.dart';
import 'package:notely/features/home/presentation/manager/note_provider.dart';
import 'package:notely/features/home/presentation/pages/all_note.dart';
import 'package:notely/features/home/presentation/pages/home_screen.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  static const String id = 'add-note';
  const AddNoteScreen(
      {super.key,
      this.isUpdate = false,
      this.index,
      this.note,
      this.imageText,
      this.isImageToText = false});
  final int? index;
  final bool isUpdate;
  final List<NoteModel>? note;
  final bool? isImageToText;
  final String? imageText;

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  NoteProvider? _noteProvider;
  late TextEditingController titleController = TextEditingController(
      text: widget.isUpdate == true ? widget.note![widget.index!].title : '');
  late TextEditingController bodyController = TextEditingController(
      text: widget.isUpdate == true
          ? widget.note![widget.index!].body
          : _noteProvider?.state.body);
  FocusNode titleNode = FocusNode();
  FocusNode bodyNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      titleController.addListener(() {
        _noteProvider?.setTitle(titleController.text);
      });
      bodyController.addListener(() {
        _noteProvider?.setBody(bodyController.text);
      });

      _noteProvider?.listen((event) {
        if (event is NoteModel) {
          Navigator.pop(context);
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, provider, _) {
      _noteProvider ??= provider;
      final state = provider.state;
      return Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(10),
                ToolBarWidget(
                    title: widget.isUpdate
                        ? AppStrings.updateNote
                        : AppStrings.writeNote,
                    suffixIcon: Icons.share,
                    prefixicon: Icons.arrow_back_ios_new_outlined,
                    prefixOnPress: () {
                      Navigator.pop(context);
                    },
                    suffixOnPress: () {
                      PopupMenuButton(
                          itemBuilder: (context) =>
                              [PopupMenuItem(child: Text('Share'))]);
                    },
                    isIcon: true),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 15, right: 20, left: 20, top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          controller: titleController,
                          focusNode: titleNode,
                          cursorColor: AppColor.buttonColor,
                          decoration: const InputDecoration(
                              hintText: 'Enter title',
                              hintStyle:
                                  TextStyle(color: AppColor.hintTextColor),
                              border: InputBorder.none),
                          style: const TextStyle(
                              fontFamily: Fonts.nunitoBlack,
                              fontSize: 24,
                              color: AppColor.titleColor),
                          onChanged: (value) {
                            setState(() {
                              titleController.text = value;
                            });
                          },
                        ),
                        TextField(
                          controller: bodyController,
                          focusNode: bodyNode,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          cursorColor: AppColor.buttonColor,
                          decoration: const InputDecoration(
                              hintStyle:
                                  TextStyle(color: AppColor.hintTextColor),
                              hintText: 'Type here',
                              border: InputBorder.none),
                          style: const TextStyle(
                              fontFamily: Fonts.nunitoBold,
                              fontSize: 18,
                              color: AppColor.textColor),
                          onChanged: (value) {
                            setState(() {
                              bodyController.text = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton:
            titleController.text.isNotEmpty && bodyController.text.isNotEmpty
                ? FloatingActionButton.extended(
                    backgroundColor: AppColor.buttonColor,
                    onPressed: () {
                      widget.isUpdate
                          ? provider.updateNote(widget.index,
                              titleController.text, bodyController.text)
                          : provider.saveNote(state.title, state.body);
                      titleController.clear();
                      bodyController.clear();
                      state.image != null ? provider.deleteImage() : null;
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                    label: Text(
                      widget.isUpdate ? 'Update Note' : 'Save Note',
                      style: const TextStyle(
                        fontFamily: Fonts.nunitoExtraBold,
                        color: AppColor.buttonTextColor,
                      ),
                    ),
                  )
                : null,
      );
    });
  }
}
