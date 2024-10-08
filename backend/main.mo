import Error "mo:base/Error";

import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";
import Iter "mo:base/Iter";

actor {
  func extractTextValue(json : Text) : Text {
    let chars = Iter.toArray(json.chars());
    var i = 0;
    var inText = false;
    var startIndex = 0;
    var endIndex = 0;

    while (i < chars.size()) {
      if (i + 3 < chars.size() and chars[i] == 't' and chars[i+1] == 'e' and chars[i+2] == 'x' and chars[i+3] == 't') {
        // Found "text", now find the next ":"
        while (i < chars.size() and chars[i] != ':') {
          i += 1;
        };
        // Skip the ":" and any whitespace
        i += 1;
        while (i < chars.size() and Char.isWhitespace(chars[i])) {
          i += 1;
        };
        // Check if we're at a quotation mark
        if (chars[i] == '\"') {
          i += 1;
          startIndex := i;
          // Find the closing quotation mark
          while (i < chars.size() and chars[i] != '\"') {
            i += 1;
          };
          endIndex := i;
          return Text.fromIter(Iter.fromArray(Array.subArray(chars, startIndex, endIndex - startIndex)));
        };
      };
      i += 1;
    };

    "Error: 'text' value not found"
  };

  public query func getSelectedText(jsonString : Text) : async Text {
    extractTextValue(jsonString)
  };
}
