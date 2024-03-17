//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Shusuke Ota on 2024/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.blue)
                .padding(.all, 10)
            Button(action: {
                debugPrint("DEBUG: Tap button")
            }, label: {
                Text("Tap")
                    .font(.footnote)
                    .fontWeight(.thin)
                    .frame(width: 70, height: 30)
                    .border(.blue, width: 0.5)
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
