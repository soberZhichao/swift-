//
//  StructAndClassViewController.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/8/17.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit

struct Person {

    var name = "lihua"
    var age = 13
    var sex: String {
        get {
            return "nv"
        }
        nonmutating set{
            print(newValue)
        }
        
    }

}

class StructAndClassViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let p: Person? = Person()
        p?.sex = "44"
        
        
        var req = HTTPRequest(path: "/home", headers: [:])
        var copy = req
        for x in 0..<5 {
            req.headers["X-RequestId"] = "\(x)"
//            req.path = "/switch"
//            copy.headers = ["X-RequestId": "\(x)"]
//            print("req:\(req.path)")
//            print("copy:\(copy.headers)")
        }
        
//        print("req:\(req.headers)")
//        print("copy:\(copy.headers)")
        
        var stack: List = [3,2,1]
        print(stack)
        
        let list = 1...3
        print(list.reversed())
        
        let aa = UserID(rawValue: "333")
        print(aa.rawValue)
        
        User.allCases
        
        let enu = User.name
        switch enu {
        case .name:
            break

        @unknown default:
            break
        }
        
        let line = Shape.line(Line(from: 222, to: 333))
        if case .line(let x) = line {
            print(x)
        }
        
    }
    
}

struct HTTPRequest {
    /// 结构体包装引用类型
    fileprivate class Storage {
        var path: String
        var headers: [String: String]
        init(path: String, headers: [String: String]) {
            self.path = path
            self.headers = headers
        }
    }
    
    private var storage: Storage
    
    init(path: String, headers: [String: String]) {
        storage = Storage(path: path, headers: headers)
    }
    
}

extension HTTPRequest {
    /// 暴露给外面参数
    var path: String {
        get{
            return storage.path
        }
        set{
            storageForWriting.path = newValue
        }
    }
    
    var headers: [String: String] {
        get{
            return storage.headers
        }
        set{
            storageForWriting.headers = newValue
        }
    }
    
    /// isKnownUniquelyReferenced 检查引用类型是否只有一个所有者
    /// 传递的实例没有其他强引用，返回true
    /// 反之，返回false
    /// isKnownUniquelyReferenced 接受的是inout参数，需要保证传入的参数不能被其他线程使用。该规则适用于所有inout参数
    private var storageForWriting: HTTPRequest.Storage {
        mutating get {
             if !isKnownUniquelyReferenced(&storage) {
                self.storage = storage.copy()
            }
            return storage
        }
    }

}

extension HTTPRequest.Storage {
    func copy() -> HTTPRequest.Storage {
        print("making a copy")
        return HTTPRequest.Storage(path: path, headers: headers)
    }
}

enum List<Element> {
    case end
    indirect case node(Element, next: List<Element>)
    
    func cons(_ x: Element) -> List {
        return .node(x, next: self)
    }
}


extension List: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        self = elements.reversed().reduce(.end) { partialList, element in
            
            partialList.cons(element)
        }
    }
}

struct UserID: RawRepresentable {

    var rawValue: String
            
}

enum User: CaseIterable {
    case name
    case age
}

enum Shape{
    case line(Line)
}

struct Line {
    var from: Float
    var to: Float
}
