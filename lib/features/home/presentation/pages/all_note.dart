import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';
import 'package:notely/app/views/widgets/tool_bar.dart';
import 'package:notely/features/home/presentation/manager/note_provider.dart';
import 'package:provider/provider.dart';

class AllNoteScreen extends StatefulWidget {
  const AllNoteScreen({super.key});

  @override
  State<AllNoteScreen> createState() => _AllNoteScreenState();
}

class _AllNoteScreenState extends State<AllNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (BuildContext context, provider, _) {
        final state = provider.state;
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ToolBarWidget(
                title: state.allNotes.isEmpty ? AppStrings.allNotes: AppStrings.recent,
                prefixImageIcon: const AssetImage(AppIcon.menu),
                suffixIcon: Icons.search,
                prefixOnPress: () {},
                suffixOnPress: () {},
                isIcon: false,
              ),
              state.allNotes.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          Image.asset(
                            ImageAsset.firstNote,
                            height: 220,
                          ),
                          const Gap(20),
                          const BodyText(
                            title: AppStrings.createNoteMain,
                            fontSize: 20,
                            fontColor: AppColor.titleColor,
                            fontFamily: Fonts.nunitoBlack,
                          ),
                          const Gap(10),
                          const BodyText(
                              title: AppStrings.createNoteText,
                              fontSize: 16,
                              fontColor: AppColor.textColor,
                              fontFamily: Fonts.nunitoBold),
                          const Spacer(),
                          MainButton(
                            buttonText: AppStrings.createNoteButton,
                            disabled: false,
                            loading: state.isButtonLoading,
                            callback: () {},
                          ),
                          InkWell(
                            onTap: (){},
                            child: const BodyText(
                                title: AppStrings.import,
                                fontSize: 16,
                                fontColor: AppColor.buttonColor,
                                fontFamily: Fonts.nunitoExtraBold),
                          ),
                        ],
                      ),
                    )
                  : MasonryGridView.builder(
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: state.allNotes.length,
                      itemBuilder: (context, index) => GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColor.cardColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColor.textColor,
                            ),
                          ),
                          child: Column(
                            children: [
                              BodyText(
                                  title: state.allNotes[index].title,
                                  fontSize: 16,
                                  fontColor: AppColor.titleColor,
                                  fontFamily: Fonts.nunitoBlack),
                                  const Gap(5),
                              BodyText(
                                  title: state.allNotes[index].body,
                                  fontSize: 14,
                                  fontColor: AppColor.textColor,
                                  fontFamily: Fonts.nunitoBold),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
