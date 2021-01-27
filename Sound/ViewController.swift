//
//  ViewController.swift
//  Sound
//
//  Created by Yo Higashida on 2021/01/27.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // ドラムのサウンドファイルを読み込んで、プレイヤーをつくる
    let drumSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "drumSound")!.data)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // ドラムがタップされた時に呼ばれる
    @IBAction func tapDrumButton() {
        
        // ドラムの音を巻き戻す
        drumSoundPlayer.currentTime = 0
        
        // ドラムの音を再生する
        drumSoundPlayer.play()
    }
}

