//
//  Extensions.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 08/04/2022.
//

import Foundation
import UIKit
import AlamofireImage

extension String {
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let date = dateFormatter.date(from: self)
        return date
    }
}

extension UIImageView {
    func setImageWithURL(url : String) {
        let _url = URL(string: url)!
        self.af.setImage(withURL: _url)
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive event: UIEvent) -> Bool {
        return true
    }
    
    func presentFromRight(_ viewControllerToPresent: UIViewController, animated flag: Bool = false, completion: (() -> Void)? = nil) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        if let window = view.window {
            window.layer.add(transition, forKey: kCATransition)
        }
        present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    func presentAlert(_ title: String, _ message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let uiAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        present(uiAlert, animated: true)
    }
}
