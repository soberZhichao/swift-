//
//  FunctionViewController.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/8/10.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit

class FunctionViewController: UIViewController {
    
    let yuwen = "这是一个语文问题"
    var newArr: [Int]?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let function = testFunc
         
        print(home)
        print("hello"[keyPath: \.count])
        
        let a = ClassA()
        let b = ClassB()
        
        let observes = a.bind(\.name, to: b, \.text)
        
        a.name = "a 修改了名字"
        print(b.text)
        
        log(IfPrint: true, message: 1 > 2 ? "3" : "4")
        
        let question = ask { () -> String in
            return yuwen + "nuoli"
        }
        
        print(question)
        
        
        let array = [1,2,3]
        print("array:\(array)")
        newArr = array.lazy.map { ele -> Int in
            let element = ele * 2
            print("element:\(element)")
            return element
        }
        print("newArr:\(3)")

    }
    
    func ask(question:()->String) -> String{
        return question()
    }

    func testFunc(name na: String){
        print(na)
    }
    
    func log(IfPrint condition: Bool, message: @autoclosure ()->String, file: String = #file, function: String = #function, line: Int = #line){
        guard condition else {
            return
        }
        
        print(message() + "\n" + file + "\n" + function + "\n" + "\(line)")
    }
    

}

extension FunctionViewController{
    var home: String?{
        get{
            return "dddd"
        }
    }
}

extension NSObjectProtocol where Self: NSObject {
    func observe<A, Other>(_ keyPath: KeyPath<Self, A>, writeTo other: Other, _ otherKeyPath: ReferenceWritableKeyPath<Other, A>) -> NSKeyValueObservation where A: Equatable, Other: NSObjectProtocol{
        observe(keyPath, options: .new) { (_, change) in
            guard let newValue = change.newValue, other[keyPath: otherKeyPath] != newValue else{
                return
            }
            other[keyPath: otherKeyPath] = newValue
        }
    }
    
    func bind<A, Other>(_ keyPath: ReferenceWritableKeyPath<Self, A>, to other: Other, _ otherKeyPath: ReferenceWritableKeyPath<Other, A>) -> (NSKeyValueObservation, NSKeyValueObservation) where A: Equatable, Other: NSObject{
        let one = observe(keyPath, writeTo: other, otherKeyPath)
        let two = other.observe(otherKeyPath, writeTo: self, keyPath)
        return (one, two)
    }
}

class ClassA: NSObject{
    @objc dynamic var name: String?
}

class ClassB: NSObject{
    @objc dynamic var text: String?
}
