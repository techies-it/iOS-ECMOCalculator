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
        .cornerRadius(25)
        .shadow(color: .tealBlue.opacity(1) ,radius: 9)
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
                Image("\(image)\(selectedTab == image ? "" : "_deactive")")
//                    .offset(y: selectedTab == image ? -5 : 0)
                    .scaleEffect(selectedTab == image ? 1.2 : 1.0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 60)
//        .ignoresSafeArea()
    }
}
