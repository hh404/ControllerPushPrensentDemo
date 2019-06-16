//
//  NavRootViewController.swift
//  AttributeSwift
//
//  Created by hans on 2018/3/27.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

struct Item {
    var sectionTitle: String!
    var cellTitle: [String]!
}

class NavRootViewController: UIViewController,UIViewControllerTransitioningDelegate {

    var dataArray: [Item] = []
    var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width), style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.groupTableViewBackground
        let pushItem = Item(sectionTitle: "Push", cellTitle: ["recursion Push","push->present->push"])
        dataArray.append(pushItem)
        let presentItem = Item(sectionTitle: "Present", cellTitle: ["present->push->push","present->push->present->push"])
        dataArray.append(presentItem)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
//        self.edgesForExtendedLayout = .init(rawValue: 0)
//        self.extendedLayoutIncludesOpaqueBars = true
//        // Do any additional setup after loading the view.
//        self.view.backgroundColor = UIColor.red
//        let bt :UIButton = UIButton(frame: CGRect(x: 30, y: 0, width: 20, height: 20))
//        let img = UIImage(named: "btnLayerClose")
//        bt.setImage(img, for: .normal)
//        bt.addTarget(self, action: #selector(click), for: .touchUpInside)
//        self.view.addSubview(bt)
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


extension NavRootViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = self.dataArray[section]
        return item.cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let item = self.dataArray[indexPath.section]
        cell?.textLabel?.text = item.cellTitle[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = PresentViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let vc = PresentViewController()
            self.present(vc, animated: true, completion: nil)
        }
    }
}
