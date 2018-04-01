//: [Previous](@previous)

import RxSwift
import RxCocoa
import PlaygroundSupport
import UIKit

infix operator ~>: AdditionPrecedence

@discardableResult
func ~>(left: UIViewPropertyAnimator, right: UIViewPropertyAnimator) -> UIViewPropertyAnimator{

    left.addCompletion { (_) in
        right.startAnimation()
    }

    return right
}

class AnimateViewController : UIViewController {

    lazy var button1: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 500, width: 100, height: 100))
        button.setTitle("With Rx", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.rx.tap.subscribe(onNext: { [unowned self] (_) in
            self.animator1.rx.animate
                .andThen(self.animator2.rx.animate)
                .andThen(self.animator3.rx.animate(afterDelay: 5))
                .subscribe()
                .disposed(by: self.disposeBag)
        }).disposed(by: self.disposeBag)
        return button
    }()

    lazy var button2: UIButton = {
        let button = UIButton(frame: CGRect(x: 150, y: 500, width: 100, height: 100))
        button.setTitle("With Operator", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.rx.tap.subscribe(onNext: { [unowned self] (_) in
            self.animator1 ~> self.animator2 ~> self.animator3
            self.animator1.startAnimation()
        }).disposed(by: self.disposeBag)
        return button
    }()

    lazy var button3: UIButton = {
        let button = UIButton(frame: CGRect(x: 270, y: 500, width: 100, height: 100))
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.rx.tap.subscribe(onNext: { [unowned self] (_) in
            self.box1.transform = .identity
            self.box2.transform = .identity
            self.box3.transform = .identity
        }).disposed(by: self.disposeBag)
        return button
    }()

    lazy var box1: UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = .red
        return view
    }()

    lazy var box2: UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 220, width: 100, height: 100))
        view.backgroundColor = .green
        return view
    }()

    lazy var box3: UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 340, width: 100, height: 100))
        view.backgroundColor = .blue
        return view
    }()

    lazy var animator1 = {
        UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in
            self.box1.transform = CGAffineTransform(translationX: 0, y: -100)
        }
    }()

    lazy var animator2 = {
        UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in
            self.box2.transform = CGAffineTransform(translationX: 0, y: -100)
        }
    }()

    lazy var animator3 = {
        UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in
            self.box3.transform = CGAffineTransform(translationX: 0, y: -100)
        }
    }()

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // construct the main view
        self.view.backgroundColor = .white
        self.view.addSubview(self.box1)
        self.view.addSubview(self.box2)
        self.view.addSubview(self.box3)
        self.view.addSubview(self.button1)
        self.view.addSubview(self.button2)
        self.view.addSubview(self.button3)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = AnimateViewController()

//: [Next](@next)
