//
//  ViewController.swift
//  Calculator
//
//  Created by 陈志中 on 15/11/9.
//  Copyright © 2015年 陈志中. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber:Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!;
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
            print("digit = \(digit)")
        
        }else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }


}

