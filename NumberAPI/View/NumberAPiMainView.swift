//
//  NumberAPiMainView.swift
//  NumberAPI
//
//  Created by user263604 on 8/12/24.
//

import SwiftUI

struct NumberAPiMainView: View {
    @StateObject var viewModel = NumberAPIViewModel()
    @State private var number: String = ""
    @State private var day: String = ""
    @State private var month: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Welcome to Number Game")
                .font(.title2)
                .fontWeight(.semibold)
            
            Divider()
            
            VStack {
                Text("Let's Play Number TRIVIA.")
                    .font(.title3)
                
                HStack {
                    Text("Enter Your Trivia Number")
                    
                    TextField("Enter number", text: $number)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .onSubmit {
                            viewModel.fetchTrivia(for: number)
                        }
                }
                
                Text(viewModel.trivia)
                    .frame(width: 350, height: 100)
                    .border(Color.black, width: 2)
                    .padding()
            }
            
            VStack {
                Text("Let's Play Date TRIVIA.")
                    .font(.title3)
                
                HStack {
                    Text("Enter Your Trivia Day")
                    
                    TextField("Enter day", text: $day)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .onSubmit {
                            fetchDateTrivia()
                        }
                }
                
                HStack {
                    Text("Enter Your Trivia Month")
                    
                    TextField("Enter month", text: $month)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .onSubmit {
                            fetchDateTrivia()
                        }
                }
                
                Text(viewModel.trivia)
                    .frame(width: 350, height: 100)
                    .border(Color.black, width: 2)
                    .padding()
            }
        }
        .padding()
    }
    
    private func fetchDateTrivia() {
        if !day.isEmpty && !month.isEmpty {
            viewModel.fetchTriviaDate(for: day, for: month)
        }
    }
}

#Preview {
    NumberAPiMainView()
}
