//
//  HapticsManager.swift
//  endlessNightmare
//
//  Created by Lucas Alexandre Amorim Leoncio on 23/07/21.
//

import Foundation
import UIKit

final class HaptictsManager{
    static var shared = HaptictsManager()
    
    private init(){}
    
    public func selectionVibrate(){
        DispatchQueue.main.async {
            let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
            selectionFeedbackGenerator.prepare()
            selectionFeedbackGenerator.selectionChanged()
        }
    }
    
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            let notificationGenerator = UINotificationFeedbackGenerator()
            notificationGenerator.prepare()
            notificationGenerator.notificationOccurred(type)
        }
    }
}
