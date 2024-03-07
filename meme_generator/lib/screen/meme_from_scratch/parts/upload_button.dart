part of "../meme_generator_screen.dart";

class _UploadButton extends StatelessWidget {
  const _UploadButton();

  @override
  Widget build(BuildContext context) {
    final memeFromScratchStore = getIt<MemeFromScratchStore>();

    return ElevatedButton.icon(
      label: Text(t.screen.fromScratch.uploadImage),
      icon: const Icon(Icons.photo_library_outlined),
      onPressed: () => memeFromScratchStore.uploadImageFromDevice(context),
    );
  }
}
