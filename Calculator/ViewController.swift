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
    var operationChange: Bool = false
    var mathSign: Bool = false
    var isEquals: Bool = false
    var sum: Double = 0
    @IBOutlet weak var firstNumber: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var secondNumber: UILabel!
    @IBOutlet weak var result: UILabel!
    
    

    
   
    @IBAction func clearEndedSymbol(_ sender: UIButton) {
        if secondNumber.text != "" {
            var string: String = secondNumber.text!
            string.remove(at: string.index(before: string.endIndex))
            secondNumber.text = string
            countResult(operation)
            if secondNumber.text?.count == 0 {
                result.text = ""
            }
        }
        
    }
    @IBAction func dotSetDouble(_ sender: UIButton) {
        if secondNumber.text != "" {
            let neededChar: Character = "."
            let string = secondNumber.text!
            if string.contains(neededChar) == false {
                secondNumber.text = secondNumber.text! + "."
            }
        }
    }
    @IBAction func digits(_ sender: UIButton) {
        if isEquals == true {
            
            firstNumber.text = ""
            operationLabel.text = ""
            secondNumber.text = ""
            result.text = ""
            firstNum = 0
            sum = 0
            mathSign = false
//            operationChange = false
            isEquals = false
        } else {
            if mathSign == true {
                secondNumber.text = secondNumber.text! + String(sender.tag)
                mathSign = false
            } else {
                secondNumber.text = secondNumber.text! + String(sender.tag)
            }
            
            countResult(operation)
        }
        
        
        
        
//        numberFromScreen = Double(secondNumber.text!)!
        
    }
    
    func countResult(_ operation: Int) {
        if secondNumber.text != "" {
            var summary: Double = 0;
            if operation == 11 { // sqrt
                if operationChange == true {
                    summary = (sum / Double(secondNumber.text!)!)
                    roundSummary(summary: summary)
                    
                    //                    operationChange = false
                } else {
                    summary = (Double(firstNumber.text!)! / Double(secondNumber.text!)!)
                    roundSummary(summary: summary)
                }
                
            } else if operation == 12 { //pow
                if operationChange == true {
                     summary = (sum * Double(secondNumber.text!)!)
                    roundSummary(summary: summary)
                    //                    operationChange = false
                } else {
                    summary = (Double(firstNumber.text!)! * Double(secondNumber.text!)!)
                    roundSummary(summary: summary)
                }
            } else if operation == 13 { //minus
                if operationChange == true {
                     summary = (sum - Double(secondNumber.text!)!)
                    roundSummary(summary: summary)
                    //                    operationChange = false
                } else {
                    summary = (Double(firstNumber.text!)! - Double(secondNumber.text!)!)
                    roundSummary(summary: summary)
                }
            } else if operation == 14 { //plus
                if operationChange == true {
//                    result.text = "\(sum + Double(secondNumber.text!)!)"
                    summary = (sum + Double(secondNumber.text!)!)
                    roundSummary(summary: summary)
                } else {
                   summary = (Double(firstNumber.text!)! + Double(secondNumber.text!)!)
                    roundSummary(summary: summary)
//                    result.text = "\(Double(firstNumber.text!)! + Double(secondNumber.text!)!)"
                }
            }
            
            
        }
    }
    
    func roundSummary(summary: Double) {
        let roundSummary: Int = Int(round(summary))
        if summary == Double(roundSummary) {
            result.text = "\(roundSummary)"
        } else {
            result.text = "\(summary)"
        }
        isEquals = false
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
       
        if (secondNumber.text != "" && sender.tag != 15 && sender.tag != 10) {
           
            if firstNumber.text != ""  {
                sum = Double(result.text!)!
                operationChange = true
                 isEquals = false
            }
            
            firstNumber.text = secondNumber.text
            firstNum = Double(secondNumber.text!)!
            secondNumber.text = ""
            
            if sender.tag == 11 {
                operationLabel.text = "/"
            } else if sender.tag == 12 {
                operationLabel.text = "x"
            } else if sender.tag == 13 {
                operationLabel.text = "-"
            } else if sender.tag == 14 {
                operationLabel.text = "+"
            }
            
            
            
           
        } else if sender.tag == 10 {
            isEquals = false
            firstNumber.text = ""
            operationLabel.text = ""
            secondNumber.text = ""
            result.text = ""
            firstNum = 0
            sum = 0
            operation = 0
            mathSign = false
            operationChange = false
        } else if sender.tag ==  15 {
            if firstNumber.text != "" && secondNumber.text != "" {
                isEquals = true
                firstNumber.text = result.text
                sum = Double(result.text!)!
                secondNumber.text = ""
                operationLabel.text = ""
                operation = 0
                mathSign = false
                operationChange = false
                result.text = ""
                
            }
        } else {
            if sender.tag == 11 {
                operationLabel.text = "/"
            } else if sender.tag == 12 {
                operationLabel.text = "x"
            } else if sender.tag == 13 {
                operationLabel.text = "-"
            } else if sender.tag == 14 {
                operationLabel.text = "+"
            }
            isEquals = false
            operationChange = true

        }
        operation = sender.tag
        countResult(operation)
        mathSign = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstNumber.text! = ""
        self.operationLabel.text! = ""
        self.secondNumber.text! = ""
        self.result.text! = ""
    }


}
