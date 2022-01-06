//
//  ViewController.swift
//  StopWatch
//
//  Created by Yo Higashida on 2021/01/27.
//

import UIKit

class ViewController: UIViewController {
    
    // 残り時間の表示
    @IBOutlet var label: UILabel!
    
    // パーフェクトの表示
    @IBOutlet var status: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start() {
        // タイマーが動いていなかったら動かす
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
    }
    
    @IBAction func stop() {
        if timer.isValid {
            // タイマーが停止していたら停止する
            timer.invalidate()
            
            // パーフェクトの機能
            self.hantei()
        }
    }
    
    @IBAction func reset() {
        if timer.isValid {
            self.stop()
        }
        count = 0.0
        label.text = String(count)
        status.text = ""
    }
    
    @objc func up() {
        // countを0.01足す
        count = count + 0.01
        // ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei() {
        var text = ""
        if 9.80 <= count && count <= 10.20 {
            text = "PERFECT"
        }else if 9.70 <= count && count <= 10.30 {
            text = "GREAT"
        }else if 9.50 <= count && count <= 10.50 {
            text = "GOOD"
        }else{
            text = "BAD"
        }
        status.text = text
    }
}
