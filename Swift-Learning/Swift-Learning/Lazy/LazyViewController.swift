//
//  LazyViewController.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/7/16.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit

class LazyViewController: BaseViewController {

    lazy var lazyView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(lazyView)
    }
    

}
