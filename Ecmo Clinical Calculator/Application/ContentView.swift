//
//  ContentView.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 08/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: tabName = .calculator
    @State private var isLandscape: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            
            VStack {
                ZStack {
                    switch selectedTab {
                    case .calculator:
                        CalculatorView()
                    case .cannula:
                        CannulaView()
                    case .support:
                        ContactUsView()
                    default:
                        CalculatorView()
                    }
                }
                .frame(maxHeight: .infinity)
                
                CustomTabView(selectedTab: $selectedTab)
                    .frame(maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.horizontal)
            }
            .background(backgroundColor(for: selectedTab, isLandscape: isLandscape))
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                self.isLandscape = isLandscape
            }
            .onChange(of: geometry.size) { _ in
                self.isLandscape = isLandscape
            }
        }
    }
    
    // Method to determine background color
    func backgroundColor(for tab: tabName, isLandscape: Bool) -> Color {
        if tab == .support {
            return isLandscape ? Color.clear : Color.tealBlue
        } else {
            return Color.clear
        }
    }
}

#Preview {
    ContentView()
}

enum tabName: String {
    case calculator = "calculator"
    case cannula = "cannula"
    case support = "support"    
}
