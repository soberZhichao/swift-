//
//  StringViewController.swift
//  Swift-Learning
//
//  Created by 诺离 on 2020/9/7.
//  Copyright © 2020 HangZhou. All rights reserved.
//

import UIKit


class StringViewController: UIViewController {

    let a = AModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var str = "hello"
        print(String(format: "%p", str) )
        let indices = str.indices
        str = "ab💩de"
        for item in indices {
            print(str[item])
            print(str[...item])
        }
        
//        var c = [10, 20, 30]
//        print(String(format: "%p", c) )
//        var i = c.startIndex
//        while i != c.endIndex {
//            c[i] /= 5
//            i = c.index(after: i)
//            print(c)
//            print(String(format: "%p", c) )
//        }
//        print("==========")
//        var d = [100, 200, 300]
//        print(String(format: "%p", d) )
//        for item in d.indices {
//            d[item] /= 5
//            print(d)
//            print(String(format: "%p", d) )
//        }

//
//        var helloStr = "hello,world"
//        if let index = helloStr.firstIndex(of: ",") {
//            let subS = helloStr[...index]
//            print(subS)
//        }
//
//
//        view.backgroundColor = .white
//
//        a.ASign = {[unowned self] in
//            let b = BModel()
//            b.sign = {
//                print(a.text)
//            }
//        }
//
//        let testword = #"""
//        """"""""""""""""
//        """#
//
//        let line = "BLANCHE:   I don't want realism. I want magic!"
//        let charts = line.split(omittingEmptySubsequences: false) {
//            $0 == " "
//        }
//
//        print(charts)
                
        var joinA = "1,2,3,a"
        let intArr = joinA.split(separators: ",")
            .compactMap { (sub) -> Int? in
            return Int(sub)
        }
        print(intArr)

        let indeces = joinA.indices
        print(indeces)
        
        var subJoinA = joinA[joinA.startIndex...]
        var j = ["2", "2"]
        print(j.joined())
        
        
        let utf = joinA.utf8
        let nsrange = NSMakeRange(0, 2)
        let start = joinA.startIndex
        let end = joinA.endIndex
//        let range = start..<end
        let range = Range(NSRange(location: 0, length: 2))
        let aa = joinA as NSString
        aa.substring(with: NSRange(location: 0, length: 2))
        
        
        
        let ran = joinA.startIndex...
        
        joinA.enumerateSubstrings(in: ran, options: .byWords) { (str, ran, r, b) in
            
        }
        
        let nu = 1..<4

        let text = "click heare fore more info"
    
        let linkTarget = URL(string: "https://www/youtube.com/catch")
        
        let formatted = NSMutableAttributedString(string: text)
        if let linkRange = formatted.string.range(of: "click"){
            let nsRange = NSRange(linkRange, in: formatted.string)
            formatted.addAttribute(.link, value: linkTarget, range: nsRange)
        }
        print(formatted.string)
        if let queryRange = formatted.string.range(of: "fore") {
            let nsRange = NSRange(queryRange, in: formatted.string)
            var attributesRange = NSRange()
            let attributes = formatted.attributes(at: nsRange.location, effectiveRange: &attributesRange)
            print(attributes)
            if let effectiveRange = Range(attributesRange, in: formatted.string) {
                print(formatted.string[effectiveRange])
            }
        }
        
        let c = ("a" as Character)..."z"
        for c in [1...2] {
            
        }
        let sc = Unicode.Scalar(UInt32(9992))!...Unicode.Scalar(UInt32(9998))!
        for el in sc {
            print(String(el))
        }
        let unicos = "abc".unicodeScalars
        print(unicos)
        var chara = CharacterSet(unicos)
        print(chara)
        print(CharacterSet.alphanumerics)
        print(CharacterSet.whitespacesAndNewlines)
        
        let scalText = Unicode.Scalar("dddd")
        
        let scalars: [Unicode.Scalar] = ["😎", "$", "0"]
        for s in scalars {
            print(s, "-->", s.properties.isEmoji)
        }
        
