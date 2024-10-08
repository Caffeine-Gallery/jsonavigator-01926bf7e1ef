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
      if (i + 6 < chars.size()) {
        if (chars[i] == '\"' and chars[i+1] == 't' and chars[i+2] == 'e' and chars[i+3] == 'x' and chars[i+4] == 't' and chars[i+5] == '\"' and chars[i+6] == ':' and textValue == "") {
          textValue := extractQuotedValue(chars, i + 7);
        } else if (chars[i] == '\"' and chars[i+1] == 'y' and chars[i+2] == 'e' and chars[i+3] == 'a' and chars[i+4] == 'r' and chars[i+5] == '\"' and chars[i+6] == ':' and yearValue == "") {
          yearValue := extractQuotedValue(chars, i + 7);
        };
      };
      i += 1;
    };

    (textValue, yearValue)
  };

  func extractQuotedValue(chars : [Char], startIndex : Nat) : Text {
    var i = startIndex;
    while (i < chars.size() and Char.isWhitespace(chars[i])) {
      i += 1;
    };
    if (i < chars.size() and chars[i] == '\"') {
      i += 1;
      let valueStart = i;
      while (i < chars.size() and chars[i] != '\"') {
        i += 1;
      };
      if (i < chars.size()) {
        return Text.fromIter(Iter.fromArray(Array.subArray(chars, valueStart, i - valueStart)));
      };
    };
    ""
  };

  public query func getSelectedValues(jsonString : Text) : async (Text, Text) {
    extractValues(jsonString)
  };
}
