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
  String? callName;
  int? ageKiss;
  LongFinger? longFinger;
  DominantHand? dominantHand;

  String _concatAll() {
    return (
        '${removeDiacritics(firstWord ?? '').removeAllWhitespace().replaceSpecialChars()}'
        '${removeDiacritics(callName ?? '').removeAllWhitespace().replaceSpecialChars()}'
        '$ageKiss'
        '$longFinger'
        '$dominantHand'
    );
  }

  Digest _getHash(){
    var bytes = utf8.encode(_concatAll());

    return (md5.convert(bytes));
  }

  Future<String> _getMnemonic(Digest digest) async{
    String mnemonic = await entropyToMnemonic('$digest');
    
    return(mnemonic);
  }
  
  Future<ParticipantId> getParticipantId() async{
    var hash = _getHash();
    
    return (ParticipantId(id: '$hash', mnemonic: await _getMnemonic(hash)));
  }
}
