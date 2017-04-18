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

enum OperationType {
    case LEFT
    case RIGHT
    case DROP_OFF
    case ROLL
}

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
    var matrix:[[Int]] = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
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
    
    var block:Block = Block()
    
    var startX:Int = 4
    var startY:Int = -1
    
    func initUI() {
        var px:Int = 0
        var py:Int = 0
        for y in 0...FIELD_HEIGHT {
            px = 0
            for x in 0...FIELD_WIDTH {
                //壁だったら緑
                if (matrix[y][x] == WALL) {
                    self.view.layer.addSublayer(getRect(x: px, y: py, color: UIColor.gray.cgColor))
                } else {
                    self.view.layer.addSublayer(getRect(x: px, y: py, color: UIColor.white.cgColor))
                }
                //20px横にずらす
                px += BLOCK_SIZE
            }
            //20px縦に基準をずらす
            py += BLOCK_SIZE
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
        //背景を白に
        view.backgroundColor = UIColor.white
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onUpdate(_:)), userInfo: nil, repeats: true)
        
    }
    func onUpdate(_ timer : Timer){
        if(check(data:self.matrix,mino: self.block.element,startX: self.startX,startY: self.startY,operation: OperationType.DROP_OFF)){
            delete()
            drow(mino: block.element)
        }else{
            for y in 0...FIELD_HEIGHT {
                for x in 0...FIELD_WIDTH {
                    if (self.matrix[y][x] != 0 && matrix[y][x] < 10) {
                        self.matrix[y][x] = self.block.number*10
                    }
                }
            }
            self.startX = 4
            self.startY = 0
            delete()
            self.block = Block()
        }
    }
    func drow(mino:[[Int]]){
        var px:Int = 0
        var py:Int = 0
        var ield = fieldMapping(data: self.matrix,mino: mino,startX: self.startX,startY: self.startY)
        for y in 0...FIELD_HEIGHT {
            px = 0
            for x in 0...FIELD_WIDTH {
                //四角インスタンス
                if (ield[y][x] != 0  && matrix[y][x] != WALL && self.matrix[y][x] < 10) {
                    self.matrix[y][x] = ield[y][x]
                    self.view.layer.addSublayer(getRect(x: px, y: py, color: block.color))
                }else if (self.matrix[y][x] > 9 && matrix[y][x] < 99) {
                    self.matrix[y][x] = 100
                }
                
                //20px横にずらす
                px += BLOCK_SIZE
            }
            //20px縦に基準をずらす
            py += BLOCK_SIZE
        }
    }
    
    func delete(){
        var px:Int = 0
        var py:Int = 0
        for y in 0...FIELD_HEIGHT {
            px = 0
            for x in 0...FIELD_WIDTH {
                if (self.matrix[y][x] > 0 && matrix[y][x] < 10) {
                    self.matrix[y][x] = 0
                    self.view.layer.addSublayer(getRect(x: px, y: py, color: UIColor.white.cgColor))
                }
                //20px横にずらす
                px += BLOCK_SIZE
            }
            //20px縦に基準をずらす
            py += BLOCK_SIZE
        }
    }
    
    func check( data:[[Int]],mino:[[Int]],startX:Int,startY:Int,operation:OperationType)-> Bool {
        var px:Int
        var py:Int
        var code:Int
        
        var tempStartY = 0
        var tempStartX = 0
        
        switch operation {
            
        case OperationType.LEFT:
            print("")
        case OperationType.RIGHT:
            print("")
        case OperationType.DROP_OFF:
             tempStartY = startY+1
        case OperationType.ROLL:
            print("")
            
        default:
            print("")
            
        }
        
        if(tempStartY > 20){
            return false
        }
        
        for y in tempStartY..<tempStartY + mino[0].count{
            for x in startX..<startX + mino[0].count{
                px = x - startX; // テトロミノパターンデータ配列用のインデックス
                py = y - tempStartY; // テトロミノパターンデータ配列用のインデックス
                code = mino[py][px]
                if((code > 0 && data[y][x] > 9)){
                    return false
                }
            }
        }
        self.startY = tempStartY
        return true;
        
    }
    
    func fieldMapping( data:[[Int]],mino:[[Int]],startX:Int,startY:Int)-> [[Int]] {
        var px:Int
        var py:Int
        var code:Int
        
        var tmpData:[[Int]] = data
        for y in startY..<startY + mino[0].count{
            for x in startX..<startX + mino[0].count{
                px = x - startX // テトロミノパターンデータ配列用のインデックス
                py = y - startY // テトロミノパターンデータ配列用のインデックス
                code = mino[py][px]
                if(code != 0 && data[y][x] == 0){
                    tmpData[y][x] = code
                }
            }
        }
        
        return tmpData;
        
    }
    func getRollBlock(block:[[Int]]) -> [[Int]] {
        var tmpBlock:[[Int]] = block
        for i in 0..<block.count{
            for j in 0..<block.count{
                let ii = (block.count-1)-i
                tmpBlock[j][ii] = block[i][j]
            }
        }
       return tmpBlock
    }
    
    func getRect(x:Int,y:Int,color:CGColor)-> CAShapeLayer {
        let rect = CAShapeLayer()
        rect.strokeColor = UIColor.black.cgColor
        rect.fillColor = color
        //枠線サイズ
        rect.lineWidth = 1.0
        rect.path = UIBezierPath(rect:CGRect(x:x,y:y,width:BLOCK_SIZE,height:BLOCK_SIZE)).cgPath
        //描写
        return rect
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let rollBlock = getRollBlock(block: block.element)
        if(check(data:self.matrix,mino: rollBlock,startX: self.startX,startY: self.startY,operation: OperationType.ROLL)){
            delete()
            block.element = rollBlock
            drow(mino: block.element)
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
