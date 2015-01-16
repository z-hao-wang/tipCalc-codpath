//
//  SettingViewController.swift
//  tipCalc
//
//  Created by Hao Wang on 1/15/15.
//  Copyright (c) 2015 Hao Wang. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tipPercentLabel1: UITextField!

    @IBOutlet weak var tipPercentLabel2: UITextField!
    
    @IBOutlet weak var tipPercentLabel3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //update all fields
        tipPercentLabel1.text = String(tipPercentages[0])
        tipPercentLabel2.text = String(tipPercentages[1])
        tipPercentLabel3.text = String(tipPercentages[2])
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        //update all fields
        tipPercentages[0] = tipPercentLabel1.text.toInt()!
        tipPercentages[1] = tipPercentLabel2.text.toInt()!
        tipPercentages[2] = tipPercentLabel3.text.toInt()!
        var vc = ViewController(nibName: "ViewController", bundle: nil)
        vc.setPersist()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
