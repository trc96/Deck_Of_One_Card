//
//  CardController.swift
//  DeckOfOneCard35
//
//  Created by Todd Crandall on 8/4/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import Foundation
import class UIKit.UIImage

class CardController {
    
    static func fetchCard(completion: @escaping (Result<Card, CardError>) -> Void) {
        //Prepare URL
        guard let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1") else {return completion(.failure(.invalidURL))}
        print(baseURL)
        //Data Task
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            //Handler Errors
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            //Check for Data
            guard let data = data else {return completion(.failure(.noData))}
            //Decode
            do {
                let topLevel = try JSONDecoder().decode(TopLevelObject.self, from: data)
                guard let card = topLevel.cards.first else {return completion(.failure(.noData))}
                return completion(.success(card))
            } catch {
                print(error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            //.resume()
        }.resume()
    }
    
    static func fetchImage(for card: Card, completion: @escaping (Result<UIImage, CardError>) -> Void) {
        //Prepare URL
        let url = card.image
        //Data Task
        URLSession.shared.dataTask(with: url) {data, _, error in
            //Handle Errors
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            //Check for Data
            guard let data = data else {return completion(.failure(.noData))}
            //Decode
            guard let image = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
            return completion(.success(image))
            //.resume()
        }.resume()
    }
}
