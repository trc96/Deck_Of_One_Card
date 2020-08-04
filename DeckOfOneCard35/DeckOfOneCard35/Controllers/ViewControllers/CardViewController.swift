//
//  CardViewController.swift
//  DeckOfOneCard35
//
//  Created by Todd Crandall on 8/4/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func drawButtomTapped(_ sender: Any) {
        CardController.fetchCard { [weak self] (result) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateViews(for: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    //MARK: - Methods
    func fetchImageAndUpdateViews(for card: Card) {
        CardController.fetchImage(for: card) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self?.cardLabel.text = "\(card.value) of \(card.suit)"
                    self?.cardImage.image = image
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}
