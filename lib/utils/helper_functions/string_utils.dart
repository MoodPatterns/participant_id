class StringUtils {

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static bool containsAllSubstrings(String s, List<String> subs){
    bool res = true;
    for (String sub in subs){
      if(!s.contains(sub)){
        res=false;
        break;
      }
    }
    return res;
  }

  static bool isJustWhitespace(String s){
    RegExp regExp = RegExp(r"^\s*$");
    return regExp.hasMatch(s);
  }
}