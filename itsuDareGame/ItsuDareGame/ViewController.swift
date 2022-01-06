//
//  ViewController.swift
//  ItsuDareGame
//
//  Created by Yo Higashida on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    // 使用するラベルの宣言
    @IBOutlet var itsuLabel: UILabel!
    @IBOutlet var dokoLabel: UILabel!
    @IBOutlet var daregaLabel: UILabel!
    @IBOutlet var doshitaLabel: UILabel!
    
    let itsuArray: [String] = ["一年前", "一週間", "昨日", "今日"]
    let dokodeArray: [String] = ["山の上で", "アメリカが", "学校で", "クラスで"]
    let daregaArray: [String] = ["僕が", "大統領が", "先生が", "友達が"]
    let doshitaArray: [String] = ["叫んだ", "演説した", "怒った", "踊った"]
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func change() {
        // それぞれのラベルに配列の要素を追加する
        itsuLabel.text = itsuArray[index]
        dokoLabel.text = dokodeArray[index]
        daregaLabel.text = daregaArray[index]
        doshitaLabel.text = doshitaArray[index]
        
        // indexの値を+1する
        index = index + 1
        
        // indexの値が3より大きくなったら0に戻す
        if index > 3 {
            index = 0
        }
    }
    
    @IBAction func reset() {
        // それぞれのラベルを元に戻す
        itsuLabel.text = "-------"
        dokoLabel.text = "-------"
        daregaLabel.text = "-------"
        doshitaLabel.text = "-------"
        
        // indexを初期化する
        index = 0
    }
    
    @IBAction func ramdom() {
        // 乱数を生成して、それぞれのindexに入れる
        let itsuIndex = Int.random(in: 0...3)
        let dokodeIndex = Int.random(in: 0...3)
        let daregaIndex = Int.random(in: 0...3)
        let doshitaIndex = Int.random(in: 0...3)
        
        // コンソールに出力して、それぞれの値を確かめよう
        print("いつ: \(itsuIndex)")
        print("どこで: \(dokodeIndex)")
        print("だれが: \(daregaIndex)")
        print("どうした: \(doshitaIndex)")
        
        // それぞれのラベルに要素を追加する
        itsuLabel.text = itsuArray[itsuIndex]
        dokoLabel.text = dokodeArray[dokodeIndex]
        daregaLabel.text = daregaArray[daregaIndex]
        doshitaLabel.text = doshitaArray[doshitaIndex]
        
    }
}

