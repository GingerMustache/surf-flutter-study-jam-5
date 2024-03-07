part of "../meme_generator_screen.dart";

class _ScaleButtons extends StatelessWidget {
  const _ScaleButtons();

  @override
  Widget build(BuildContext context) {
    final memeFromScratchStore = getIt<MemeFromScratchStore>();

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: scaleButtonDecoration,
              onPressed: () =>
                  memeFromScratchStore.fontFlag != ScaleAbility.down
                      ? memeFromScratchStore.textScaleUp()
                      : {},
              child: Text(t.screen.fromScratch.textScaleDown)),
          Space.h10,
          ElevatedButton(
            style: scaleButtonDecoration,
            onPressed: () => memeFromScratchStore.fontFlag != ScaleAbility.up
                ? memeFromScratchStore.textScaleDown()
                : {},
            child: Text(t.screen.fromScratch.textScaleDown),
          ),
        ],
      ),
    );
  }
}
