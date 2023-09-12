//
//  ViewController.swift
//  editColor2
//
//  Created by Aliaksandr Yashchuk on 9/8/23.
//

import UIKit

class ViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "one", let colorScrollVC = segue.destination as? ColorScrollVC {
            colorScrollVC.delegate = self
        }
    }
}

extension ViewController: ColorScrollDelegate {
    func colorScrollDidSaveColor(_ color: UIColor?) {
        if let color = color {
            view.backgroundColor = color
        }
    }
    
}

