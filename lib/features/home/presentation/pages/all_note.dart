import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';
import 'package:notely/app/views/widgets/tool_bar.dart';
import 'package:notely/features/home/presentation/manager/note_provider.dart';
import 'package:notely/features/home/presentation/pages/add_note.dart';
import 'package:provider/provider.dart';

class AllNoteScreen extends StatefulWidget {
  static const String id = 'all-Note';
  const AllNoteScreen({
    super.key, //required this.fab
  });
  //final FloatingActionButton fab;

  @override
  State<AllNoteScreen> createState() => _AllNoteScreenState();
}

class _AllNoteScreenState extends State<AllNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (BuildContext context, provider, _) {
        final state = provider.state;

        return Scaffold(
            backgroundColor: AppColor.background,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                              itemBuilder: (context, index) => GestureDetector(
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColor.cardColor,
                                    borderRadius: BorderRadius.circular(12),
                                    // border: Border.all(
                                    //   color: AppColor.textColor,
                                    // ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BodyText(
                                        title: state.allNotes[index].title,
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
                ? FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddNoteScreen.id);
                    },
                    backgroundColor: AppColor.buttonColor,
                    child: const Icon(
                      Icons.add,
                      color: AppColor.buttonTextColor,
                    ),
                  )
                : null);
      },
    );
  }
}
