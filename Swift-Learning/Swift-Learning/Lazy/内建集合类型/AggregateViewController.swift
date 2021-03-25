//
//  AggregateViewController.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/5/8.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit

class AggregateViewController: UIViewController {

    lazy var tip: UILabel = {
        let label = UILabel()
        label.frame = view.frame
        label.textAlignment = .center
        label.text = "请结合代码查看log日志"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tip)
        // 值类型
        valueType()
        // 数组
        arrayOperation()
    }
    
}

//MARK:- 值类型语义
extension AggregateViewController {
    private func valueType(){
        var arrayA = [1,2,3,4]
        let arrayB = arrayA
        print("===赋值之前地址变化===")
        print("arrayA=== \(arrayA)")
        print("arrayB=== \(arrayB)")
        print("===赋值之后地址变化===")
        arrayA.append(5)
        print("arrayA=== \(arrayA)")
        print("arrayB=== \(arrayB)")
        
        // 注意： “Swift 标准库中的所有集合类型都使用了“写时复制”这一技术”
        
    }
}

//MARK:- 数组相关
extension AggregateViewController {
    private func arrayOperation(){
        let arrayC = ["a", "b", "c", "d"]
        for ele in arrayC {
            print("迭代数组=== \(ele)")
        }
        
        print("删除数组第一个元素=== \(arrayC.dropFirst())")
        print("删除数组前两个元素=== \(arrayC.dropFirst(2))")
        print("删除数组后两个元素=== \(arrayC.dropLast(2))")

        for (index, ele) in arrayC.enumerated() {
            print("迭代数组=== \((index, ele))")
        }
        
        // 如果要向集合中添加已知数量的元素，请使用此方法避免多次重新分配
        // 分配比请求或多或少的存储
        var arrayD: [Int] = []
        arrayD.reserveCapacity(2)
        arrayD = [1,2,3,4,5]
        print("开辟数组空间=== \(arrayD)")

        let index = arrayC.index(after: 2)
        print("寻找元素的位置=== \(index)")
        let offsetIndex = arrayC.index(1, offsetBy: 1, limitedBy: arrayC.endIndex)!
        print("寻找元素的位置=== \(offsetIndex)")
        
        // 数组切片，前几位，后几位
        let prefix2 = Array(arrayD.prefix(2))
        print("数组前2位=== \(prefix2)")
        let arrayRange = Array(arrayD[2..<arrayD.endIndex])
        print("数组中间取值=== \(arrayRange)")

        // 数组变形
        let newArrayC = arrayC.map {
            $0 + "map"
        }
        print("map操作=== \(newArrayC)")
        
        let animals = ["ad", "bf", "ce"]
        let sortedAnimals = animals.sorted { (lhs, rhs) -> Bool in
//            let l = lhs.reversed()
//            let r = rhs.reversed()
            
            return lhs.lexicographicallyPrecedes(rhs)
        }
        
        print(sortedAnimals)
        
        let word = "Backwards"
        for char in word.reversed() {
            print(char, terminator: "")
        }

// Prints "sdrawkcaB"
        var a = Set<Int>()
        let arr = [1,1,1,4,4,4,4,1,1,1,1,1,4]
        while a.count < 2 {
            let indexS = Int(arc4random()%4)
            a.insert(arr[indexS])
        }
        
        print(Array(a))
        
        let randomSet = NSMutableSet()
        while randomSet.count < 2 {
            let r = arc4random() % UInt32(arr.count)
            randomSet.add( arr[Int(r)])
        }
        print(randomSet)

    }
    
}
