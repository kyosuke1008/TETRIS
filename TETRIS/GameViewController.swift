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
    let CELL_SIZE   = 20; // セルのサイズ。正方形。
    let FIELD_LEN_W = 11; // フィールドの完全幅。壁を除くと10。
    let FIELD_LEN_H = 22; // フィールドの完全高さ。壁、テトリミノ出現領域分を除くと20。
    let WALL = 99; // 壁コード
    
    let matrix:[[Int]] = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
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
        view.backgroundColor = UIColor.white
        
        var px:Int = 0
        var py:Int = 0
        
        for y in 0...FIELD_LEN_H {
            px = 0
            for x in 0...FIELD_LEN_W {
                let rect = CAShapeLayer()
                rect.strokeColor = UIColor.black.cgColor
                if (matrix[y][x] == WALL) {
                    rect.fillColor = UIColor.green.cgColor
                }else{
                    rect.fillColor = UIColor.white.cgColor
                }
                rect.lineWidth = 1.0
                rect.path = UIBezierPath(rect:CGRect(x:px,y:py,width:CELL_SIZE,height:CELL_SIZE)).cgPath
                self.view.layer.addSublayer(rect)
                px += CELL_SIZE;
            }
            py += CELL_SIZE;
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
