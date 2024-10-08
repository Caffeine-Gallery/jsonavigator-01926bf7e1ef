import Nat "mo:base/Nat";

import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";
import Iter "mo:base/Iter";

actor {
  func extractValues(json : Text) : (Text, Text) {
    let chars = Iter.toArray(json.chars());
    var i = 0;
    var textValue = "";
    var yearValue = "";

    while (i < chars.size()) {
      if (i + 3 < chars.size()) {
        if (chars[i] == 't' and chars[i+1] == 'e' and chars[i+2] == 'x' and chars[i+3] == 't' and textValue == "") {
          textValue := extractValue(chars, i);
        } else if (chars[i] == 'y' and chars[i+1] == 'e' and chars[i+2] == 'a' and chars[i+3] == 'r' and yearValue == "") {
          yearValue := extractValue(chars, i);
        };
      };
      i += 1;
    };

    (textValue, yearValue)
  };

  func extractValue(chars : [Char], startIndex : Nat) : Text {
    var i = startIndex;
    while (i < chars.size() and chars[i] != ':') {
      i += 1;
    };
    i += 1;
    while (i < chars.size() and Char.isWhitespace(chars[i])) {
      i += 1;
    };
    if (i < chars.size() and chars[i] == '\"') {
      i += 1;
      let valueStart = i;
      while (i < chars.size() and chars[i] != '\"') {
        i += 1;
      };
      return Text.fromIter(Iter.fromArray(Array.subArray(chars, valueStart, i - valueStart)));
    };
    ""
  };

  public query func getSelectedValues(jsonString : Text) : async (Text, Text) {
    extractValues(jsonString)
  };
}
