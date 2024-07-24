//
//  ButtonTouchSizeUP .swift
//  Weather
//
//  Created by Baek on 3/21/24.
//

import UIKit

class ButtonTouchSizeUp: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        super.point(inside: point, with: event)

        let touchArea = bounds.insetBy(dx: -60, dy: -50)
        return touchArea.contains(point)
    }

    func configure() {}
    func bind() {}
}
