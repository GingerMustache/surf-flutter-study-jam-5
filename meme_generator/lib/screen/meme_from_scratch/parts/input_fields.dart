part of "../meme_generator_screen.dart";

class InputFields extends StatefulWidget {
  const InputFields({super.key});

  @override
  InputFieldsState createState() => InputFieldsState();
}

class InputFieldsState extends State<InputFields> {
  @override
  Widget build(BuildContext context) {
    final textStore = getIt<TextStore>();
    final imageStore = getIt<ImageStore>();

    InputDecoration inputDecoration(String text) => InputDecoration(
        filled: true,
        fillColor: Colors.grey.withAlpha(30),
        hintText: text,
        hintStyle: const TextStyle(color: AppColors.mainWhite));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          style: const TextStyle(color: AppColors.mainWhite),
          onChanged: (value) => textStore.textHolderProvider.tappingText(value),
          decoration: inputDecoration(t.screen.fromScratch.typeInscription),
        ),
        Space.v10,
        TextField(
          style: const TextStyle(color: AppColors.mainWhite),
          onSubmitted: (value) {
            imageStore.imageHolderProvider.prepareToLink();
            imageStore.imageHolderProvider.inputNetworkImage(value);
          },
          decoration: inputDecoration(t.screen.fromScratch.pasteImageLink),
        ),
      ],
    );
  }
}
