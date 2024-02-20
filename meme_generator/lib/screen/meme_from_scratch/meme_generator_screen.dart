import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/screen/widgets/shared_content.dart';
import 'package:meme_generator/stores/text_and_image_handler.dart';
import 'package:meme_generator/theme/colors.dart';

part 'parts/auto_display_input_field.dart';
part 'parts/meme_place_holder.dart';
part 'parts/scale_buttons.dart';

class MemeGeneratorScreen extends StatelessWidget {
  const MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.mainWhite,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Meme From Scratch',
          style: TextStyle(
            color: AppColors.mainWhite,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: gradientDecoration(),
        child: const SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: mainPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MemePlaceHolder(),
                  Space.v10,
                  AutoDisplayInputField(),
                  Space.v10,
                  _ScaleButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
