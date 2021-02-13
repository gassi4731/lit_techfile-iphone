//
//  ResultViewController.swift
//  Quiz
//
//  Created by Yo Higashida on 2021/02/13.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 正解数を数えるための変数
    var correctAnser: Int = 0
    
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = String(correctAnser)
    }
    
    // タイトルに戻るボタン
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
