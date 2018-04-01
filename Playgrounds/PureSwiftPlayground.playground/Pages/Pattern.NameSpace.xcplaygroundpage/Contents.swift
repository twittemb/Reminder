//: [Previous](@previous)

import UIKit

struct ButtonNameSpace {
    private let button: UIButton

    init(with button: UIButton) {
        self.button = button
    }
}

extension ButtonNameSpace {
    func hello () {
        let title = self.button.title(for: .normal) ?? ""
        print ("Hello \(title)")
    }
}

struct MyNameSpace<Base> {

    private let base: Base

    init(with base: Base) {
        self.base = base
    }
}

extension UIButton {

    var namespace: ButtonNameSpace {
        return ButtonNameSpace(with: self)
    }
}

extension UIButton {
    var mynamespace: MyNameSpace<UIButton> {
        return MyNameSpace(with: self)
    }
}

extension UIImage {
    var mynamespace: MyNameSpace<UIImage> {
        return MyNameSpace(with: self)
    }
}

extension MyNameSpace where Base: UIButton {
    func hello () {
        let title = self.base.title(for: .normal) ?? ""
        print ("Hello \(title)")
    }
}

extension MyNameSpace where Base: UIImage {
    func hello () {
        let title = self.base.accessibilityHint ?? ""
        print ("Hello \(title)")
    }
}

let myButton = UIButton()
myButton.setTitle("My button", for: .normal)
myButton.namespace.hello()
myButton.mynamespace.hello()

let myImage = UIImage()
myImage.accessibilityHint = "My Image"
myImage.mynamespace.hello()

//: [Next](@next)
