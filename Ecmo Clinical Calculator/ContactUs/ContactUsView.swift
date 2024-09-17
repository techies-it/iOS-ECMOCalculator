//
//  ContactUsView.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 08/08/24.
//

import SwiftUI
import WebKit


//View
struct ContactUsView: View {
    @State private var isLandscape: Bool = false
    @State private var selectedURL: URL?
    @State private var showWebView = false

    var body: some View {
        GeometryReader { geometry in
            // Check if the device is in landscape mode
            let isLandscape = geometry.size.width > geometry.size.height
            
            Group {
                if isLandscape {
                    // In landscape mode, use ScrollView
                    ScrollView {
                        content
                    }
                } else {
                    // In portrait mode, no ScrollView
                    content
                }
            }
            .onAppear {
                self.isLandscape = isLandscape
            }
            .onChange(of: geometry.size) { _ in
                self.isLandscape = isLandscape
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    var content: some View {
        VStack(spacing: 0) {
            // Top Section with Title and Logo
            VStack(spacing: 44) {
                Text("Contact Us")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundStyle(.titleLabel)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                Image(.icEcmoLogoSettings)
                
                HStack(spacing: 0) {
//                    Spacer()
                    Image(.phone)
                        .frame(width: 50)
                        .padding(.horizontal,10)
//                    /*Spacer*/()
                    Text("1-800-874-ECMO(3266)")
                        .frame(maxWidth:.infinity)
                        .font(.system(size: 16))
                        .foregroundStyle(.white)
//                    Spacer()
                }
                .padding()
                .background(Color.tealBlue)
                .cornerRadius(5)
                .onTapGesture {
                    makePhoneCall(phoneNumber: "18008743266")
                }
            }
            .padding(.horizontal, 30)
            .background(Color.white)
            .padding(.bottom, 12)
            .frame(maxWidth: .infinity) // Stretch horizontally
            
            // Bottom Section with Options
            Spacer()
            VStack(spacing: 10) {
                ContactOptionView(icon: "ic_website", text: "Website") {
                    selectedURL = URL(string: "https://innovativeecmo.com/")
                    showWebView = true
                }
                ContactOptionView(icon: "ic_education", text: "Education") {
                    selectedURL = URL(string: "https://innovativeecmo.com/ecmo-education/")
                    showWebView = true
                }
                ContactOptionView(icon: "ic_contact", text: "Contact") {
                    selectedURL = URL(string: "https://innovativeecmo.com/contact/")
                    showWebView = true
                }
            }
            .padding(.horizontal, isLandscape ? 40 : 20) // Adjust padding based on orientation
            .padding(.vertical, 20)
            .background(Color.tealBlue)
            .cornerRadius(15, corners: [.topLeft, .topRight])
            .frame(maxWidth: .infinity, alignment: .bottom)
        }
        .sheet(isPresented: $showWebView) {
                    if let url = selectedURL {
                        WebViewWrapper(url: url)
                    }
        }
    }
    
    private func makePhoneCall(phoneNumber: String) {
        guard let url = URL(string: "tel://\(phoneNumber)"),
              UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

#Preview {
    ContactUsView()
}

struct ContactOptionView: View {
    let icon: String
    let text: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            Image(icon)
                .frame(height: 30, alignment: .leading)
                .padding(.leading, 20)
            Text(text)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(.black)
                .multilineTextAlignment(.leading)
                .padding(.leading, 10)
            Spacer()
        }
        .frame(height: 56)
        .background(Color.white)
        .cornerRadius(5)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        .onTapGesture {
            action()
        }
        .padding(.top, 10)
    }
}
