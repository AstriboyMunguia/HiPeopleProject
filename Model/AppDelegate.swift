//
//  AppDelegate.swift
//  HiPeopleProject
//
//  Created by Eduardo Geovanni Pérez Munguía on 29/07/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func applicationDidEnterBackground(_ application: UIApplication) {
        let batteryData = BatteryService.shared.getBatteryData()
        BatteryDataManager.shared.saveBatteryData(batteryData)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }
}
