import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;
  stable var startTime = Time.now();

  // ------------------------ Deposit ------------------------
  public func depositFunds(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  // ------------------------ Withdraw ------------------------
  public func withdrawFunds(amount : Float) {
    let total : Float = currentValue - amount;
    if (total >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Insufficient Funds");
    };
  };

  // ------------------------ Check Balance ------------------------
  public query func checkBalance() : async Float {
    return currentValue;
  };

  // ------------------------ Compound Logic ------------------------
  public func compoundInterest() {
    let currentTime = Time.now();
    let timeElapsedS = (currentTime - startTime) / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
};
