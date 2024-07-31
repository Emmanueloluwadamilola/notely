import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';
import 'package:notely/app/style/app_color.dart';
import 'package:notely/app/style/app_fonts.dart';
import 'package:notely/app/views/widgets/tool_bar.dart';
import 'package:notely/features/home/presentation/manager/note_provider.dart';
import 'package:notely/features/home/presentation/pages/add_note.dart';
import 'package:notely/features/home/presentation/pages/widgets/dialog_box.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceToTextScreen extends StatefulWidget {
  static const id = 'voiceToText';
  const VoiceToTextScreen({super.key});

  @override
  State<VoiceToTextScreen> createState() => _VoiceToTextScreenState();
}

class _VoiceToTextScreenState extends State<VoiceToTextScreen> {
  NoteProvider? _provider;

  @override
  void initState() {
    super.initState();
    _provider?.listenForPermissions();
    if (_provider?.state.speechEnabled == false) {
      _provider?.initSpeech();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (__, provider, _) {
      _provider ??= provider;
      final state = provider.state;
      return Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: Column(
            children: [
              ToolBarWidget(
                title: 'Voice to Text',
                isIcon: true,
                prefixicon: Icons.arrow_back_ios_new_outlined,
                prefixOnPress: () {
                  state.body.isNotEmpty
                      ? showDialog(
                          context: context,
                          builder: (context) {
                            return DeleteDialog(
                              delete: () {
                                provider.deleteVoiceToText();
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              title:
                                  'This action will make you loose your file',
                              actionText: 'Continue',
                            );
                          })
                      : Navigator.pop(context);
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  //reverse: true,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyText(
                            title: state.body,
                            fontSize: 18,
                            fontColor: AppColor.textColor,
                            fontFamily: Fonts.nunitoRegular,
                            textAlign: TextAlign.start)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AvatarGlow(
              animate: state.isListening,
              glowColor: AppColor.buttonColor.withOpacity(0.2),
              // glowBorderRadius: BorderRadius.circular(radius),
              child: FloatingActionButton.large(
                shape: const CircleBorder(),
                backgroundColor: AppColor.buttonColor,
                child: Icon(
                  provider.speechToText.isNotListening
                      ? Icons.mic_off_outlined
                      : Icons.mic,
                  color: AppColor.buttonTextColor,
                ),
                onPressed: () {
                  provider.speechToText.isNotListening
                      ? provider.startListening()
                      : provider.stopListening();
                },
              ),
            ),
            //const Gap(20),
            state.body.isEmpty
                ? const Gap(0)
                : Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: InkWell(
                      onTap: () {
                        const args = AddNoteScreen(
                          isUpdate: false,
                        );
                        Navigator.pushNamed(context, AddNoteScreen.id,
                            arguments: args);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Proceed',
                            style: TextStyle(
                                fontFamily: Fonts.nunitoExtraBold,
                                color: AppColor.buttonColor,
                                fontSize: 20),
                          ),
                          const Gap(5),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColor.buttonColor,
                          )
                        ],
                      ),
                    ),
                  ),
            const Gap(10),
            // FloatingActionButton.extended(
            //     backgroundColor: AppColor.buttonColor,
            //     heroTag: 'proceed',
            //     onPressed: () {},
            //     label: const Text(
            //       'Procced',
            //       style: TextStyle(
            //         fontFamily: Fonts.nunitoExtraBold,
            //         color: AppColor.buttonTextColor,
            //       ),
            //     ))
          ],
        ),
      );
    });
  }
}
