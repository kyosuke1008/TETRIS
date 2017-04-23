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
        setImage(code: number)
    }
    
    
    var element:[[Int]] = [[0, 0, 0, 0],
                           [1, 1, 1, 1],
                           [0, 0, 0, 0],
                           [0, 0, 0, 0]]
    var image:String = ""
    
    var number:Int = 0
    
    func setElement(code : Int) {
        
        switch (code) {
        case 1: // 棒形
            element =
                [[0, 0, 0, 0],
                 [1, 1, 1, 1],
                 [0, 0, 0, 0],
                 [0, 0, 0, 0]]
            
        case 2: // 正方形
            element =
                [[2, 2],
                 [2, 2]]
            
        case 3: // S字
            element =
                [[0, 3, 3],
                 [3, 3, 0],
                 [0, 0, 0]]
            
        case 4: // Z字
            element =
                [[4, 4, 0],
                 [0, 4, 4],
                 [0, 0, 0]]
            
        case 5: // J字
            element =
                [[5, 0, 0],
                 [5, 5, 5],
                 [0, 0, 0]]
            
        case 6: // L字
            element =
                [[0, 0, 6],
                 [6, 6, 6],
                 [0, 0, 0]]
        case 7: // T字
            element =
                [[0, 7, 0],
                 [7, 7, 7],
                 [0, 0, 0]]
        default:
            print(code)
        }
    }
    func setImage(code : Int)  {
        
        switch (code) {
        case 1: // 棒形
            image = "1.png"
        case 2: // 正方形
            image = "2.png"
        case 3: // S字
            image = "3.png"
        case 4: // Z字
            image = "4.png"
            
        case 5: // J字
            image = "5.png"
            
        case 6: // L字
            image = "6.png"
        case 7: // L字
            image = "7.png"
        default:
            image = "7.png"
        }
    }
}
