//
//  Ecmo_Clinical_CalculatorApp.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 08/08/24.
//

import SwiftUI

@main
struct Ecmo_Clinical_CalculatorApp: App {
    
    init() {
            clearUserDefaults()
        }
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
    
    private func clearUserDefaults() {
            let defaults = UserDefaults.standard
            let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach { key in
                defaults.removeObject(forKey: key)
            }
        }
}
