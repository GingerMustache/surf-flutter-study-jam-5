import 'package:flutter/material.dart';
import 'package:meme_generator/domain/data_providers/image_holder_provider.dart';
import 'package:meme_generator/domain/data_providers/text_holder_provider.dart';
import 'package:meme_generator/domain/entity/image_holder.dart';
import 'package:meme_generator/domain/entity/text_holder.dart';
import 'package:meme_generator/routers/routes.dart';
import 'package:meme_generator/screen/meme_from_scratch/meme_from_scratch_store.dart';
import 'package:meme_generator/screen/meme_from_scratch/meme_generator_screen.dart';
import 'package:meme_generator/screen/widgets/app/my_app.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/services/permission_service.dart';
import 'package:meme_generator/services/photo_service.dart';

abstract class DiContainerProvider {
  Widget makeApp();
  ImageHolder makeImageHolder();
  ImageHolderProvider makeImageHolderProvider();
  TextHolder makeTextHolder();
  TextHolderProvider makeTextHolderProvider();
  PermissionService makePermissionService();
  PhotoService makePhotoService();
}

class DiContainer implements DiContainerProvider {
  final MainNavigation _mainNavigation = MainNavigation();

  @override
  PermissionService makePermissionService() => PermissionServiceDefault();
  @override
  PhotoService makePhotoService() => PhotoServiceDefault();
  @override
  Widget makeApp() => MyApp(navigation: _mainNavigation);
  @override
  ImageHolder makeImageHolder() => ImageHolder();
  @override
  ImageHolderProvider makeImageHolderProvider() =>
      ImageHolderProviderDefault(imageHolder: makeImageHolder());
  @override
  TextHolder makeTextHolder() => TextHolder();
  @override
  TextHolderProvider makeTextHolderProvider() => TextHolderProviderDefault(
        textHolder: makeTextHolder(),
      );

  DiContainer();
}

void initStores(DiContainerProvider diContainer) {
  getIt.registerLazySingleton<MemeFromScratchStore>(
      () => MemeFromScratchStoreDefault(
            imageHolder: diContainer.makeImageHolder(),
            textHolder: diContainer.makeTextHolder(),
            permissionService: diContainer.makePermissionService(),
            photoService: diContainer.makePhotoService(),
            imageHolderProvider: diContainer.makeImageHolderProvider(),
            textHolderProvider: diContainer.makeTextHolderProvider(),
          ));
}
