//
//  ViewController.swift
//  Calculator
//
//  Created by Student on 2019-09-25.
//  Copyright © 2019 CentennialCollege. All rights reserved.
//

// NAME: LOVELEEN KAUR
// STUDENTID: 301093331
// DESCRIPTION: CALCULATOR
// DATE:
// VERSION HISTORY: v1 - added functionality for buttons

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!

    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isDecimal = false
    var isPerformingOperation = false


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        resultLabel.text = ""
    }

    @IBAction func digitPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag

        if isPerformingOperation == true{
            // next time i m pressing number don't get into this
            isPerformingOperation = false
            resultLabel.text = String(tag-1)
            numberOnScreen = Double(resultLabel.text!)!
        }else{

            // 12 + 16
            // previous number (12)
            // number displayed on screen (16)
            //is performing operation Boolean true/false
            //oprtation performing + - / *
            // tag(what is pressed on the screen

            resultLabel.text = resultLabel.text! + String(tag-1)
            numberOnScreen = Double(resultLabel.text!)!
        }

    }

    @IBAction func operatorPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        /*clear button - 16*/

        if tag == 16{
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            return
        }
        
        if tag == 18{
                resultLabel.text = String(Double(resultLabel.text!)!/100)
        }
        
        if tag == 19{
            let num = resultLabel.text!.dropLast()
            numberOnScreen = Double(num) ?? 0.0
            resultLabel.text = String(num)
//            if(previousNumber.count == 0)
//            {
//                previousNumber = "0"
//            }
//            resultLabel.text = previousNumber
        }
        
        if(!(resultLabel.text?.isEmpty)!){
        /* operation +(14) - (13) / (11) x (12) = 15 % 18 .17*/

            if tag == 11{
                isPerformingOperation = true
                previousNumber = Double(resultLabel.text!)!
                resultLabel.text = "/"
                operation = tag

            }else if tag == 12{
                isPerformingOperation = true
                previousNumber = Double(resultLabel.text!)!
                resultLabel.text = "*"
                operation = tag

            }else if tag == 13{
                isPerformingOperation = true
                previousNumber = Double(resultLabel.text!)!
                resultLabel.text = "-"
                operation = tag

            }else if tag == 14{
                isPerformingOperation = true
                previousNumber = Double(resultLabel.text!)!
                resultLabel.text = "+"
                operation = tag
            }else if tag == 17{
                
                if(!(resultLabel.text?.contains("."))!)
                {
                    resultLabel.text = resultLabel.text! + "."
                    numberOnScreen = Double(resultLabel.text!)!
                    isDecimal = true
                    
                }
                
            }else if tag == 15{
                isPerformingOperation = true

                //check operation
                if operation == 11{
                    
                    if(isDecimal == true){
                        resultLabel.text = String(previousNumber/numberOnScreen)
                    }else{
                        resultLabel.text = String(previousNumber/numberOnScreen)
                        let num = resultLabel.text!.dropLast(2)
                        resultLabel.text = String(num)
                    }

                }else if operation == 12{
                    resultLabel.text = String(previousNumber*numberOnScreen)


                }else if operation == 13{
                    resultLabel.text = String(previousNumber-numberOnScreen)


                }else if operation == 14{
                    resultLabel.text = String(previousNumber+numberOnScreen)
                }

            }
        }
    }

}

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}



