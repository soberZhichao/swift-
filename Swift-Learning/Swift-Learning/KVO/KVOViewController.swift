//
//  KVOViewController.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/7/19.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit

class KVOViewController: BaseViewController {
    var observation: NSKeyValueObservation?
    var another: AnotherClass!
    override func viewDidLoad() {
        super.viewDidLoad()

        another = AnotherClass()
        observation = another.observe(\.valueString, options: [.old, .new], changeHandler: { (anotherclass, change) in
            print(change.oldValue, change.newValue, anotherclass.valueString)
        })
        another.valueString = "changed string"
    }

}

/// KVO 在 NSObject才支持，所以想要在swift使用该模式需要以下两点
/// 重点：@objcMembers   Swift 4中的一个对此有影响的改变是继承 NSObject 的 swift class 不再默认全部 bridge 到 OC。所以这里要声明
/// 重点：dynamic
/// 不需要在对象被回收时手动 remove observer
@objcMembers class AnotherClass: NSObject{
    dynamic var valueString: NSString = "will change string"

    override init() {
        super.init()

    }
}

