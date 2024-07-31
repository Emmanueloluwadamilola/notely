import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notely/app/app.dart';
import 'package:notely/app/views/widgets/tool_bar.dart';
import 'package:notely/features/home/presentation/manager/note_provider.dart';
import 'package:notely/features/home/presentation/pages/add_note.dart';
import 'package:notely/features/home/presentation/pages/widgets/bottom_sheet.dart';
import 'package:notely/features/home/presentation/pages/widgets/dialog_box.dart';
import 'package:provider/provider.dart';

class PickImageScreen extends StatefulWidget {
  static const id = 'pickImage';
  const PickImageScreen({super.key});

  @override
  State<PickImageScreen> createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  NoteProvider? _noteProvider;
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
                    title: AppStrings.imageText,
                    prefixicon: Icons.arrow_back_ios_new_outlined,
                    prefixOnPress: () {
                      state.image != null
                          ? showDialog(
                              context: context,
                              builder: (context) {
                                return DeleteDialog(
                                  delete: () {
                                    provider.deleteImage();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  title:
                                      'This action will make you loose the selected image',
                                  actionText: 'Continue',
                                );
                              })
                          : Navigator.pop(context);
                    },
                    isIcon: true),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          state.isButtonLoading
                              ? null
                              : showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return SingleChildScrollView(
                                      child: BottomSheetWidget(
                                        onTapCamera: () {
                                          Navigator.pop(context);
                                          provider.getImage(ImageSource.camera);
                                        },
                                        onTapGallery: () {
                                          Navigator.pop(context);
                                          provider
                                              .getImage(ImageSource.gallery);
                                        },
                                      ),
                                    );
                                  },
                                );
                        },
                        child: Container(
                          height: 400,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColor.cardColor,
                          ),
                          child: state.image == null
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 80,
                                    ),
                                    Text('Pick an Image ')
                                  ],
                                )
                              : Image.file(
                                  state.image!,
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const Gap(50),
                      MainButton(
                        buttonText: 'Convert to text',
                        disabled: state.image == null,
                        loading: state.isButtonLoading,
                        callback: () async {
                          await provider.readTextFromImage();
                          // print(state.body);
                          final args = AddNoteScreen(
                            isUpdate: false,
                          );
                          Navigator.pushNamed(context, AddNoteScreen.id,
                              arguments: args);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
