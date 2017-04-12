//
//  GameViewController.swift
//  TETRIS
//
//  Created by 石津恭輔 on 2017/04/12.
//  Copyright © 2017年 石津恭輔. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    //ブロックのサイズ
    let BLOCK_SIZE   = 20;
    // フィールドの完全幅。壁を除くと10。
    let FIELD_WIDTH = 11;
    // フィールドの高さ
    let FIELD_HEIGHT = 22;
    //壁コード
    let WALL = 99;
    //マトリクス２次元配列
    let MATRIX:[[Int]] = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                          [99,99,99, 0, 0, 0, 0, 0, 0,99,99,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,99],
                          [99,99,99,99,99,99,99,99,99,99,99,99]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //背景を白に
        view.backgroundColor = UIColor.white
        
        var px:Int = 0
        var py:Int = 0
        
        for y in 0...FIELD_HEIGHT {
            px = 0
            for x in 0...FIELD_WIDTH {
                //四角インスタンス
                let rect = CAShapeLayer()
                rect.strokeColor = UIColor.black.cgColor
                //壁だったら緑
                if (MATRIX[y][x] == WALL) {
                    rect.fillColor = UIColor.green.cgColor
                }
                //枠線サイズ
                rect.lineWidth = 1.0
                rect.path = UIBezierPath(rect:CGRect(x:px,y:py,width:BLOCK_SIZE,height:BLOCK_SIZE)).cgPath
                //描写
                self.view.layer.addSublayer(rect)
                //20px横にずらす
                px += BLOCK_SIZE;
            }
            //20px縦に基準をずらす
            py += BLOCK_SIZE;
        }
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
}
