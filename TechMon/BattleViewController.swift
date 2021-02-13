//
//  BattleViewController.swift
//  TechMon
//
//  Created by Yo Higashida on 2021/02/08.
//

import UIKit

class BattleViewController: UIViewController {

    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var playerImageView: UIImageView!
    @IBOutlet var playerHPLabel: UILabel!
    @IBOutlet var playerMPLabel: UILabel!
    @IBOutlet var playerTPLabel: UILabel!
    
    @IBOutlet var enemyNameLabel: UILabel!
    @IBOutlet var enemyImageView: UIImageView!
    @IBOutlet var enemyHPLabel: UILabel!
    @IBOutlet var enemyMPLabel: UILabel!
    
    let techMonManager = TechMonManager.shared
    
    var player: Character!
    var enemy: Character!
    var gameTimer: Timer!
    var isPlayerAttackAvailable: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // キャラクターの読み込み
        player = techMonManager.player
        enemy = techMonManager.enemy
        
        // UIの設定
        updateUI()
        // プレイヤーのステータスを反映
        playerNameLabel.text = "勇者"
        playerImageView.image = UIImage(named: "yusya.png")
        
        // 敵のステータスを反映
        enemyNameLabel.text = "龍"
        enemyImageView.image = UIImage(named: "monster.png")
        
        // ゲームスタート
        gameTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                         selector: #selector(updateGame), userInfo: nil, repeats: true)
        gameTimer.fire()
    }
    
    // ステータスの反映
    func updateUI() {
        // プライヤーのステータスを反映
        playerHPLabel.text = "\(player.currentHP) / \(player.maxHP)"
        playerMPLabel.text = "\(player.currentMP) / \(player.maxMP)"
        playerTPLabel.text = "\(player.currentTP) / \(player.maxTP)"
        
        // 敵のステータスを反映
        enemyHPLabel.text = "\(enemy.currentHP) / \(enemy.maxHP)"
        enemyMPLabel.text = "\(enemy.currentMP) / \(enemy.maxMP)"
    }
    
    // 勝敗判定をする
    func judgeBattle() {
        if player.currentHP <= 0 {
            finishBattle(vanishImageView: playerImageView, isPlayerWin: false)
        } else if enemy.currentHP <= 0 {
            finishBattle(vanishImageView: enemyImageView, isPlayerWin: true)
        }
    }
    
    // 0.1秒ごとにゲームの状態を更新する
    @objc func updateGame() {
        // プレイヤーのステータスを更新
        player.currentMP += 1
        if player.currentMP >= 20 {
            isPlayerAttackAvailable = true
            player.currentMP = 20
        } else {
            isPlayerAttackAvailable = false
        }
        
        // 敵のステータスを更新
        enemy.currentMP += 1
        if enemy.currentMP >= 35 {
            enemyAttack()
            enemy.currentMP = 0
        }
        
        updateUI()
    }
    
    // 敵の攻撃
    func enemyAttack() {
        techMonManager.damageAnimation(imageView: playerImageView)
        techMonManager.playSE(fileName: "SE_attack")
        
        player.currentHP -= 20
        
        updateUI()
        judgeBattle()
    }
    
    // プレイヤーの攻撃
    @IBAction func attackAction() {
        if isPlayerAttackAvailable {
            techMonManager.damageAnimation(imageView: enemyImageView)
            techMonManager.playSE(fileName: "SE_attack")
            
            enemy.currentHP -= player.attackPoint
            
            player.currentHP += 10
            if player.currentTP >= player.maxTP {
                player.currentTP = player.maxTP
            }
            player.currentMP = 0
            
            updateUI()
            judgeBattle()
        }
    }
    
    @IBAction func fireAction() {
        if isPlayerAttackAvailable && player.currentTP >= 40 {
            techMonManager.damageAnimation(imageView: enemyImageView)
            techMonManager.playSE(fileName: "SE_fire")
            
            enemy.currentHP -= 100
            
            player.currentTP -= 40
            if player.currentTP <= 0 {
                player.currentTP = 0
            }
            player.currentMP = 0
            
            judgeBattle()
        }
    }
    
    // 勝敗が決定した時の処理
    func finishBattle(vanishImageView: UIImageView, isPlayerWin: Bool) {
        
        techMonManager.vanishAnimation(imageView: vanishImageView)
        techMonManager.stopBGM()
        gameTimer.invalidate()
        isPlayerAttackAvailable = false
        
        var finishMessage: String = ""
        if isPlayerWin {
            techMonManager.playSE(fileName: "SE_fanfare")
            finishMessage = "勇者の勝利!!"
        } else {
            techMonManager.playSE(fileName: "SE_gameover")
            finishMessage = "勇者の敗北..."
        }
        techMonManager.resetStatus()
        
        let alert = UIAlertController(title: "バトル終了", message: finishMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tameruAction() {
        if isPlayerAttackAvailable {
            techMonManager.playSE(fileName: "SE_charge")
            player.currentTP += 40
            if player.currentTP >= player.maxTP {
                player.currentTP = player.maxTP
            }
            player.currentMP = 0
        }
    }
}
