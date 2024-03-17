//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Shusuke Ota on 2024/3/17.
//

import SwiftUI

struct ContentView: View {
    @State var labelText = ""
    let viewModel = ContentViewModel()
    
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
                self.labelText = "Button Tapped"
                viewModel.isTapped = true
            }, label: {
                Text("Tap")
                    .font(.footnote)
                    .fontWeight(.thin)
                    .frame(width: 70, height: 30)
                    .border(.blue, width: 0.5)
            })
            Text(labelText)
                .font(.footnote)
                .fontWeight(.thin)
                .foregroundStyle(.red)
                .padding(.all, 10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
