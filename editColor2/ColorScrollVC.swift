//
//  ColorScrollVC.swift
//  editColor2
//
//  Created by Aliaksandr Yashchuk on 9/8/23.
//

import UIKit

protocol ColorScrollDelegate: class {
    func colorScrollDidSaveColor(_ color: UIColor?)
}

class ColorScrollVC: UIViewController {
    
    
    
    
    @IBOutlet weak var red: UISlider!
    @IBOutlet weak var green: UISlider!
    @IBOutlet weak var blue: UISlider!
 
    @IBOutlet weak var redTf: UITextField!
    @IBOutlet weak var greenTf: UITextField!
    @IBOutlet weak var blueTf: UITextField!
    
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    
    @IBOutlet weak var hex: UITextField!
    
    weak var delegate: ColorScrollDelegate?
    var tempColor: UIColor?
    private var isColorChanged = false
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
           red.value = 0.5
           green.value = 0.5
           blue.value = 0.5
          // updateUIWithColor()
       }
       
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateUIWithColor()
        isColorChanged = true
        
        let red = Int(red.value * 255)
        let green = Int(green.value * 255)
        let blue = Int(blue.value * 255)
        let hexString = String(format: "#%02X%02X%02X", red, green, blue)
        hex.text = hexString
    }
       
       func updateUIWithColor() {
           let red = CGFloat(red.value)
           let green = CGFloat(green.value)
           let blue = CGFloat(blue.value)
           
           redTf.text = String(format: "%.2f", red)
           greenTf.text = String(format: "%.2f", green)
           blueTf.text = String(format: "%.2f", blue)
           
           let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
          // view.backgroundColor = color
           testView.backgroundColor = color
       }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if isColorChanged {
            tempColor = testView.backgroundColor
            delegate?.colorScrollDidSaveColor(tempColor)
        }
                      
        navigationController?.popViewController(animated: true)
               }
           }
