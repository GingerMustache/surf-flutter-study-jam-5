// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meme_generator/domain/data_providers/image_holder_provider.dart';
import 'package:meme_generator/domain/data_providers/text_holder_provider.dart';
import 'package:meme_generator/domain/entity/image_holder.dart';
import 'package:meme_generator/domain/entity/text_holder.dart';
import 'package:meme_generator/i18n/strings.g.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/screen/widgets/shared_content.dart';
import 'package:meme_generator/services/permission_service.dart';
import 'package:meme_generator/services/photo_service.dart';
import 'package:meme_generator/theme/colors.dart';
import 'package:mobx/mobx.dart';

part 'parts/input_fields.dart';
part 'parts/meme_place_holder.dart';
part 'parts/scale_buttons.dart';
part 'parts/upload_button.dart';

abstract class MemeFromScratchStore {
  ScaleAbility get fontFlag;
  String get imageLink;
  double get fontSize;
  String get inputText;
  InputWay get inputWay;

  Future<void> uploadImageFromDevice(BuildContext context);
  void tappingText(String text);
  void prepareToLink();
  void inputNetworkImage(String text);
  void textScaleUp();
  void textScaleDown();
}

class MemeFromScratchStoreDefault implements MemeFromScratchStore {
  final TextHolder textHolder;
  final TextHolderProvider textHolderProvider;
  final ImageHolder imageHolder;
  final ImageHolderProvider imageHolderProvider;
  final PermissionService permissionService;
  final PhotoService photoService;

  MemeFromScratchStoreDefault({
    required this.textHolder,
    required this.textHolderProvider,
    required this.imageHolder,
    required this.imageHolderProvider,
    required this.permissionService,
    required this.photoService,
  });

  @override
  String get imageLink => imageHolder.imageLink.value;
  @override
  InputWay get inputWay => imageHolder.inputWay.value;
  @override
  String get inputText => textHolder.inputText.value;
  @override
  double get fontSize => textHolder.fontSize.value;
  @override
  ScaleAbility get fontFlag => textHolder.fontFlag.value;

  @override
  void tappingText(String text) => textHolderProvider.tappingText(text);
  @override
  void prepareToLink() => imageHolderProvider.prepareToLink();
  @override
  void inputNetworkImage(String text) =>
      imageHolderProvider.inputNetworkImage(text);
  @override
  void textScaleUp() => textHolderProvider.textScaleUp();
  @override
  void textScaleDown() => textHolderProvider.textScaleDown();

  @override
  Future<void> uploadImageFromDevice(BuildContext context) async {
    imageHolderProvider.prepareToUpload();

    permissionService.camera(
      context,
      () async {
        String photo = await photoService.getImageGallery();
        if (photo.isNotEmpty) {
          runInAction(() => imageHolder.imageLink.value = photo);
        }
      },
    );
  }
}

class MemeGeneratorScreen extends StatelessWidget {
  const MemeGeneratorScreen({super.key});

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
        title: Text(
          t.screen.fromScratch.memeFromScratch,
          style: const TextStyle(
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
                  InputFields(),
                  Space.v10,
                  _UploadButton(),
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
