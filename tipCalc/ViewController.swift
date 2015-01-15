//
//  ViewController.swift
//  tipCalc
//
//  Created by Hao Wang on 1/14/15.
//  Copyright (c) 2015 Hao Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billInput: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var dollarLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //clear tip and total display
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditChange(sender: AnyObject) {
        //convert bill amount input text into double
        var billAmount = (billInput.text as NSString).doubleValue
        //select percentage from segmented control
        var tipPercentages = [0.15, 0.18, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = billAmount * tipPercentage
        var total = tip + billAmount
        if tip >= 99999.0 {
            tip = 99999.0
        }
        if total >= 999999.0 {
            total = 999999.0
        }
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        if billAmount == 0.0 {
            dollarLabel.hidden = false
        } else {
            dollarLabel.hidden = true
        }
    }
    //tap on View to dismiss keyboard
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

