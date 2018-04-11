//
//  NavRootViewController.swift
//  AttributeSwift
//
//  Created by hans on 2018/3/27.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

class NavRootViewController: UIViewController,UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .init(rawValue: 0)
        self.extendedLayoutIncludesOpaqueBars = true
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        let bt :UIButton = UIButton(frame: CGRect(x: 30, y: 0, width: 20, height: 20))
        let img = UIImage(named: "btnLayerClose")
        bt.setImage(img, for: .normal)
        bt.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(bt)
    }

    @objc func click()  {
        let vc = PresentViewController()
        //self.navigationController?.isNavigationBarHidden = true
//        self.navigationController?.present(vc, animated: true) {
//
//        }
        //self.transitioningDelegate = self
        vc.transitioningDelegate = self
        
        self.present(vc, animated: true) {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
//
//    }
//
//    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
//    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
//
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionDismissPopStyleAnimator() as? UIViewControllerAnimatedTransitioning
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionPresenPushStyleAnimator() as? UIViewControllerAnimatedTransitioning
    }

}
