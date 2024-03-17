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
        VStack(spacing: 10) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            if viewModel.isShowHelloWorld {
                title("Hello World")
            } else {
                title("Good Morning")
            }
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
            Image("kiyomizu")
                .overlay(
                    Text("Kiyomizzu")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .padding(),
                    alignment: .bottom
                )
                .clipShape(.capsule)
        }
        .padding()
    }
    
    private func title(_ value: String) -> Text {
        Text(value)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.blue)
    }
}

#Preview {
    ContentView()
}
