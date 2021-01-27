//
//  ViewController.swift
//  Profile
//
//  Created by Yo Higashida on 2021/01/27.
//

import UIKit

class ViewController: UIViewController {
    
    // 画像を表示する変数を作る
    @IBOutlet var profileImageView: UIImageView!
    
    // ラベルを表示する変数を作る
    @IBOutlet var profileCommentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 画面を見えない状態にする
        profileImageView.isHidden = true
        
        // ラベルを見えない状態にする
        profileCommentLabel.isHidden = true
    }
    
    @IBAction func tapButton1() {
        // 画面を見える状態にする
        profileImageView.isHidden = false
        
        // ラベルを見える状態にする
        profileCommentLabel.isHidden = false
    }

}

