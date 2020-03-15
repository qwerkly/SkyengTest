//
//  Alert.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 14.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import UIKit

extension Error {
    func present(on vc: UIViewController? = UIApplication.topmostViewController()) { Alert.present(error: self, on: vc) }
}

class Alert {
    static func present<T: Error>(error: T, on vc: UIViewController? = UIApplication.topmostViewController()) {
        if vc is UIAlertController { return }
        
        let alertVC = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
        alertVC.addAction(.init(title: "OK", style: .default, handler: nil))
        vc?.present(alertVC, animated: true, completion: nil)
    }
}
