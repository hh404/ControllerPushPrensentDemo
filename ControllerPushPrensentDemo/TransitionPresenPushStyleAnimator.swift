//
//  File.swift
//  ControllerPushPrensentDemo
//
//  Created by hans on 2018/3/27.
//  Copyright © 2018年 hans. All rights reserved.
//

import Foundation
import UIKit
//  Converted to Swift 4 by Swiftify v4.1.6659 - https://objectivec2swift.com/
let kPPTransitionPresenPushStyleDuration = 0.3
class TransitionPresenPushStyleAnimator :NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return kPPTransitionPresenPushStyleDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC: UIViewController? = transitionContext.viewController(forKey: .from)
        let toVC: UIViewController? = transitionContext.viewController(forKey: .to)
        let container: UIView? = transitionContext.containerView
        let screenWidth: CGFloat = UIScreen.main.bounds.size.width
        var fromVCRect: CGRect = (fromVC?.view.frame)!
        fromVCRect.origin.x = 0
        fromVC?.view.frame = fromVCRect
        container?.addSubview((toVC?.view)!)
        var toVCRect: CGRect = (toVC?.view.frame)!
        toVCRect.origin.x = screenWidth
        toVC?.view.frame = toVCRect
        fromVCRect.origin.x = -screenWidth
        toVCRect.origin.x = 0
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {() -> Void in
            fromVC?.view.frame = fromVCRect
            toVC?.view.frame = toVCRect
        }, completion: {(_ finished: Bool) -> Void in
            fromVC?.view.removeFromSuperview()
            transitionContext.completeTransition(finished)
            //动画结束、取消必须调用
        })
    }
}
