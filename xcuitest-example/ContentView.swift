//
//  ContentView.swift
//  xcuitest-example
//
//  Created by Jason Dobo on 13/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, world!")
            
            Button(action: {
                 print("Button was tapped!")
             }) {
                 Text("Tap Me")
                     .fontWeight(.bold)
                     .padding()
                     .frame(width: 200)
                     .background(Color.blue)
                     .foregroundColor(.white)
                     .cornerRadius(10)
             }
            
            Spacer()
            NavigationStack {
                HStack {
                    Text("Navigation")
                        .padding()
                    
                    NavigationLink(destination: ContentUpdateView()) {
                        Text("Go to Second View")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .navigationTitle("First View")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

