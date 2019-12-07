//
//  VirtualPadViewController.swift
//  OpenBOR
//
//  Created by Yoshi Sugawara on 12/5/19.
//

import UIKit

@objc class VirtualPadView: UIView {
    
    let dPadView: DPadView = {
        let dpad = DPadView(frame: .zero)
        return dpad
    }()
    
    convenience init() {
        self.init(frame: .zero)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        addSubview(dPadView)
        dPadView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        dPadView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        let size = bounds.size.width * 0.2
        dPadView.widthAnchor.constraint(equalToConstant: size).isActive = true
        dPadView.heightAnchor.constraint(equalToConstant: size).isActive = true
    }
}

class VirtualPadViewController: UIViewController {
    lazy var virtualPadView: VirtualPadView = {
        return VirtualPadView()
    }()
    
    override func loadView() {
        view = virtualPadView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        virtualPadView.dPadView.delegate = self
    }
}

extension VirtualPadViewController: DPadDelegate {
    func dPad(_ dPad: DPadView, didPress direction: DPadDirection) {
        
    }
    
    func dPadDidRelease(_ dPad: DPadView) {
        
    }
    
}
