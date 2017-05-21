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
                           [1, 8, 1, 1],
                           [0, 0, 0, 0],
                           [0, 0, 0, 0]]
    
    var number:Int = 0
    
    func setElement(code : Int) {
        
        switch (code) {
        case 1: // 棒形
            element =
                [[0, 0, 0, 0],
                 [1, 8, 9, 10],
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
    func getImage(code : Int)->String  {
        
        switch (code) {
        case 1: // 棒形(カ)
            return "1.png"
        case 2: // 正方形
            return "2.png"
        case 3: // S字
            return "3.png"
        case 4: // Z字
            return "4.png"
            
        case 5: // J字
            return "5.png"
            
        case 6: // L字
            return "6.png"
        case 7: // L字
            return "7.png"
        case 8: // 棒形(ト)
            return "8.png"
        case 9: // 棒形(マ)
            return "9.png"
        case 10: // 棒形(イ)
            return "10.png"
        default:
            return "7.png"
        }
    }
}
