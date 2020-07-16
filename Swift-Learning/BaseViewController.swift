//
//  BaseViewController.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/7/8.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, MyProtocol {
    var printLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = resultLabel()
        label.text = protocolName
        view.addSubview(label)
        view.backgroundColor = .white
        extendedLayoutIncludesOpaqueBars = true
        printLable = label
    }

}
