//
//  UIViewControllerExtension.swift
//  DeckOfOneCard35
//
//  Created by Todd Crandall on 8/4/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentErrorToUser(localizedError: LocalizedError) {
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
    
}
