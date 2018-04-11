//
//  TransitionDismissPopStyleAnimator.swift
//  ControllerPushPrensentDemo
//
//  Created by hans on 2018/3/28.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

let kPPTransitionDismissPopStyleDuration = 0.3


class TransitionDismissPopStyleAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    //  Converted to Swift 4 by Swiftify v4.1.6659 - https://objectivec2swift.com/
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return kPPTransitionDismissPopStyleDuration
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
        toVCRect.origin.x = -screenWidth
        toVC?.view.frame = toVCRect
        fromVCRect.origin.x = screenWidth
        toVCRect.origin.x = 0
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {() -> Void in
            fromVC?.view.frame = fromVCRect
            toVC?.view.frame = toVCRect
        }, completion: {(_ finished: Bool) -> Void in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            //动画结束、取消必须调用
        })
    }

}
