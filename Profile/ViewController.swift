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
    
    // ラベルを表示する変数をつくる
    @IBOutlet var profileLabel: UILabel!
    
    // ラベルを表示する変数を作る
    @IBOutlet var profileCommentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // ボタンがタップされた時に
    @IBAction func tapButton1() {
        // 画像をImageViewに反映する
        profileImageView.image = UIImage(named: "philImage")
        
        // ラベルをLabelに反映する
        profileLabel.text = "名前"
        
        // コメントをLabelに反映する
        profileCommentLabel.text = "iPhoneメンターのフィルだよ"
    }
    
    // ボタンがタップされた時に
    @IBAction func tapButton2() {
        // 画像をImageViewに反映する
        profileImageView.image = UIImage(named: "trackImage")
        
        // ラベルをLabelに反映する
        profileLabel.text = "スポーツ"
        
        // コメントをLabelに反映する
        profileCommentLabel.text = "陸上競技が好きで、走り幅跳びが得意"
    }
    
    // ボタンがタップされた時に
    @IBAction func tapButton3() {
        // 画像をImageViewに反映する
        profileImageView.image = UIImage(named: "appleImage")
        
        // ラベルをLabelに反映する
        profileLabel.text = "好きな食べ物"
        
        // コメントをLabelに反映する
        profileCommentLabel.text = "りんごが好きで、いつも持ち歩いている"
    }
    
    // ボタンがタップされた時に
    @IBAction func tapButton4() {
        // 画像をImageViewに反映する
        profileImageView.image = UIImage(named: "flightImage")
        
        // ラベルをLabelに反映する
        profileLabel.text = "趣味"
        
        // コメントをLabelに反映する
        profileCommentLabel.text = "飛行機に乗って、空を散歩すること"
    }
}

