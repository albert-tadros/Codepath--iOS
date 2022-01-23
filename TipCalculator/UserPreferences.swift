//
//  UserPreferences.swift
//  TipCalculator
//
//  Created by ALBERT TADROS on 1/21/22.
//


import Foundation

struct UserPreferences {
    let defaults: UserDefaults
  
  let PreviousBill = "previous_bill"
  let PreviousBillDate = "previous_bill_date"
  static let DefaultBill = 0.0
  
  enum TipPercentageKey: String {
    case LowTip
    case MediumTip
    case HighTip
  }
  
  enum DefaultTip: Int {
    case Low    = 18
    case Medium = 20
    case High   = 22
  }
  
  var previousBill: Double {
    get {
        return defaults.value(forKey: PreviousBill) as? Double ?? UserPreferences.DefaultBill
    }
    
    set {
        previousBillDate = NSDate.timeIntervalSinceReferenceDate
        defaults.set(newValue, forKey: PreviousBill)
    }
  }
  
    var previousBillDate: TimeInterval {
    get {
        return defaults.value(forKey: PreviousBillDate) as? Double ?? 0.0
    }
    
    set {
        defaults.set(newValue, forKey: PreviousBillDate)
    }
  }
  
  
  var lowTipPercentage: Int {
    get {
        return defaults.value(
            forKey: TipPercentageKey.LowTip.rawValue
      ) as? Int ?? DefaultTip.Low.rawValue
    }
    
    set {
        defaults.set(newValue, forKey: TipPercentageKey.LowTip.rawValue)
    }
  }
  
  var mediumTipPercentage: Int {
    get {
        return defaults.value(
            forKey: TipPercentageKey.MediumTip.rawValue
        ) as? Int ?? DefaultTip.Medium.rawValue
    }
    
    set {
        defaults.set(newValue, forKey: TipPercentageKey.MediumTip.rawValue)
    }
  }
  
  var highTipPercentage: Int {
    get {
        return defaults.value(
            forKey: TipPercentageKey.HighTip.rawValue
        ) as? Int ?? DefaultTip.High.rawValue
    }
    
    set {
        defaults.set(newValue, forKey: TipPercentageKey.HighTip.rawValue)
    }
  }
  
  init() {
      self.defaults = UserDefaults.standard
  }
  
  func defaultTipPercentages() -> [Int] {
    return [lowTipPercentage, mediumTipPercentage, highTipPercentage]
  }
  
  func billWasEnteredRecently() -> Bool {
      let now = NSDate.timeIntervalSinceReferenceDate
    return (now - previousBillDate) < (10 * 60) // Ten minutes
  }
  
  func save() {
    print("Saving Preferences: \(defaultTipPercentages())")
    
    defaults.synchronize()
  }
}
