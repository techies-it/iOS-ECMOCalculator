//
//  CustomTabView.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 08/08/24.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: tabName
    
    var body: some View {
        HStack{
            TabView(image: tabName.calculator, selectedTab: $selectedTab)
            TabView(image: tabName.cannula, selectedTab: $selectedTab)
            TabView(image: tabName.support, selectedTab: $selectedTab)
                
        }
        .padding()
        .background(.white)
        .cornerRadius(15, corners: [.topLeft, .topRight])
        .shadow(color: .tabBarShadow ,radius: 9)
    }
}

#Preview {
    ContentView()
}

struct TabView: View {
    
    let image: tabName
    
    @Binding var selectedTab: tabName
    var body: some View {
        GeometryReader { button in
            Button {
                withAnimation (.linear(duration: 0.3)){
                    selectedTab = image
                }
            } label: {
                VStack{
                    Image("\(image)\(selectedTab == image ? "" : "_deactive")")
    //                    .offset(y: selectedTab == image ? -5 : 0)
                        .scaleEffect(selectedTab == image ? 1.2 : 1.0)
                        .padding(.bottom, 2)
                    switch image {
                    case .calculator:
                        Text("Calculator")
                            .font(.system(size: 11))
                            .foregroundColor(selectedTab == image ? Color.tealBlue : Color.tabBarText)
//                        tabName = "Calculator"
                    case .cannula:
                        Text("Cannula Selection")
                            .font(.system(size: 11))
                            .foregroundColor(selectedTab == image ? Color.tealBlue : Color.tabBarText)
                    case .support:
                        Text("Contact Us")
                            .font(.system(size: 11))
                            .foregroundColor(selectedTab == image ? Color.tealBlue : Color.tabBarText)
                    }
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 60)
//        .ignoresSafeArea()
    }
}
