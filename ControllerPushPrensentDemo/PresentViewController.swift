//
//  PresentViewController.swift
//  AttributeSwift
//
//  Created by hans on 2018/3/27.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController ,UIViewControllerTransitioningDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                self.view.backgroundColor = UIColor.green
        let bt :UIButton = UIButton(frame: CGRect(x: 30, y: 280, width: 20, height: 20))
        let img = UIImage(named: "btnLayerClose")
        bt.setImage(img, for: .normal)
        bt.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(bt)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func click()  {
        let vc = ContentViewController()
        //'self.navigationController?.isNavigationBarHidden = false
        let nav :UINavigationController = self.presentingViewController! as! UINavigationController
       // nav.navigationBar.isHidden = false
        self.dismiss(animated: true) {
            
        }
        //nav.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.navigationBar.isHidden = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionPresenPushStyleAnimator() as? UIViewControllerAnimatedTransitioning
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionPresenPushStyleAnimator() as? UIViewControllerAnimatedTransitioning
    }

}
