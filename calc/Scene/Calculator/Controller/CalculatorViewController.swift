//
//  CalculatorViewController.swift
//  calc
//
//  Created by Arish Khan on 09/03/22.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var displayLabel: UILabel!
    
    var first: String = ""
    var second: String = ""
    var operation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func resultButtonAction() {
        guard !second.isEmpty else {
            return
        }
        var value: Double = 0
        if operation == "+" {
            displayLabel.text = first + operation + second + "="
            if let first = Double(first) , let second = Double(second) {
                value = (first + second)
            }
        }else if operation == "-" {
            displayLabel.text = first + operation + second + "="
            if let first = Double(first) , let second = Double(second) {
                value = (first - second)
            }
        }else if operation  == "*" {
            displayLabel.text = first + operation + second + "="
            if let first = Double(first) , let second = Double(second) {
                value = (first * second)
            }
        }else if operation == "/" {
            displayLabel.text = first + operation + second + "="
            if let first = Double(first) , let second = Double(second) {
                if second != 0 {
                    value = (first / second)
                } else {
                    resultLabel.text = "error"
                    return
                }
            }
        }
        resultLabel.text = String(format: "%g", value)
        first = resultLabel.text ?? "0"
        //  second = ""
        // operation = ""
    }
    @IBAction func addButtonAction() {
        operation = "+"
        second = ""
        displayLabel.text = first + operation + second
    }
    @IBAction func subtractButtonAction() {
        operation = "-"
        second = ""
        displayLabel.text = first + operation + second
    }
    @IBAction func productButtonAction() {
        operation = "*"
        second = ""
        displayLabel.text = first + operation + second
    }
    @IBAction func divisionButtonAction() {
        operation = "/"
        second = ""
        displayLabel.text = first + operation + second
    }
    @IBAction func acButtonAction() {
        resultLabel.text = "0"
        first = ""
        second = ""
        operation = ""
        displayLabel.text = ""
    }
    @IBAction func decimalButtonAction() {
        if first.isEmpty {
            first = "0."
            resultLabel.text = first
        } else if let text = resultLabel.text , text.contains(".")  {
            return
        } else if second.isEmpty && !operation.isEmpty{
            second = "0."
            resultLabel.text = second
        } else {
            onNumberTapped(number: ".")
        }
    }
    @IBAction func oneButtonAction() {
        onNumberTapped(number: "1")
    }
    @IBAction func secondButtonAction() {
        onNumberTapped(number: "2")
    }
    @IBAction func thirdButtonAction() {
        onNumberTapped(number: "3")
    }
    @IBAction func fourthButtonAction() {
        onNumberTapped(number: "4")
    }
    @IBAction func fifthButtonAction() {
        onNumberTapped(number: "5")
    }
    @IBAction func sixthButtonAction() {
        onNumberTapped(number: "6")
    }
    @IBAction func seventhButtonAction() {
        onNumberTapped(number: "7")
    }
    @IBAction func eightButtonAction() {
        onNumberTapped(number: "8")
    }
    @IBAction func ninethButtonAction() {
        onNumberTapped(number: "9")
    }
    @IBAction func zeroButtonAction() {
        checkEquallsExist()
        guard !first.isEmpty else {
            return
        }
        if !operation.isEmpty {
            if second != "0" {
                second.append("0")
                resultLabel.text = second
            }
        } else {
            first.append("0")
            resultLabel.text = first
        }
        displayLabel.text = first + operation + second
    }
    @IBAction func backSpaceButtonAction() {
        guard resultLabel.text != "0" else {
            return
        }
        if operation.isEmpty {
            first.removeLast()
            resultLabel.text = first
        } else {
            second.removeLast()
            resultLabel.text = second
        }
        if let text = resultLabel.text , text.isEmpty {
            if !operation.isEmpty {
                second.append("0")
                resultLabel.text = second
            } else {
                first.append("0")
                resultLabel.text = first
            }
        }
        displayLabel.text = first + operation + second
    }
    func onNumberTapped(number: String) {
        checkEquallsExist()
        if first.isEmpty {
            first.append(number)
            resultLabel.text = first
        }else {
            if !operation.isEmpty{
                second.append(number)
                resultLabel.text = second
            } else {
                first.append(number)
                resultLabel.text = first
            }
        }
        displayLabel.text = first + operation + second
    }
    func checkEquallsExist() {
        if  let text = displayLabel.text , text.contains("=") {
            first = ""
            second = ""
            operation = ""
            displayLabel.text = ""
            resultLabel.text = "0"
        }
    }
}
