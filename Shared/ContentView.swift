//
//  ContentView.swift
//  Shared
//
//  Created by Jason Ji on 11/30/20.
//

import SwiftUI

struct ContentView: View {
    @State private var greenOn = false
    @State private var blueOn = false
    var body: some View {
        HStack {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
