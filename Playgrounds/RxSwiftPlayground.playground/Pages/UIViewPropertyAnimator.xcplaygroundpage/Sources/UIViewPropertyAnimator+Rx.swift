import Foundation
import UIKit
import RxCocoa
import RxSwift

extension Reactive where Base == UIViewPropertyAnimator {

    /// Completable that when subscribed to, starts the animation
    /// and completes once the animation is ended
    public var animate: Completable {
        return Completable.create(subscribe: { (completable) -> Disposable in

            self.base.addCompletion({ (position) in
                if position == .end {
                    completable(.completed)
                }
            })

            self.base.startAnimation()

            return Disposables.create {
                self.base.stopAnimation(true)
            }
        })
    }

    /// Completable that when subscribed to, starts the animation after a delay
    /// and completes once the animation is ended
    ///
    /// - Parameter delay: the delay to apply to the animation start
    /// - Returns: the Completable that will send .completed once the animation is ended
    public func animate(afterDelay delay: Double) -> Completable {
        return Completable.create(subscribe: { (completable) -> Disposable in

            self.base.addCompletion({ (position) in
                if position == .end {
                    completable(.completed)
                }
            })

            self.base.startAnimation(afterDelay: delay)

            return Disposables.create {
                self.base.stopAnimation(true)
            }
        })
    }
}

extension UIViewPropertyAnimator {
    var rx: Reactive<UIViewPropertyAnimator> {
        return Reactive<UIViewPropertyAnimator>(self)
    }
}

