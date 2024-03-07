import 'package:flutter/material.dart';
import 'package:meme_generator/di_container/di_container.dart';
import 'package:meme_generator/i18n/strings.g.dart';

void main() async {
  final DiContainerProvider diContainer = DiContainer();
  WidgetsFlutterBinding.ensureInitialized();
  final app = diContainer.makeApp();
  initStores(diContainer);

  runApp(TranslationProvider(child: app));
}
