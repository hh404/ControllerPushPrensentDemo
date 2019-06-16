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
        let pushBt :UIButton = UIButton(frame: CGRect(x: 50, y: 180, width: 80, height: 20))
        pushBt.addTarget(self, action: #selector(push), for: .touchUpInside)
        pushBt.setTitle("Push", for: .normal)
        self.view.addSubview(pushBt)
        
        let popBt :UIButton = UIButton(frame: CGRect(x: 50, y: 240, width: 80, height: 20))
        popBt.addTarget(self, action: #selector(pop), for: .touchUpInside)
        popBt.setTitle("Pop", for: .normal)
        self.view.addSubview(popBt)
        
        let presentBt :UIButton = UIButton(frame: CGRect(x: 180, y: 180, width: 80, height: 20))
        presentBt.addTarget(self, action: #selector(presentVC), for: .touchUpInside)
        presentBt.setTitle("Present", for: .normal)
        self.view.addSubview(presentBt)
        
        let dismissbt :UIButton = UIButton(frame: CGRect(x: 180, y: 240, width: 80, height: 20))
        dismissbt.addTarget(self, action: #selector(disMiss), for: .touchUpInside)
        dismissbt.setTitle("Dismiss", for: .normal)
        self.view.addSubview(dismissbt)
        
        let backToRootWithPopToRoot :UIButton = UIButton(frame: CGRect(x: 50, y: 280, width: 280, height: 20))
        backToRootWithPopToRoot.addTarget(self, action: #selector(self.backToRootWithPopToRoot), for: .touchUpInside)
        backToRootWithPopToRoot.setTitle("backToRootWithPopToRoot", for: .normal)
        self.view.addSubview(backToRootWithPopToRoot)
        
        let backToRootWithDismiss :UIButton = UIButton(frame: CGRect(x: 50, y: 330, width: 280, height: 20))
        backToRootWithDismiss.addTarget(self, action: #selector(self.backToRootWithDismiss), for: .touchUpInside)
        backToRootWithDismiss.setTitle("backToRootWithDismiss", for: .normal)
        self.view.addSubview(backToRootWithDismiss)
        
        
        let changeRootVC :UIButton = UIButton(frame: CGRect(x: 50, y: 380, width: 280, height: 20))
        changeRootVC.addTarget(self, action: #selector(self.changeRootVC), for: .touchUpInside)
        changeRootVC.setTitle("changeRootVC", for: .normal)
        self.view.addSubview(changeRootVC)
        print("ViewDidLoad")
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
    
    
    @objc func push()  {
        let vc = PresentViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func presentVC()  {
        let vc = PresentViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func pop()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func disMiss()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func backToRootWithDismiss()  {
        //self.dismiss(animated: true, completion: nil)
        let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let root: UINavigationController = app.window?.rootViewController as! UINavigationController
        let vc = root.topViewController
        vc?.dismiss(animated: true, completion: nil)
        print("dd")
    }
    
    @objc func backToRootWithPopToRoot()  {
        //self.navigationController?.popToRootViewController(animated: true)
        let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let root: UINavigationController = app.window?.rootViewController as! UINavigationController
        root.popToRootViewController(animated: true)
    }
    
    @objc func changeRootVC()  {
        //self.navigationController?.popToRootViewController(animated: true)
        let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = ContentViewController()
        app.window?.rootViewController = vc
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.navigationBar.isHidden = false
    }
    
    deinit {
        print("Deinit")
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
