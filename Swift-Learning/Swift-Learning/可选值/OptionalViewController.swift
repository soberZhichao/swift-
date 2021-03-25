//
//  OptionalViewController.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/8/5.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit
infix operator !!
func !! <T>(wrapped: T?, failureText: @autoclosure () -> String) -> T {
    if let x = wrapped { return x }
    fatalError(failureText())
}
class OptionalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        optionalOperation()
    }
    
    func optionalOperation(){
        let stringNums = ["three", "1", "2"]
        let mayBeInts = stringNums.map {
            Int($0)
        }
        
        for ele in mayBeInts {
            print(ele)
            
        }
        
        for case let ele? in mayBeInts {
            print(ele)
        }
        
        for case .some(let ele) in mayBeInts {
            print(ele)
        }
        
        var j = 8
        while case 0..<10 = j {
            print(j)
            j += 1
        }
        
        for ele in mayBeInts {
            guard let `ele` = ele else {
//                continue
                break
//                return
            }
            
            print(ele)
        }
        
//        fatalError("fatalError test")
//        precondition(false, "test")

        print("continue break return")
        
        let c = clourse
        
        c("宵明", 3)
        
    }
    
    func test()-> Never{
        fatalError()
    }
    
    func clourse(name: String, age: Int){
        print(name, age)
    }
    
    struct person {
        var name: String
        var age: Int
    }
    
    

}
