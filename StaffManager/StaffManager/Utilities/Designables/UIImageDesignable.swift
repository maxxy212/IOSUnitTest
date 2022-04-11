//
//  UIImageDesignable.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 09/04/2022.
//

import Foundation
import UIKit

@IBDesignable class VMUIImageView: UIImageView {
    private var _round = false
    @IBInspectable var round: Bool {
        set {
            _round = newValue
            makeRound()
        }get{
            return self._round
        }
    }
    
    override internal var frame: CGRect {
        set {
            super.frame = newValue
            makeRound()
        }get {
            return super.frame
        }
    }
    
    private func makeRound() {
        if self.round == true {
            self.clipsToBounds = true
            self.layer.cornerRadius = (self.frame.width + self.frame.height) / 4
        }else {
            self.layer.cornerRadius = 0
        }
    }
    
    override func layoutSubviews() {
        makeRound()
    }
}
