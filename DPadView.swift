//
//  DPadView.swift
//  OpenBOR
//
//  Created by Yoshi Sugawara on 12/5/19.
//

import UIKit

// I took cues (copied) from Provenance's scheme here so credit goes to Joe Mattiello for this

enum DPadDirection: Int {
    case upLeft = 1
    case up
    case upRight
    case left
    case none
    case right
    case downLeft
    case down
    case downRight
}

protocol DPadDelegate: class {
    func dPad(_ dPad: DPadView, didPress direction: DPadDirection)
    func dPadDidRelease(_ dPad: DPadView)
}

class DPadView: UIView {
    weak var delegate: DPadDelegate?
    private var currentDirection: DPadDirection = .none

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .black
        alpha = 0.5
        // temporary: just show as boxes
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 2.0
        clipsToBounds = false
        isUserInteractionEnabled = true
    }
    
    func direction(for point: CGPoint) -> DPadDirection {
        let x: CGFloat = point.x
        let y: CGFloat = point.y
        if (x <= 0) || (x >= bounds.size.width) || (y <= 0) || (y >= bounds.size.height) {
            return .none
        }
        let column = Int((x / (bounds.size.width / 3)))
        let row = Int((y / (bounds.size.height / 3)))
        let direction = DPadDirection(rawValue: (row * 3) + column + 1)!
        return direction
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: self)
        let direction = self.direction(for: point)
        if direction != currentDirection {
            currentDirection = direction
            delegate?.dPad(self, didPress: currentDirection)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: self)
        let direction = self.direction(for: point)
        if direction != currentDirection {
            currentDirection = direction
            delegate?.dPad(self, didPress: currentDirection)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentDirection = .none
        delegate?.dPadDidRelease(self)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentDirection = .none
        delegate?.dPadDidRelease(self)
    }

}
