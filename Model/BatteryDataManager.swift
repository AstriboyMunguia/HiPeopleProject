//
//  BatteryDataManager.swift
//  HiPeopleProject
//
//  Created by Eduardo Geovanni Pérez Munguía on 29/07/24.
//

import Foundation

class BatteryDataManager {
    static let shared = BatteryDataManager()
    private init() {}

    func saveBatteryData(_ data: [String: Any]) {
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: "batteryData")
    }

    func loadBatteryData() -> [String: Any]? {
        let defaults = UserDefaults.standard
        return defaults.dictionary(forKey: "batteryData")
    }
}

