//
//  launchScreen.swift
//  pou
//
//  Created by Joao Pedro Junior on 14/02/25.
//

import Foundation
import UIKit

extension UIColor {
    class var topGradient: UIColor {
        return UIColor(red: 167/255, green: 111/255, blue: 122/255, alpha: 1)
    }
    
    class var bottomGradient: UIColor {
        return UIColor(red: 112/255, green: 67/255, blue: 77/255, alpha: 1)
    }
}

class LinearGradientView: UIView {
    let topColor: UIColor = UIColor.topGradient
    let bottomColor: UIColor = UIColor.bottomGradient
    
    private let gradientLayer = CAGradientLayer()
    
    private let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "launch"))
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var imageHeightConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupGradient()
        setupImageView()
        startAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradient()
        setupImageView()
        startAnimation()
    }
    
    private func setupGradient() {
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupImageView() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        
        imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 1)
        imageHeightConstraint.isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func startAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.imageHeightConstraint.constant = 150
            UIView.animate(withDuration: 2.0, animations: {
                self.layoutIfNeeded()
            }, completion: { _ in
                NotificationCenter.default.post(name: Notification.Name("goToNextView"), object: nil)
            })
        }
    }
}
