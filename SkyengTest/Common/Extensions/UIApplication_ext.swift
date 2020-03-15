//
//  UIApplication_ext.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 14.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import UIKit

extension UIApplication {
    class func topmostViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topmostViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topmostViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topmostViewController(controller: presented)
        }
        return controller
    }
}
