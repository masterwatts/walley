import 'package:audioplayers/audioplayers.dart';

class SoundUtil {
  static AudioPlayer player = AudioPlayer();
  static void playTransactionComplete() {
    player.play(AssetSource("sounds/transaction_success.mp3"));
  }
}
