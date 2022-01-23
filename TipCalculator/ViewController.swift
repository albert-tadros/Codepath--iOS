//
//  ViewController.swift
//  TipCalculator
//
//  Created by ALBERT TADROS on 1/20/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var localeControl: UISegmentedControl!
    
    @IBOutlet weak var middleFace: UIImageView!
    @IBOutlet weak var leftFace: UIImageView!
    @IBOutlet weak var rightFace: UIImageView!
    
    
    var faces: [UIImageView] {
        return [leftFace, middleFace, rightFace]
      }
      
      let selectedFaceAlpha   = CGFloat(1.0)
      let deselectedFaceAlpha = CGFloat(0.1)
      
      let defaultTipAmount = 0.2

      override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        updateFaces()
        updateDefaultTipValues()
        updateToPreviousTotal()
      }
    
      
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDefaultTipValues()
      }

      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      }
      
      @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
      }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateFaces()
        
        if let billAmount = billAsDouble() {
            updateTip(billAmount: billAmount)
        } else {
          print("TODO: handle invalid value")
        }
      }
      
      func updateTip(billAmount: Double) {
        //let tipPercentage = [0.14, 0.18, 0.2]
        let tip   = billAmount * tipPercentage()
        let total = billAmount + tip
        
        tipLabel.text   = String(format: "$%.2f", tip)
        totalLabel.text =  String(format: "$%.2f", total)
        
        var userPreferences = UserPreferences()
        userPreferences.previousBill = billAmount
        userPreferences.save()
      }
      
      func updateFaces() {
          UIView.animate(withDuration: 0.1, animations: {
          for (index, face) in self.faces.enumerated() {
            if self.tipControl.selectedSegmentIndex == index {
              face.alpha = self.selectedFaceAlpha
            } else {
              face.alpha = self.deselectedFaceAlpha
            }
          }
        })
      }
      
      func updateDefaultTipValues() {
        let userPreferences = UserPreferences()

        for (index, defaultTipAmount) in userPreferences.defaultTipPercentages().enumerated() {
            tipControl.setTitle(String(defaultTipAmount) + "%", forSegmentAt: index)
        }
      }
      
      func updateToPreviousTotal() {
        let userPreferences = UserPreferences()
        let previousBill = userPreferences.previousBill
        if previousBill != UserPreferences.DefaultBill && userPreferences.billWasEnteredRecently() {
          billField.text = String(previousBill)
            updateTip(billAmount: previousBill)
        }
      }
    
      
      // MARK: - Input validation/normalization
      
      private func billAsDouble() -> Double? {
        return billField.text.map {
          ($0 as NSString).doubleValue
        }
      }
      
      private func tipPercentage() -> Double {
        let selectedIndex = tipControl.selectedSegmentIndex
          return tipControl.titleForSegment(at: selectedIndex).map { amount in
            return convertPercentageStringToDouble(percentageString: amount)
        } ?? defaultTipAmount
      }
      
      private func convertPercentageStringToDouble(percentageString: String) -> Double {
          let arrayOfNumbers  = percentageString.compactMap { Int(String($0)) }
          let stringOfNumbers = arrayOfNumbers.map(String.init).joined(separator: "") as NSString
        
        return stringOfNumbers.doubleValue / 100.0
      }
}
    

