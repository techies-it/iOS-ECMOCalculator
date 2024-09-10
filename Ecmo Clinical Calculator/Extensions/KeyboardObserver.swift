//
//  KeyboardObserver.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 08/09/24.
//

import Foundation
import Combine
import SwiftUI

class KeyboardObserver: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .sink { [weak self] notification in
                guard let self = self else { return }
                if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    let height = keyboardFrame.height
                    withAnimation {
                        self.keyboardHeight = height
                    }
                }
            }
            .store(in: &cancellables)
    }
}
 func dismissKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
