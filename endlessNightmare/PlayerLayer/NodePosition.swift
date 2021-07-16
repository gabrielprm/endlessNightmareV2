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
                x = -285
                y = -84
            case 2:
                x = -255
                y = -114
            case 3:
                x = -225
                y = -144
            default:
                break
        }
        return CGPoint(x: x, y: y)
    }
}
