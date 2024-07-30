//
//  HiPeopleProjectApp.swift
//  HiPeopleProject
//
//  Created by Eduardo Geovanni Pérez Munguía on 28/07/24.
//

import FirebaseCore
import SwiftUI
import Firebase

@main
struct HiPeopleProjectApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
