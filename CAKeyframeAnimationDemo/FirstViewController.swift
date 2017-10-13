//
//  FirstViewController.swift
//  CAKeyframeAnimationDemo
//
//  Created by lokizero00 on 2017/10/13.
//  Copyright © 2017年 lokizero00. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,CAAnimationDelegate {
    @IBOutlet weak var buttonFly:UIButton?
    @IBOutlet weak var redView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title="首页"
        self.view.backgroundColor=UIColor.white
        
        self.redView?.layer.cornerRadius=15.0
        self.redView?.isHidden=false
        
        buttonFly?.addTarget(self, action: #selector(self.cakFly), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func cakFly(){
        let animation=CAKeyframeAnimation(keyPath: "position")
        
        let p1=CGPoint(x: 15.0, y: 79.0)
        let p2=CGPoint(x: 320.0, y: 79.0)
        let p3=CGPoint(x: 15.0, y: 460.0)
        let p4=CGPoint(x: 320.0, y: 460.0)
        let p5=CGPoint(x: 15.0, y: 79.0)
        
        //赋值
//        animation.values = [NSValue(cgPoint:p1),NSValue(cgPoint:p2),NSValue(cgPoint:p3),NSValue(cgPoint:p4),NSValue(cgPoint:p5)]
        animation.values = [p1,p2,p3,p4,p5]
        //每个动作的时间百分比
        animation.keyTimes = [0.2,0.4,0.6,0.8,1.0]
        
        animation.delegate=self
        animation.duration=5.0
        
        self.redView?.layer.add(animation, forKey: "View-fly")
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        print("动画开始")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("动画结束")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
