//
//  ViewController.swift
//  Count
//
//  Created by Yo Higashida on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plus() {
        number = number + 1
        label.text = String(number)
        textColor()
    }
    
    @IBAction func minus(){
        number = number - 1
        label.text = String(number)
        textColor()
    }
    
    @IBAction func kakeru(){
        number = number * 2
        label.text = String(number)
        textColor()
    }
    
    @IBAction func waru(){
        number = number / 2
        label.text = String(number)
        textColor()
    }
    
    @IBAction func clear(){
        number = 0
        label.text = String(number)
        textColor()
    }
    
    func textColor() {
        if number >= 10 {
            label.textColor = UIColor.red
        } else if number <= -10 {
            label.textColor = UIColor.blue
        } else {
            label.textColor = UIColor.black
        }
    }
}

