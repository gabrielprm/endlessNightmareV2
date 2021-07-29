//
//  HapticsManager.swift
//  endlessNightmare
//
//  Created by Lucas Alexandre Amorim Leoncio on 23/07/21.
//

import Foundation
import UIKit

class HapticsManager {

    func oneVibrationHaptic() {
        DispatchQueue.main.async {
            let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
            
            selectionFeedbackGenerator.prepare()
            selectionFeedbackGenerator.selectionChanged()
        }
    }
    
    func twoVibrationHaptic(for type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            let notificationGenerator = UINotificationFeedbackGenerator()
            
            notificationGenerator.prepare()
            notificationGenerator.notificationOccurred(type)
        }
    }
}
