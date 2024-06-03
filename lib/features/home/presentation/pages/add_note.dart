import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';
import 'package:notely/app/views/widgets/tool_bar.dart';
import 'package:notely/features/home/domain/note.dart';
import 'package:notely/features/home/presentation/manager/note_provider.dart';
import 'package:notely/features/home/presentation/pages/all_note.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  static const String id = 'add-note';
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  FocusNode titleNode = FocusNode();
  FocusNode bodyNode = FocusNode();
  NoteProvider? _noteProvider;

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
                    title: AppStrings.editNotes,
                    suffixIcon: Icons.more_vert_outlined,
                    prefixicon: Icons.arrow_back_ios_new_outlined,
                    prefixOnPress: () {
                      Navigator.pop(context);
                    },
                    suffixOnPress: () {},
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
                              hintText: 'title', border: InputBorder.none),
                          style: const TextStyle(
                              fontFamily: Fonts.nunitoBlack,
                              fontSize: 24,
                              color: AppColor.titleColor),
                        ),
                        TextField(
                          controller: bodyController,
                          focusNode: bodyNode,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          cursorColor: AppColor.buttonColor,
                          decoration: const InputDecoration(
                              hintText: 'Type here', border: InputBorder.none),
                          style: const TextStyle(
                              fontFamily: Fonts.nunitoBold,
                              fontSize: 18,
                              color: AppColor.textColor),
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
                      provider.saveNote(state.title, state.body);
                      titleController.clear();
                      bodyController.clear();
                      Navigator.pushNamed(context, AllNoteScreen.id);
                    },
                    label: const Text(
                      'Save Note',
                      style: TextStyle(
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
