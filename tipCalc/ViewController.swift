//
//  ViewController.swift
//  tipCalc
//
//  Created by Hao Wang on 1/14/15.
//  Copyright (c) 2015 Hao Wang. All rights reserved.
//

import UIKit
var tipPercentages = [15, 18, 20]

class ViewController: UIViewController {
    @IBOutlet weak var billInput: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var dollarLabel: UILabel!
        let PERCENTAGE_KEY = "tip_calc_percentages"
    
    func setPersist() {
        var defaults = NSUserDefaults.standardUserDefaults()
        //encode tip percetages
        var encodedPercentage = 0
        var multi = 1
        for x in tipPercentages {
            encodedPercentage += x * multi
            multi *= 100
        }
        defaults.setInteger(encodedPercentage, forKey: PERCENTAGE_KEY)
        defaults.synchronize()
    }
    
    func loadPersist() {
        var defaults = NSUserDefaults.standardUserDefaults()
        var percentages = defaults.integerForKey(PERCENTAGE_KEY)
        if (percentages == 0) {
            setPersist()
        } else {
            //decode the percentages
            for i in 0..<tipPercentages.endIndex {
                tipPercentages[i] = percentages % 100
                percentages /= 100
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //clear tip and total display
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        loadPersist()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //update all fields
        updateUI()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        //convert bill amount input text into double
        var billAmount = (billInput.text as NSString).doubleValue
        //select percentage from segmented control
        var currentSelected = tipControl.selectedSegmentIndex
        tipControl.removeAllSegments()
        println(tipPercentages[1])
        for i in 0..<tipPercentages.endIndex {
            tipControl.insertSegmentWithTitle(String(tipPercentages[i]) + "%", atIndex: i, animated: false)
            
        }
        tipControl.selectedSegmentIndex = currentSelected
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = billAmount * Double(tipPercentage) * 0.01
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

    @IBAction func onEditChange(sender: AnyObject) {
        updateUI()
    }
    //tap on View to dismiss keyboard
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

