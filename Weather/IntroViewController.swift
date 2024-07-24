//
//  ViewController.swift
//  Weather
//
//  Created by Baek on 2023/07/24.
//

import UIKit

final class IntroViewController: UIViewController {

    private let introView = IntroView()
    
    override func loadView() {
        super.loadView()
        view = introView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

