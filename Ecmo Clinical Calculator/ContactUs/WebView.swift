//
//  WebView.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 02/09/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            NotificationCenter.default.post(name: .webViewDidStartLoading, object: nil)
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            NotificationCenter.default.post(name: .webViewDidFinishLoading, object: nil)
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            NotificationCenter.default.post(name: .webViewDidFailLoading, object: nil)
        }
    }
}

extension Notification.Name {
    static let webViewDidStartLoading = Notification.Name("webViewDidStartLoading")
    static let webViewDidFinishLoading = Notification.Name("webViewDidFinishLoading")
    static let webViewDidFailLoading = Notification.Name("webViewDidFailLoading")
}

struct WebViewWrapper: View {
    @State private var isLoading: Bool = false
    let url: URL
    
    var body: some View {
        ZStack {
            WebView(url: url)
                .onReceive(NotificationCenter.default.publisher(for: .webViewDidStartLoading)) { _ in
                    isLoading = true
                }
                .onReceive(NotificationCenter.default.publisher(for: .webViewDidFinishLoading)) { _ in
                    isLoading = false
                }
                .onReceive(NotificationCenter.default.publisher(for: .webViewDidFailLoading)) { _ in
                    isLoading = false
                }
            
            if isLoading {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ActivityIndicatorView()
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}
