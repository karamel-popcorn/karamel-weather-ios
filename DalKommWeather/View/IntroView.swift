//
//  IntroView.swift
//  Weather
//
//  Created by Baek on 2023/07/24.
//

import UIKit

final class IntroView: UIView {
    
    private lazy var introImageView: UIImageView = {
        let bounds = UIScreen.main.bounds
        let imageWidth: CGFloat = bounds.width/3
        let imageHeight: CGFloat = bounds.height/10
        
        let posX: CGFloat = (bounds.width - imageWidth)/2 + 10
        let posY: CGFloat = (bounds.height - imageHeight)/2 - 10
        
        let imageView = UIImageView(frame: CGRect(x: posX,
                                                  y: posY,
                                                  width: imageWidth,
                                                  height: imageHeight))
        imageView.image = UIImage(named: ImageNameEnum.introImage.name)
        imageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}

extension IntroView {
    private func commonInit() {
        //addIntroView()
        setupConstraint()
    }
    
    private func addIntroView() {
        self.backgroundColor = UIColor(hexCode: hexCodeEnum.karamel.hexCode)
    }
    
    private func setupConstraint() {
        //self.addSubview(introImageView)
    }
}
