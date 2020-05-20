//
//  ViewController.swift
//  CalculatorTest
//
//  Created by Евгений Испольнов on 19.05.2020.
//  Copyright © 2020 Евгений Испольнов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var scrollLabel: UIScrollView!
    var result: Float = 0.0
    var firstItem: Float = 0.0
    var secondItem: Float = 0.0
    var firstItemString: String = ""
    var secondItemString: String = ""
    var ariphmeticSymbol: String = ""
    var isFirstItem: Bool = true
    var isPointSet: Bool = false
    var isOperationSet: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "enter expression"
    }
    
    // MARK: Actions
    @IBAction func button1(_ sender: UIButton) {
        setText("2")
    }
    
    @IBAction func button2(_ sender: UIButton) {
        setText("2")
    }
    
    @IBAction func button3(_ sender: UIButton) {
        setText("3")
    }
    
    @IBAction func button4(_ sender: UIButton) {
        setText("4")
    }
    
    @IBAction func button5(_ sender: UIButton) {
        setText("5")
    }
    
    @IBAction func button6(_ sender: UIButton) {
        setText("6")
    }
    
    @IBAction func button7(_ sender: UIButton) {
        setText("7")
    }
    
    @IBAction func button8(_ sender: UIButton) {
        setText("8")
    }
    
    @IBAction func button9(_ sender: UIButton) {
        setText("9")
    }
    
    @IBAction func button0(_ sender: UIButton) {
        setText("0")
    }
    
    @IBAction func buttonPoint(_ sender: UIButton) {
        guard firstItemString != "" else {
            resultLabel.text = "wrong expression"
            return
        }
        
        if isPointSet == false {
            setText(".")
            isPointSet = true
        }
    }
    
    @IBAction func buttonClear(_ sender: UIButton) {
        guard firstItemString != "" else {
            resultLabel.text = "wrong expression"
            return
        }
        
        if resultLabel.text != "" {
            if firstItemString[firstItemString.index(before: firstItemString.endIndex)] == "." {
                isPointSet = false
            }
            
            if secondItemString != "" {
                if secondItemString[secondItemString.index(before: secondItemString.endIndex)] == "." {
                    isPointSet = false
                }
            }
            
            if isFirstItem == true {
                firstItemString.remove(at: firstItemString.index(before: firstItemString.endIndex))
                resultLabel.text = firstItemString
            } else {
                secondItemString.remove(at: secondItemString.index(before: secondItemString.endIndex))
                resultLabel.text = firstItemString + ariphmeticSymbol + secondItemString
            }
            
            if secondItemString == "" {
                isFirstItem = true
                isOperationSet = false
            }
        }
    }
    
    @IBAction func buttonPlus(_ sender: UIButton) {
        guard firstItemString != "" else {
            resultLabel.text = "wrong expression"
            return
        }
        
        if isOperationSet == false {
            ariphmeticSymbol = "+"
            isFirstItem = false
            isPointSet = false
            isOperationSet = true
            setText("")
        }
    }
    
    @IBAction func buttonMinus(_ sender: UIButton) {
        guard firstItemString != "" else {
            resultLabel.text = "wrong expression"
            return
        }
        
        if isOperationSet == false {
            ariphmeticSymbol = "-"
            isFirstItem = false
            isPointSet = false
            isOperationSet = true
            setText("")
        }
    }
    
    @IBAction func buttonMultiply(_ sender: UIButton) {
        guard firstItemString != "" else {
            resultLabel.text = "wrong expression"
            return
        }
        
        if isOperationSet == false {
            ariphmeticSymbol = "x"
            isFirstItem = false
            isPointSet = false
            isOperationSet = true
            setText("")
        }
    }
    
    
    @IBAction func buttonDivision(_ sender: UIButton) {
        guard firstItemString != "" else {
            resultLabel.text = "wrong expression"
            return
        }
        
        if isOperationSet == false {
            ariphmeticSymbol = "%"
            isFirstItem = false
            isPointSet = false
            isOperationSet = true
            setText("")
        }
    }
    
    @IBAction func buttonSolve(_ sender: UIButton) {
        guard firstItemString != "" else {
            resultLabel.text = "wrong expression"
            return
        }
        
        firstItem = Float(firstItemString)!
        secondItem = Float(secondItemString)!
        
        switch ariphmeticSymbol {
        case "+":
            result = firstItem + secondItem
        case "-":
            result = firstItem - secondItem
        case "x":
            result = firstItem * secondItem
        case "%":
            result = firstItem / secondItem
        default:
            result = 0.0
        }
        
        resultLabel.text = "\(result)"
        isFirstItem = true
        isOperationSet = false
        isPointSet = true
        secondItemString = ""
        firstItemString = "\(result)"
    }
    
    @IBAction func buttonCos(_ sender: UIButton) {
        guard firstItemString != "" else {
            resultLabel.text = "wrong expression"
            return
        }
        
        if isFirstItem == true {
            firstItem = Float(firstItemString)!
            result = cos(firstItem)
            resultLabel.text = "\(result)"
            
            isFirstItem = true
            isOperationSet = false
            isPointSet = true
            secondItemString = ""
            firstItemString = "\(result)"
        }
    }
    
    @IBAction func buttonSin(_ sender: UIButton) {
        guard firstItemString != "" else {
            resultLabel.text = "wrong expression"
            return
        }
        
        if isFirstItem == true {
            firstItem = Float(firstItemString)!
            result = sin(firstItem)
            resultLabel.text = "\(result)"
            
            isFirstItem = true
            isOperationSet = false
            isPointSet = true
            secondItemString = ""
            firstItemString = "\(result)"
        }
    }
    
    @IBAction func buttonTan(_ sender: UIButton) {
        guard firstItemString != "" else {
            resultLabel.text = "wrong expression"
            return
        }
        
        if isFirstItem == true {
            firstItem = Float(firstItemString)!
            result = tan(firstItem)
            resultLabel.text = "\(result)"
            
            isFirstItem = true
            isOperationSet = false
            isPointSet = true
            secondItemString = ""
            firstItemString = "\(result)"
        }
    }
    
    
    // MARK: Private methods
    private func setText(_ text: String) {
        if isFirstItem == true {
            firstItemString += text
            resultLabel.text = firstItemString
        } else {
            secondItemString += text
            resultLabel.text = firstItemString + ariphmeticSymbol + secondItemString
        }
    }
}

