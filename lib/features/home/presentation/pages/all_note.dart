import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:notely/app/app.dart';
import 'package:notely/app/views/widgets/loading_widget.dart';
import 'package:notely/app/views/widgets/tool_bar.dart';
import 'package:notely/features/home/presentation/manager/note_provider.dart';
import 'package:notely/features/home/presentation/pages/add_note.dart';
import 'package:notely/features/home/presentation/pages/widgets/dialog_box.dart';
import 'package:provider/provider.dart';

class AllNoteScreen extends StatefulWidget {
  static const String id = 'all-Note';
  const AllNoteScreen({
    super.key,
  });

  @override
  State<AllNoteScreen> createState() => _AllNoteScreenState();
}

class _AllNoteScreenState extends State<AllNoteScreen> {
  NoteProvider? _noteProvider;

  @override
  void initState() {
    //_noteProvider?.loadNotesHive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (BuildContext context, provider, _) {
        final state = provider.state;

        return Scaffold(
            backgroundColor: AppColor.background,
            body: SafeArea(
              child: state.isLoading
                  ? LoadingWidget.loadingDiad(context)
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ToolBarWidget(
                              title: state.allNotes.isEmpty
                                  ? AppStrings.allNotes
                                  : AppStrings.recent,
                              prefixImageIcon: const AssetImage(AppIcon.menu),
                              suffixIcon: Icons.search_outlined,
                              prefixOnPress: () {},
                              suffixOnPress: () {},
                              isIcon: false,
                            ),
                            state.allNotes.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Gap(120),
                                      Image.asset(
                                        ImageAsset.firstNote,
                                        height: 200,
                                      ),
                                      const Gap(20),
                                      const BodyText(
                                        title: AppStrings.createNoteMain,
                                        fontSize: 20,
                                        fontColor: AppColor.titleColor,
                                        fontFamily: Fonts.nunitoBlack,
                                        textAlign: TextAlign.center,
                                      ),
                                      const Gap(10),
                                      const BodyText(
                                        title: AppStrings.createNoteText,
                                        fontSize: 16,
                                        fontColor: AppColor.textColor,
                                        fontFamily: Fonts.nunitoBold,
                                        textAlign: TextAlign.center,
                                      ),
                                      const Gap(60),
                                      MainButton(
                                        buttonText: AppStrings.createNoteButton,
                                        disabled: false,
                                        loading: state.isButtonLoading,
                                        callback: () {
                                          Navigator.pushNamed(
                                              context, AddNoteScreen.id);
                                        },
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const BodyText(
                                          title: AppStrings.import,
                                          fontSize: 16,
                                          fontColor: AppColor.buttonColor,
                                          fontFamily: Fonts.nunitoExtraBold,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  )
                                : MasonryGridView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    gridDelegate:
                                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemCount: state.allNotes.length,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        final args = AddNoteScreen(
                                          isUpdate: true,
                                          note: state.allNotes,
                                          index: index,
                                        );
                                        Navigator.pushNamed(
                                            context, AddNoteScreen.id,
                                            arguments: args);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: AppColor.cardColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            BodyText(
                                              title:
                                                  state.allNotes[index].title,
                                              fontSize: 16,
                                              fontColor: AppColor.titleColor,
                                              fontFamily: Fonts.nunitoBlack,
                                              textAlign: TextAlign.start,
                                            ),
                                            const Gap(5),
                                            BodyText(
                                              title: state.allNotes[index].body,
                                              fontSize: 14,
                                              fontColor: AppColor.textColor,
                                              fontFamily: Fonts.nunitoBold,
                                              textAlign: TextAlign.start,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return DeleteDialog(
                                                            delete: () {
                                                              provider
                                                                  .deleteNote(
                                                                      index);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          );
                                                        });
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: AppColor.titleColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
            ),
            floatingActionButton: state.allNotes.isNotEmpty
                ? DraggableFab(
                    child: SpeedDial(
                      activeBackgroundColor: AppColor.buttonColor,
                      backgroundColor: AppColor.buttonColor,
                      foregroundColor: AppColor.cardColor,
                      activeForegroundColor: AppColor.cardColor,
                      icon: Icons.add,
                      activeIcon: Icons.close,
                      curve: Curves.bounceInOut,
                      spaceBetweenChildren: 12,
                      children: [
                        SpeedDialChild(
                            backgroundColor: Colors.blue,
                            child: const Icon(
                              Icons.edit,
                              color: AppColor.cardColor,
                            ),
                            label: 'Text',
                            labelBackgroundColor: AppColor.background,
                            onTap: () {
                              const args = AddNoteScreen(
                                isUpdate: false,
                              );
                              Navigator.pushNamed(context, AddNoteScreen.id,
                                  arguments: args);
                            }),
                        SpeedDialChild(
                          backgroundColor: Colors.green,
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: AppColor.cardColor,
                          ),
                          label: 'Picture to Text',
                          labelBackgroundColor: AppColor.background,
                        ),
                        SpeedDialChild(
                          backgroundColor: Colors.purple,
                          child: const Icon(
                            Icons.record_voice_over_outlined,
                            color: AppColor.cardColor,
                          ),
                          label: 'Voice to Text',
                          labelBackgroundColor: AppColor.background,
                        )
                      ],
                    ),
                  )
                : null);
      },
    );
  }
}
