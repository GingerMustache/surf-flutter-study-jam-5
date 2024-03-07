import 'package:mobx/mobx.dart';

enum ScaleAbility { up, down, upAndDown }

class TextHolder {
  static final TextHolder _shared = TextHolder._sharedInstance();
  TextHolder._sharedInstance();
  factory TextHolder() => _shared;

  final Observable<String> inputText = 'meme'.obs();
  final Observable<ScaleAbility> fontFlag = Observable(ScaleAbility.up);
  final Observable<double> fontSize = 25.0.obs();
}
