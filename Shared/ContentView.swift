//
//  ContentView.swift
//  Shared
//
//  Created by Jason Ji on 11/30/20.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

struct ContentView: View {
    @State private var greenOn = false
    @State private var blueOn = false
    @State private var orangeOn = false
    
    @State private var stringToEdit = ""
    @State private var anotherStringToEdit = ""
    
    var body: some View {
        VStack {
            
            TextField("Focus on me please", text: self.$stringToEdit)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.red)
                .accessibility(identifier: "focus1")
            
            
            TextField("try focus on me", text: self.$anotherStringToEdit)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.red)
                .accessibility(identifier: "focus2")
            
            Rectangle()
                .fill(Color.green)
                .opacity(greenOn ? 1.0 : 0.5)
                .frame(width: 100, height: 100)
                .contentShape(Rectangle())
                .onTapGesture {
                    greenOn.toggle()
                    print("Tapped green")
                }
            Rectangle()
                .fill(Color.blue)
                .opacity(blueOn ? 1.0 : 0.5)
                .frame(width: 100, height: 100)
                .onTapGesture {
                    blueOn.toggle()
                    print("Tapped blue")
                }
            #if canImport(UIKit)
            Rectangle()
                .fill(Color.orange)
                .opacity(orangeOn ? 1.0 : 0.5)
                .frame(width: 100, height: 100)
                .overlay(
                    TappableView(onTap: {
                        orangeOn.toggle()
                        print("Tapped orange")
                    })
                )
            #endif
        }
    }
}

#if canImport(UIKit)
struct TappableView: UIViewRepresentable {
    let onTap: () -> ()
    
    func makeUIView(context: Context) -> TapView {
        print("makeUIView - TapView")
        return TapView {
            print("I was tapped from a UIKit workaround!")
            onTap()
        }
    }
    
    func updateUIView(_ uiView: TapView, context: Context) {
        print("updateUIView")
    }
}

class TapView: UIView {
    private let onTap: () -> ()
    
    init(onTap: @escaping () -> ()) {
        print("init TapView")
        self.onTap = onTap
        super.init(frame: .zero)
        
        addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(tapped))
        )
    }
    
    @objc func tapped() {
        print("tapped() from UITapGestureRecognizer")
        onTap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }
}
#endif

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
