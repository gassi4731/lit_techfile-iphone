//
//  ViewController.swift
//  MentorBook
//
//  Created by Yo Higashida on 2021/01/30.
//

import UIKit

class ViewController: UIViewController {
    
    var mentorArray: [Mentor] = []
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    
    // 表示するメンターの番号
    var index: Int = 0
    
    func setUI() {
        imageView.image = mentorArray[index].getImage()
        nameLabel.text = mentorArray[index].name
        courseLabel.text = mentorArray[index].course
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mentorArray.append(Mentor(name: "ながた", imageName: "nagata.jpg", course: "iPhone"))
        mentorArray.append(Mentor(name: "りょう", imageName: "ryo.jpg", course: "Unity"))
        mentorArray.append(Mentor(name: "たいてぃ", imageName: "taithi.jpg", course: "WebS, WebD"))
        setUI()
    }
    
    @IBAction func mae() {
        if index == 0 {
            index = 2
        }else{
            index -= 1
        }
        setUI()
    }

    @IBAction func tugi() {
        if index == 2 {
            index = 0
        }else{
            index += 1
        }
        setUI()
    }

}

