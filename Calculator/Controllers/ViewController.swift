//
//  ViewController.swift
//  BaseExam
//
//  Created by Sophie Zhou on 9/19/17.
//  Copyright © 2017 Sophie Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var equalB: UIButton!
    var weAreTyping = false
    var firstNumber: Int?
    var secondNumber: Int?
    var operation: Operation?
    
    @IBOutlet weak var minusB: UIButton!
    @IBOutlet weak var multiplyB: UIButton!
    @IBOutlet weak var plusB: UIButton!
    @IBOutlet weak var divideB: UIButton!
    
    @IBOutlet weak var display: UILabel!
    
    
    @IBAction func buttonClick(_ sender: UIButton) {
        let currentNumber = sender.currentTitle!
        
        if weAreTyping {
        let currentDisplay = display.text!
        display.text = currentDisplay + currentNumber
        } else
        {
            display.text = currentNumber
            weAreTyping = true
        }
    }
    
    @IBOutlet weak var buttons: UIButton!
    
    @IBAction func reset(_ sender: Any) {
        equalB.isEnabled = true
        display.text = "Ready to PLAY!"
        operation = nil
        weAreTyping = false

    }
    
    override func viewDidLoad() {
        self.plusB.addTarget(self, action: #selector(plus), for: .touchUpInside)
        self.minusB.addTarget(self, action: #selector(minus), for: .touchUpInside)
        self.equalB.addTarget(self, action: #selector(equal), for: .touchUpInside)
        self.divideB.addTarget(self, action: #selector(divide), for: .touchUpInside)
        self.multiplyB.addTarget(self, action: #selector(multiply), for: .touchUpInside)
        super.viewDidLoad()
    }
    
    @objc func divide () {
        firstNumber = Int(display.text!)
        operation = .divide
        weAreTyping = false

    }
    
    @objc func plus () {
        firstNumber = Int(display.text!)
        operation = .plus
        weAreTyping = false
    }
    
    @objc func multiply () {
        firstNumber = Int(display.text!)
        operation = .multiply
        weAreTyping = false

    }
    
    @objc func minus () {
        firstNumber = Int(display.text!)
        operation = .minus
        weAreTyping = false

    }
    
    @objc func equal () {
        
        secondNumber = Int(display.text!)

        if operation == .plus {
            secondNumber = Int(display.text!)
            display.text = "\(firstNumber! + secondNumber!)"

        }
        
        if operation == .minus {
            display.text = "\(firstNumber! - secondNumber!)"
        }
        
        if operation == .multiply {
            if Int.max / secondNumber! > firstNumber! {
                display.text = "\(firstNumber! * secondNumber!)"}
            else
            {
                display.text = "Such big number!"
                equalB.isEnabled = false
            }
        }
        
        if operation == .divide {
            equalB.isEnabled = true
            
            if secondNumber == 0 {
                display.text = "Nooooooo! 0 Division!"
                equalB.isEnabled = false
            } else {
                display.text = "\(firstNumber! / secondNumber!)"
            }
            
            
        }
        
        if operation == nil {
            display.text = "No Operation Dude!"
        }
        weAreTyping = false
    }

}

