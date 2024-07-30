//
//  BatteryService.swift
//  HiPeopleProject
//
//  Created by Eduardo Geovanni Pérez Munguía on 29/07/24.
//

import Foundation
import UIKit

class BatteryService {
    static let shared = BatteryService()
    private init() {}

    func startBatteryMonitoring() {
        UIDevice.current.isBatteryMonitoringEnabled = true
    }

    func getBatteryData() -> [String: Any] {
        let batteryLevel = UIDevice.current.batteryLevel
        let batteryState = UIDevice.current.batteryState.rawValue
        return [
            "batteryLevel": batteryLevel,
            "batteryState": batteryState
        ]
    }
}
