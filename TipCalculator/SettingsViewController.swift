//
//  TableViewController.swift
//  TipCalculator
//
//  Created by ALBERT TADROS on 1/21/22.
//

//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by ALBERT TADROS on 1/21/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
  @IBOutlet weak var lowTipField: UITextField!
  @IBOutlet weak var mediumTipField: UITextField!
  @IBOutlet weak var highTipField: UITextField!
    

  var userPreferences: UserPreferences!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    userPreferences = UserPreferences()
      
  }
    
    @IBAction func leftTip(textField: UITextField) {
        if let newDefaultTipValue = (submittedTipValue(text: textField.text)) {
            userPreferences.lowTipPercentage = newDefaultTipValue
            print(newDefaultTipValue)
        }
    }
    @IBAction func medTip(textField: UITextField) {
        if let newDefaultTipValue = (submittedTipValue(text: textField.text)) {
            userPreferences.mediumTipPercentage = newDefaultTipValue
            print(newDefaultTipValue)
        }
    }
        
    @IBAction func rightTip(textField: UITextField) {
        if let newDefaultTipValue = (submittedTipValue(text: textField.text)) {
            userPreferences.highTipPercentage = newDefaultTipValue
            print(newDefaultTipValue)
        }
    }

    
  func submittedTipValue(text: String?) -> Int? {
    return text.flatMap { Int($0) }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateTipFields()
  }
  
    override func viewWillDisappear(_ animated:Bool) {
    for field in [lowTipField, mediumTipField, highTipField] {
        field?.endEditing(true)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func updateTipFields() {
      lowTipField.text    = String(userPreferences.lowTipPercentage)
      mediumTipField.text = String(userPreferences.mediumTipPercentage)
      highTipField.text = String(userPreferences.highTipPercentage)
  }
}
