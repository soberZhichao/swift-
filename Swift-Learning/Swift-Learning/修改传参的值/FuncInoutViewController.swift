//
//  FuncInoutViewController.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/7/8.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit

class FuncInoutViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var abc = 11
        change(variable: &abc)
        
        print(abc)
        
        printLable.text = "abc===>11 \n inout===>\(abc)"
        
    }
    

    func change(variable: inout Int) {
        variable *= 2
    }
    
}

class Cat {
    var name: String
    init(cat: String) {
        name = "cat"
    }
    
    convenience init(param: [String: String]) {
        self.init(cat: "cat")
        print(param)
    }
}

class Tiger: Cat {
//    let power: Int
//    override init() {
//        power = 10
//        super.init()
//        name = "tiger"
//
//    }
    
    func aaa(para: String = "default") {
        Tiger(param: ["aaa": "ccc"])
    }
    
    
}

