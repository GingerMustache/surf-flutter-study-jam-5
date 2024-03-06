import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meme_generator/i18n/strings.g.dart';
import 'package:meme_generator/routers/routes.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/screen/widgets/shared_content.dart';
import 'package:meme_generator/theme/colors.dart';

part 'parts/tapping_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            t.screen.home.HowToCreateMeme,
            style: const TextStyle(
              color: AppColors.mainWhite,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: gradientDecoration(),
          child: SafeArea(
            child: Padding(
              padding: mainPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TappingContainer(
                    borderColor: AppColors.mainGreen,
                    text: t.screen.home.fromScratch,
                    onTap: () =>
                        context.pushNamed(mainRoutesName(MainRoutes.createNew)),
                  ),
                  Space.v5,
                  Center(
                    child: Text(
                      t.screen.home.tapToFighter,
                      style: const TextStyle(color: AppColors.mainWhite),
                    ),
                  ),
                  Space.v5,
                  TappingContainer(
                    borderColor: AppColors.mainBlue,
                    text: t.screen.home.useSamples,
                    onTap: () => context
                        .pushNamed(mainRoutesName(MainRoutes.chooseSample)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
