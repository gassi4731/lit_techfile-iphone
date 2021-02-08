//
//  ViewController.swift
//  PasswordHacker
//
//  Created by Yo Higashida on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    // 結果表示用ラベル
    @IBOutlet var resultLabel1: UILabel!
    @IBOutlet var resultLabel2: UILabel!
    @IBOutlet var resultLabel3: UILabel!
    @IBOutlet var resultLabel4: UILabel!
    
    // カウント表示用ラベル
    @IBOutlet var countLabel: UILabel!
    
    // 秘密のパスワード
    var password: Int = 1234
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start() {
        for i in 0...9999 {
            // 解析中の数字も表示する
            countLabel.text = String(i)
            
            // 処理を0.0005秒遅延させる
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.0005))
            
            // passwordと一致したら...
            if i == password {
                // passwordの桁ごとの数字を入れる配列
                var digits = [Int]()
                
                for _ in 0...3 {
                    digits.append(password % 10)
                    password = password / 10
                }
                
                resultLabel1.text = String(digits[0])
                resultLabel2.text = String(digits[1])
                resultLabel3.text = String(digits[2])
                resultLabel4.text = String(digits[3])
                
                print("正解は\(i)です！")
                break
            }
        }
    }
    
    @IBAction func reset() {
        // passwordを1234に再設定する
        password = 1234
        
        // countLabelの表示を元に戻す
        countLabel.text = "「START」ボタンを押して解析開始"
        
        // ラベルの表示をすべて0にもどす
        resultLabel1.text = "0"
        resultLabel2.text = "0"
        resultLabel3.text = "0"
        resultLabel4.text = "0"
    }
}

