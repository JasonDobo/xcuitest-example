//
//  ContentUpdateView.swift
//  xcuitest-example
//
//  Created by Jason Dobo on 05/07/2025.
//

import SwiftUI

struct ContentUpdateView: View {
    @State private var number: Int = 0

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter number", value: $number, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            Button(action: {
                number += 1
            }) {
                Text("Increase")
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            Button(action: {
                number -= 1
            }) {
                Text("Decrease")
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    ContentUpdateView()
}
