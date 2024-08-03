//
//  LoadingWithSuccessView.swift
//  Deneme
//
//  Created by İbrahim Taşdemir on 2.08.2024.
//

import UIKit


@IBDesignable
public final class LoadingWithSuccessView: UIView {
    
    @IBOutlet public var contentView: UIView!
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }

    convenience init() {
        self.init(frame: .zero)
        commonInıt()
    }
    
    private func commonInıt() {
        Bundle.module.loadNibNamed("LoadingWithSuccessView", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInıt()
    }
}


public class LoadableElementPresentable {
    
    public let successView = LoadingWithSuccessView()
    private var workItem: DispatchWorkItem?
    
    public init(workItem: DispatchWorkItem? = nil) {
        self.workItem = workItem
    }
    
    public func contentWillLoadWithSuccess(withCompletion completion: (() -> Void)?) {
        workItem?.cancel()
    
        let newWorkItem = DispatchWorkItem { [self] in
            self.successView.layer.removeAllAnimations()
            self.configure()
            self.successView.alpha = 1
            UIView.animate(withDuration: 1.4) { [weak self] in
                self?.successView.alpha = 0
            } completion: { [weak self] value in
                completion?()
                self?.successView.removeFromSuperview()
            }
        }
     
        workItem = newWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: newWorkItem)
    }
    
    
    private func configure() {
        guard let window = UIApplication.topViewController() else {
            return
        }

        window.addSubview(successView)
        successView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            successView.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            successView.centerYAnchor.constraint(equalTo: window.centerYAnchor),
        ])
    }
}


fileprivate extension UIApplication {
    static func topViewController() -> UIWindow? {
       return UIApplication
            .shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .last
   }
    
}
