import Debug "mo:base/Debug";

actor DBank {
  stable var currentValue = 300;

  let id = 1335435;

  // Debug.print(debug_show (id));

  public func depositFunds(amount : Nat) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdrawFunds(amount : Nat) {
    let total : Int = currentValue - amount;
    if (total >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Insufficient Funds");
    };
  };

  public query func checkBalance() : async Nat {
    return currentValue;
  };

  // depositFunds();
};
