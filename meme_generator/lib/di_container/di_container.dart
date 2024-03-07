import 'package:flutter/material.dart';
import 'package:meme_generator/domain/data_providers/image_holder_provider.dart';
import 'package:meme_generator/domain/data_providers/text_holder_provider.dart';
import 'package:meme_generator/domain/entity/image_holder.dart';
import 'package:meme_generator/domain/entity/text_holder.dart';
import 'package:meme_generator/routers/routes.dart';
import 'package:meme_generator/screen/widgets/app/my_app.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/stores/text_and_image_handler.dart';
import 'package:meme_generator/stores/text_store.dart';

abstract class DiContainerProvider {
  Widget makeApp();
  ImageHolder makeImageHolder();
  ImageHolderProvider makeImageHolderProvider();
  TextHolder makeTextHolder();
  TextHolderProvider makeTextHolderProvider();
}

class DiContainer implements DiContainerProvider {
  final MainNavigation _mainNavigation = MainNavigation();

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
  getIt.registerLazySingleton<TextStore>(() => TextStore(
        textHolder: diContainer.makeTextHolder(),
        textHolderProvider: diContainer.makeTextHolderProvider(),
      ));
  getIt.registerLazySingleton<ImageStore>(() => ImageStore(
        imageHolder: diContainer.makeImageHolder(),
        imageHolderProvider: diContainer.makeImageHolderProvider(),
      ));
}
