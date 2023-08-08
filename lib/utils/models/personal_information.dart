import 'dart:convert';

import 'package:bip39/bip39.dart';
import 'package:crypto/crypto.dart';
import 'package:diacritic/diacritic.dart';
import 'package:participant_id/enums/dominant_hand.dart';
import 'package:participant_id/enums/long_finger.dart';
import 'package:participant_id/utils/extensions/string_extension.dart';
import 'package:participant_id/utils/models/participant_id.dart';

class PersonalInformation {
  String? firstWord;
  String? motherMaidenName;
  DateTime? birthDay;
  int? olderSiblings;
  LongFinger? longFinger;
  DominantHand? dominantHand;

  String concatAll() {
    return ('${removeDiacritics(firstWord ?? '').removeAllWhitespace().replaceSpecialChars()}'
        '-${removeDiacritics(motherMaidenName ?? '').removeAllWhitespace().replaceSpecialChars()}'
        '-${birthDay?.year ?? '0'}'
        '-${birthDay?.month ?? '0'}'
        '-${birthDay?.day ?? '0'}'
        '-$olderSiblings'
        '-$longFinger'
        '-$dominantHand');
  }

  Digest _getHash() {
    var bytes = utf8.encode(concatAll());

    return (md5.convert(bytes));
  }

  static Future<String> _getMnemonic(Digest digest) async {
    String mnemonic = entropyToMnemonic('$digest');

    return (mnemonic);
  }

  Future<ParticipantId> getParticipantId() async {
    var hash = _getHash();

    return (ParticipantId(id: '$hash', mnemonic: await _getMnemonic(hash)));
  }
}
