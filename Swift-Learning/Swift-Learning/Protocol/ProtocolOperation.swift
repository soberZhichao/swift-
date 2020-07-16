//
//  ProtocolOperation.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/5/14.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit
protocol MyProtocol {
}

//MARK:- 由协议中来实现方法，遵循协议的类只需要调用就好
extension MyProtocol {
    /// 协议中的属性类方法
    var protocolName: String? {
        return "MyProtocol"
    }
     
    /// 协议中的方法
    func resultLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.frame = UIScreen.main.bounds
        label.numberOfLines = 0
        return label
    }
}

class ProtocolOperation: NSObject {

}
