// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meme_generator/domain/entity/text_holder.dart';
import 'package:mobx/mobx.dart';

abstract class TextHolderProvider {
  final TextHolder textHolder;
  TextHolderProvider({required this.textHolder});
  void tappingText(String text);
  void textScaleUp();
  void textScaleDown();
}

class TextHolderProviderDefault implements TextHolderProvider {
  @override
  final TextHolder textHolder;
  TextHolderProviderDefault({required this.textHolder});

  @override
  void tappingText(String text) =>
      runInAction(() => textHolder.inputText.value = text);

  @override
  void textScaleUp() {
    runInAction(() {
      if (textHolder.fontSize.value >= 60) {
        textHolder.fontFlag.value = ScaleAbility.down;
      }
      if (textHolder.fontFlag.value != ScaleAbility.down) {
        textHolder.fontFlag.value = ScaleAbility.upAndDown;
        textHolder.fontSize.value += 2;
      }
    });
  }

  @override
  void textScaleDown() {
    runInAction(() {
      if (textHolder.fontSize.value <= 25) {
        textHolder.fontFlag.value = ScaleAbility.up;
      }
      if (textHolder.fontFlag.value != ScaleAbility.up) {
        textHolder.fontFlag.value = ScaleAbility.upAndDown;
        textHolder.fontSize.value -= 2;
      }
    });
  }
}
