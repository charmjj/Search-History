//
//  Testing.swift
//  MarketData
//
//  Created by Charmaine Lim on 19/8/21.
//

import SwiftUI
import Foundation
// import UIKit

struct MyPasswordField: View {
    @State var text: String
    @State private var isRevealed = false
    @State private var isFocused = false
    @State private var isEnabled = true

    var body: some View {
        HStack {
            MyTextField(text: $text,
                        isRevealed: $isRevealed,
                        isFocused: $isFocused, isEnabled: $isEnabled)
            Button(action: {
                self.isRevealed.toggle()
                self.isFocused.toggle()
            }) {
                Image(systemName: self.isRevealed ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(.blue) //
            }
        }
            .foregroundColor(.black) //
            .padding()
            .border(isFocused ? Color.blue : Color.gray)
            .background(isFocused ? Color.white : Color.gray)
            .frame(height: 50)
    }
}

struct MyTextField: UIViewRepresentable {
    // 1
    @Binding var text: String
    @Binding var isRevealed: Bool
    @Binding var isFocused: Bool
    @Binding var isEnabled: Bool
    
     // 2
    func makeUIView(context: UIViewRepresentableContext<MyTextField>) -> UITextField {
        let tf = UITextField(frame: .zero)
        tf.isUserInteractionEnabled = true
        tf.delegate = context.coordinator
        return tf
    }

    func makeCoordinator() -> MyTextField.Coordinator {
        return Coordinator(text: $text, isEnabled: $isEnabled, isFocused: $isFocused)
    }

    // 3
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.isSecureTextEntry = !isRevealed
    }

    // 4
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        @Binding var isFocused: Bool
        @Binding var isEnabled: Bool

        init(text: Binding<String>, isEnabled: Binding<Bool>, isFocused: Binding<Bool>) {
            _text = text
            _isFocused = isFocused
            _isEnabled = isEnabled
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
               self.isFocused = true
            }
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.isFocused = false
            }
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return false
        }
    }
}

struct Testing_Previews: PreviewProvider {
    // @Binding var text: String
    static var previews: some View {
        MyPasswordField(text: "")
    }
}
