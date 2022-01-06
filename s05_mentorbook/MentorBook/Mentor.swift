//
//  Mentor.swift
//  MentorBook
//
//  Created by Yo Higashida on 2021/01/31.
//

import UIKit

class Mentor {
    var name: String! //メンター名
    var course: String! //担当コース
    var imageName: String! //顔写真（画像の名前）
    
    // 初期化 引数でメンター名・担当コース・顔写真をもらって設定している
    init(name: String, imageName: String, course: String) {
        self.name = name
        self.imageName = imageName
        self.course = course
    }
    
    func getImage() -> UIImage{
        return UIImage(named: imageName)!
    }
}
