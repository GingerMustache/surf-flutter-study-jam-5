part of "../meme_generator_screen.dart";

class _MemePlaceHolder extends StatelessWidget {
  const _MemePlaceHolder();

  @override
  Widget build(BuildContext context) {
    final memeFromScratchStore = getIt<MemeFromScratchStore>();

    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );

    return ColoredBox(
      color: Colors.black,
      child: DecoratedBox(
        decoration: decoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: DecoratedBox(
                  decoration: decoration,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RepaintBoundary(
                      child: Observer(
                        builder: (_) => memeFromScratchStore.inputWay ==
                                InputWay.byLink
                            ? memeFromScratchStore.imageLink == ''
                                ? const _StockMemeImage()
                                : CachedNetworkImage(
                                    imageUrl: memeFromScratchStore.imageLink,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                            : memeFromScratchStore.imageLink == ''
                                ? const _StockMemeImage()
                                : Image(
                                    image: FileImage(
                                      File(memeFromScratchStore.imageLink),
                                    ),
                                  ),
                      ),
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (_) => Text(
                  memeFromScratchStore.inputText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Impact',
                    fontSize: memeFromScratchStore.fontSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StockMemeImage extends StatelessWidget {
  const _StockMemeImage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        t.screen.fromScratch.memePicture,
        style: const TextStyle(
          fontSize: 20,
          color: AppColors.mainWhite,
        ),
      ),
    );
  }
}
