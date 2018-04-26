//
//  BaseViewController.swift
//  IRIS
//
//  Created by Rahman Mammadov on 4/10/18.
//  Copyright © 2018 com.newolab. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addKeyboardChangeFrameObserver(willShow: { [weak self](height) in
            //Update constraints here
            self?.view.setNeedsUpdateConstraints()
            }, willHide: { [weak self](height) in
                //Reset constraints here
                self?.view.setNeedsUpdateConstraints()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        removeKeyboardObserver()
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

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func addObserverForNotification(_ notificationName: Notification.Name, actionBlock: @escaping (Notification) -> Void) {
        NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: OperationQueue.main, using: actionBlock)
    }
    
    func removeObserver(_ observer: AnyObject, notificationName: Notification.Name) {
        NotificationCenter.default.removeObserver(observer, name: notificationName, object: nil)
    }
}

//MARK: - Keyboard handling
extension UIViewController {
    
    typealias KeyboardHeightClosure = (CGFloat) -> ()
    
    func addKeyboardChangeFrameObserver(willShow willShowClosure: KeyboardHeightClosure?,
                                        willHide willHideClosure: KeyboardHeightClosure?) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillChangeFrame,
                                               object: nil, queue: OperationQueue.main, using: { [weak self](notification) in
                                                if let userInfo = notification.userInfo,
                                                    let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
                                                    let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double,
                                                    let c = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt,
                                                    let kFrame = self?.view.convert(frame, from: nil),
                                                    let kBounds = self?.view.bounds {
                                                    
                                                    let animationType = UIViewAnimationOptions(rawValue: c)
                                                    let kHeight = kFrame.size.height
                                                    UIView.animate(withDuration: duration, delay: 0, options: animationType, animations: {
                                                        if kBounds.intersects(kFrame) { // keyboard will be shown
                                                            willShowClosure?(kHeight)
                                                        } else { // keyboard will be hidden
                                                            willHideClosure?(kHeight)
                                                        }
                                                    }, completion: nil)
                                                } else {
                                                    print("Invalid conditions for UIKeyboardWillChangeFrameNotification")
                                                }
        })
    }
    
    func removeKeyboardObserver() {
        removeObserver(self, notificationName: NSNotification.Name.UIKeyboardWillChangeFrame)
    }
}
