//
//  NodePosition.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import Foundation
import SpriteKit

public struct NodePosition {
    static func nodePosition(row: Int) -> CGPoint {
        var x: CGFloat = 0
        var y: CGFloat = 0
        switch row{
            case 1:
                x = -292
                y = -91
            case 2:
                x = -264
                y = -127
            case 3:
                x = -233
                y = -165
            default:
                break
        }
        return CGPoint(x: x, y: y)
    }
}
