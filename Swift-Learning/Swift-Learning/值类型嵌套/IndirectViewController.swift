//
//  IndirectViewController.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/7/17.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit

class IndirectViewController: UIViewController {
    
    indirect enum Add {
        case none
        case Int(Add)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = Add.Int(.Int(.Int(.none)))
    }
    
}
