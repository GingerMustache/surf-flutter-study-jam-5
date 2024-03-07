import 'package:flutter/material.dart';
import 'package:meme_generator/domain/data_providers/image_holder_provider.dart';
import 'package:meme_generator/domain/data_providers/text_holder_provider.dart';
import 'package:meme_generator/domain/entity/image_holder.dart';
import 'package:meme_generator/domain/entity/text_holder.dart';
import 'package:meme_generator/services/permission_service.dart';
import 'package:meme_generator/services/photo_service.dart';
import 'package:mobx/mobx.dart';

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
