//
//  ViewController.swift
//  Calculator
//
//  Created by sirius on 14.02.2019.
//  Copyright © 2019 sirius. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var numberFromScreen: Double = 0
    var firstNum: Double = 0
    var firstOperation = 0
    var operation: Int = 0
    var operationChange: Bool = false;
    var mathSign: Bool = false
    var sum: Double = 0
    @IBOutlet weak var firstNumber: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var secondNumber: UILabel!
    @IBOutlet weak var result: UILabel!
    
    

    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            

            secondNumber.text = secondNumber.text! + String(sender.tag)
            mathSign = false
        } else {
            secondNumber.text = secondNumber.text! + String(sender.tag)
        }
        countResult(operation)
        
//        numberFromScreen = Double(secondNumber.text!)!
        
    }
    
    func countResult(_ operation: Int) {
       
        if secondNumber.text != "" {
            if operation == 11 { // sqrt
                if operationChange == true {
                    result.text = "\(sum / Double(secondNumber.text!)!)"
                    operationChange = false
                } else {
                    result.text = "\(Double(firstNumber.text!)! / Double(secondNumber.text!)!)"
                }

            } else if operation == 12 { //pow
                if operationChange == true {
                    result.text = "\(sum * Double(secondNumber.text!)!)"
                    operationChange = false
                } else {
                    result.text = "\(Double(firstNumber.text!)! * Double(secondNumber.text!)!)"
                }
            } else if operation == 13 { //minus
                if operationChange == true {
                    result.text = "\(sum - Double(secondNumber.text!)!)"
                    operationChange = false
                } else {
                    result.text = "\(Double(firstNumber.text!)! - Double(secondNumber.text!)!)"
                }
            } else if operation == 14 { //plus
                if operationChange == true {
                    result.text = "\(sum + Double(secondNumber.text!)!)"
                    operationChange = false
                } else {
                    result.text = "\(Double(firstNumber.text!)! + Double(secondNumber.text!)!)"
                }
            }
            

        }
        
      
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if (secondNumber.text != "" && sender.tag != 15 && sender.tag != 10) {
            if firstNumber.text != "" {
                sum = Double(result.text!)!
                operationChange = true
            }
            
            firstNumber.text = secondNumber.text
            firstNum = Double(secondNumber.text!)!
            secondNumber.text = ""
            
            if sender.tag == 11 {
                operationLabel.text = "/"
            } else if sender.tag == 12 {
                operationLabel.text = "*"
            } else if sender.tag == 13 {
                operationLabel.text = "-"
            } else if sender.tag == 14 {
                operationLabel.text = "+"
            }
            
           
        } else if sender.tag == 10 {
            firstNumber.text = ""
            operationLabel.text = ""
            secondNumber.text = ""
        
            result.text = ""
            firstNum = 0
            sum = 0
            operation = 0
            mathSign = false
            operationChange = false
        }
        operation = sender.tag
        
        countResult(operation)
        
        mathSign = true
//        if secondNumber.text != "" && sender.tag != 15 && sender.tag != 10 {
//            if firstNumber.text != "" {
//                firstNum = Double(firstNumber.text!)!
//            } else {
//                firstNum = Double(secondNumber.text!)!
//            }
//
//            if sender.tag == 11 {
//                operationLabel.text = "/"
//
//            } else if sender.tag == 12 {
//                  operationLabel.text = "x"
//
//            } else if sender.tag == 13 {
//                  operationLabel.text = "-"
//
//            } else if sender.tag == 14 {
//                  operationLabel.text = "+"
//
//            }
//
//            firstNumber.text = secondNumber.text
//            secondNumber.text = ""
//            operation = sender.tag
//            mathSign = true
//        } else if sender.tag == 15 {
//            if operation == 11 {
//                result.text = String(firstNum / numberFromScreen)
//            } else if operation == 12 {
//                result.text = String(firstNum * numberFromScreen)
//            } else if operation == 13 {
//                result.text = String(firstNum - numberFromScreen)
//            } else if operation == 14 {
//                result.text = String(firstNum + numberFromScreen)
//            }
//
//        } else if sender.tag == 10 {
//
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstNumber.text! = ""
        self.operationLabel.text! = ""
        self.secondNumber.text! = ""
        self.result.text! = ""
    }


}

