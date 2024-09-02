//
//  SplashScreen.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 08/08/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive : Bool = false
    
    var body: some View {
        if isActive {
            ContentView()
        }else{
            VStack{
                ZStack{
                    Image(uiImage: .icSplashLogomdpi)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .background(Color.tealBlue)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
        

    }
}

#Preview {
    SplashScreen()
}
