//
//  AggregateViewController.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/5/8.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit
import CommonCrypto

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
        // 字典
        dicOperation()
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
        arrayC.forEach { (ele) in
            print("forEach=== \(ele)")
        }
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
        arrayD = [1,3,4,5,2]
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
        
        /// 分区
        let arrayAreaNum = arrayD.partition { (ele) -> Bool in
            ele > 2
        }
        print("分区不满足条件数量=== \(arrayAreaNum)，分区后排列情况\(arrayD)")

        let lexico = arrayD.lexicographicallyPrecedes([0,6]) { (ele1, ele2) -> Bool in
           ele1 > ele2
        }
        print("比较情况=== \(lexico)")
        
        
        var students = ["Ben", "Ivy", "Jordell", "Ben", "Maxime"]
        if let i = students.lastIndex(of: "Ben") {
            students[i] = "Benjamin"
        }
        print(students)
        // Prints "["Ben", "Ivy", "Jordell", "Benjamin", "Max"]"
        
        let numbers = [3, 7, 4, -2, 9, -6, 10, 1]
        if let firstNegative = numbers.first(where: { $0 < 0 }) {
            print("The first negative number is \(firstNegative).")
        }
        // Prints "The first negative number is -2."
        
        let a = 1...3
        let b = 1...10

        print(b.starts(with: a))
        // Prints "true"
        
        print(b.starts(with: a) { (num, ele) -> Bool in
            return false
        })
        
        let words = ["one", "two", "three", "four"]
        let numbers2 = 1...4

        for (word, number) in zip(words, numbers2) {
            print("\(word): \(number)")
        }
        // Prints "one: 1"
        // Prints "two: 2
        // Prints "three: 3"
        // Prints "four: 4"
        
        let array: [Int] = [1, 2, 2, 2, 3, 4, 4]
        var result: [[Int]] = array.isEmpty ? [] : [[array[0]]]
        for (previous, current) in zip(array, array.dropFirst()) {
            if previous == current {
                result[result.endIndex-1].append(current)
            } else {
                result.append([current])
            }
        }
        print(result)
         // [[1], [2, 2, 2], [3], [4, 4]]”
        
        print([1,2,3] + [3, 4,5,6])
        
        let slice = array[array.startIndex...]
        print(slice)
    }
}

extension AggregateViewController{
    private func dicOperation(){
        var dic = ["a": 1, "b": 2]
        print(dic["c"])
        
        var dictionary = ["a": 1, "b": 2]

        // Keeping existing value for key "a":
        dictionary.merge(["a": 3, "c": 4]) { (current, _) in current }
        // ["b": 2, "a": 1, "c": 4]

        // Taking the new value for key "a":
        dictionary.merge(["a": 5, "d": 6]) { (_, new) in new }
        // ["b": 2, "a": 5, "c": 4, "d": 6]

        print("hello".md5)
        print("hello".md5)

    }
}

extension Sequence where Element: Hashable {
    var frequencies: [Element:Int] {
        let frequencyPairs = self.map { ($0, 1) }
        return Dictionary(frequencyPairs, uniquingKeysWith: +)
    }
}

extension String {
    var md5:String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce("") { $0 + String(format:"%02x", $1)}
    }
}
