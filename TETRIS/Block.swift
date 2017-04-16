//
//  Block.swift
//  TETRIS
//
//  Created by 石津恭輔 on 2017/04/13.
//  Copyright © 2017年 石津恭輔. All rights reserved.
//

import Foundation
import UIKit

class Block {
    
    init() {
        number = (Int)(arc4random_uniform(6))+1
        setElement(code: number)
    }
    
    
    var element:[[Int]] = [[0, 0, 0, 0],
                           [1, 1, 1, 1],
                           [0, 0, 0, 0],
                           [0, 0, 0, 0]]
    var color:CGColor = UIColor.white.cgColor
    
    var number:Int
    
    func setElement(code : Int) {
        
        switch (code) {
        case 1,10: // 棒形
            element =
                [[0, 0, 0, 0],
                 [1, 1, 1, 1],
                 [0, 0, 0, 0],
                 [0, 0, 0, 0]]
            
        case 2,20: // 正方形
            element =
                [[2, 2],
                 [2, 2]]
            
        case 3,30: // S字
            element =
                [[0, 3, 3],
                 [3, 3, 0],
                 [0, 0, 0]]
            
        case 4,40: // Z字
            element =
                [[4, 4, 0],
                 [0, 4, 4],
                 [0, 0, 0]]
            
        case 5,50: // J字
            element =
                [[5, 0, 0],
                 [5, 5, 5],
                 [0, 0, 0]]
            
        case 6,60: // L字
            element =
                [[0, 0, 6],
                 [6, 6, 6],
                 [0, 0, 0]]
        case 7,70: // L字
            element =
                [[0, 7, 0],
                 [7, 7, 7],
                 [0, 0, 0]]
        default:
            print(code)
        }
    }
    func setColor(code : Int) -> CGColor {
        
        switch (code) {
        case 1,10: // 棒形
            color = UIColor.cyan.cgColor
            
        case 2,20: // 正方形
            color = UIColor.yellow.cgColor
        case 330: // S字
            color = UIColor.green.cgColor
        case 4,40: // Z字
            color = UIColor.red.cgColor
            
        case 5,50: // J字
            color = UIColor.blue.cgColor
            
        case 6,60: // L字
            color = UIColor.orange.cgColor
        case 7,70: // L字
            color = UIColor.purple.cgColor
        default:
            color = UIColor.white.cgColor
        }
        return color
    }
    func getColor() -> CGColor {
        return self.color
    }
    func getElement() -> [[Int]] {
        return self.element
    }
    func getNumber() -> Int {
        return self.number
    }
}