        let cha = "a" as Character
        cha.isLetter
        let pin = "pin"
        let html: SafeHTML = "<p>html string\(pin) ddd \(raw: pin)</p>"
        print(html)
        debugPrint(html)
        print(String(describing: html))
        print(String(reflecting: html))
        
        struct StdErr: TextOutputStream {
            var errorStr: [String] = []
            mutating func write(_ string: String) {
                guard !string.isEmpty else {
                    return
                }
                
                errorStr.append(string)
                
                fputs(string, stderr)
            }
        }
        var standardError = StdErr()
        print(["1", "2", "3"], to: &standardError)
        print(["4"], to: &standardError)
        print(standardError)
        print(standardError)
        
        let rep = ["in the cloud": "on someone else's computer"]
        let ssss = "People find it convenient to store their data in the cloud."
        let res = rep.reduce(ssss) { (re, dic) -> String in
            re.replacingOccurrences(of: dic.key, with: dic.value)
        }
        print(res)
        
        var hook = ""
        _playgroundPrintHook = { text in
            hook += text + "111"
        }
        
        print(hook + "3333")
    }
    
    func doSomethingAttractive<T: CustomStringConvertible>(with value: T) {
        
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        a.touch()
    }

    
    deinit {
        print("StringViewController")
    }
}

// 字面量拓展
extension String {
    var htmlEscaped: String {
        return replacingOccurrences(of: "<", with: "&lt;").replacingOccurrences(of: ">", with: "&gt;")
    }
}

struct SafeHTML {
    private(set) var value: String
    
    init(unsafe html: String) {
        print(html + "===")
        self.value = html
    }
}

extension SafeHTML: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        print("++++")
        self.value = value
    }
}

extension SafeHTML: ExpressibleByStringInterpolation {
    init(stringInterpolation: SafeHTML) {
        print("stringInterpolation")
        self.value = stringInterpolation.value
    }

}

extension SafeHTML: StringInterpolationProtocol {
    init(literalCapacity: Int, interpolationCount: Int) {
        print("literalCapacity")
        self.value  = "起始拼接"
    }
    
    mutating func appendLiteral(_ literal: StringLiteralType) {
        //插值前字面量
        print("appendLiteral-\(literal)")
        value += literal
    }
    
    mutating func appendInterpolation<T>(_ x: T) {
        print("appendInterpolation")
        self.value += String(describing: x).htmlEscaped
        print(self.value)
    }
    
    // 拓展插值的其他处理
    mutating func appendInterpolation<T>(raw x: T) {
        print("appendInterpolation")
        self.value += String(describing: x)
        print(self.value)
    }
}

extension SafeHTML: CustomStringConvertible {
    var description: String{
        return value
    }
}

extension SafeHTML: CustomDebugStringConvertible {
    var debugDescription: String{
        return "debug" + value
    }
}

extension Unicode.Scalar: Strideable {
    public typealias Stride = Int

    public func distance(to other: Unicode.Scalar) -> Int {
        return Stride(other.value)-Stride(self.value)
    }
    
    public func advanced(by n: Int) -> Unicode.Scalar {
        return Unicode.Scalar(UInt32(Int(value) + n))!
    }
}

extension StringProtocol {
    
}

class AModel: NSObject {

    
    var text = "ddd"
    
    var ASign:(()->())?
    
    override init() {
        super.init()
        
    }
    
    func touch(){
        ASign?()

    }
    
    deinit {
        print("AModel")
    }
}

class BModel: NSObject {
    var text = "vvvvv"
    
    var sign:(()->())?
    
    override init() {
        super.init()
        sign?()
    }
    deinit {
        print("BModel")
    }
}


extension String {
    var allPrefixes: [Substring] {
        return [""] + indices.map({ (index) in
            return self[...index]
        })
    }
}

extension String {

    func split<S: Sequence>(separators: S) -> [SubSequence] where Character == S.Element {
        return split{
            print(Character.self)
            return separators.contains($0)
        }
    }
}
