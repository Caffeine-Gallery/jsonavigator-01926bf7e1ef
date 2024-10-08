import Text "mo:base/Text";

actor {
  let selectedText = "Eight-year-old Huang Na was abducted and murdered; her body was found three weeks later after a search across Singapore and Malaysia.";

  public query func getSelectedText() : async Text {
    selectedText
  };
}
