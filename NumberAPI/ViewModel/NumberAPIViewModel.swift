//
//  NumberAPIViewModel.swift
//  NumberAPI
//
//  Created by user263604 on 8/12/24.
//

import Foundation

class NumberAPIViewModel: ObservableObject {
    @Published var trivia: String = "Enter a number to get trivia"
    
    func fetchTrivia(for number: String) {
        let urlString = "https://numbersapi.com/\(number)/trivia"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.trivia = "Invalid URL"
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let triviaResponse = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.trivia = triviaResponse
                }
            } else {
                DispatchQueue.main.async {
                    self.trivia = "Failed to fetch trivia"
                }
            }
        }.resume()
    }
    
    func fetchTriviaDate(for day: String, for month: String) {
        let urlString = "https://numbersapi.com/\(month)/\(day)/date"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.trivia = "Invalid URL"
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let triviaResponse = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.trivia = triviaResponse
                }
            } else {
                DispatchQueue.main.async {
                    self.trivia = "Failed to fetch trivia"
                }
            }
        }.resume()
    }
}
