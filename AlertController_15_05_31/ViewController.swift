//
//  ViewController.swift
//  AlertController_15_05_31
//
//  Created by Chris Wardman on 31/05/2015.
//  Copyright (c) 2015 Chris Wardman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate, UIActionSheetDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func button01(sender: AnyObject) {
        
        depreciatedUIAlertView01()
        //newUIAlertController()
        //depreciatedUIActionSheet01()
        //depreciatedUIActionSheet02()
        //UIAlertControllerWithActions()
        //UIAlertControllerWithDestructiveButton()
        //UIAlertControllerLogInForm()
        //UIAlertControllerSignUpForm()
    }
    
////
////  UIAlertController.h
////  UIKit
////
////  Copyright (c) 2014 Apple Inc. All rights reserved.
////
//
//@availability(iOS, introduced=8.0)
//enum UIAlertActionStyle : Int {
//    
//    case Default
//    case Cancel
//    case Destructive
//}
//
//@availability(iOS, introduced=8.0)
//enum UIAlertControllerStyle : Int {
//    
//    case ActionSheet
//    case Alert
//}
//
//@availability(iOS, introduced=8.0)
//class UIAlertAction : NSObject, NSCopying {
//    
//    convenience init(title: String, style: UIAlertActionStyle, handler: ((UIAlertAction!) -> Void)!)
//    
//    var title: String { get }
//    var style: UIAlertActionStyle { get }
//    var enabled: Bool
//}
//
//@availability(iOS, introduced=8.0)
//class UIAlertController : UIViewController {
//    
//    convenience init(title: String?, message: String?, preferredStyle: UIAlertControllerStyle)
//    
//    func addAction(action: UIAlertAction)
//    var actions: [AnyObject] { get }
//    func addTextFieldWithConfigurationHandler(configurationHandler: ((UITextField!) -> Void)!)
//    var textFields: [AnyObject]? { get }
//    
//    var title: String?
//    var message: String?
//    
//    var preferredStyle: UIAlertControllerStyle { get }
//}


// depreciated UIAlertView
    
    func depreciatedUIAlertView01() {
        
        let alertView = UIAlertView(title: "Default Style",
            message: "A standard alert",
            delegate: self,
            cancelButtonTitle: "Cancel",
            otherButtonTitles: "OK")
        
        alertView.alertViewStyle = .Default
        alertView.show()
    }
    
    // delegate method
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex {
        case 0:
            println("something pressed")
        default:
            break
        }
    }
    
// new UIAlertController
    
    func newUIAlertController() {
        
        let alertController = UIAlertController(title: "Default style",
            message: "A standard alert",
            preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .Cancel) { (action) in
                println("Cancel tapped")
        }
        
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK",
            style: .Default) { (action) in
                println("OK tapped")
        }

        alertController.addAction(OKAction)
        
        presentViewController(alertController, animated: true) { _ in
            println("do something following the controller loading")
        }
    }
    
// depreciatedUIActionSheet
    
    func depreciatedUIActionSheet01() {
        
        let actionSheet = UIActionSheet(title: "Takes the appearance of the bottom bar if specified; otherwise, same as UIActionSheetStyleDefault.",
            delegate: self,
            cancelButtonTitle: "Cancel",
            destructiveButtonTitle: "Destroy")
        
        actionSheet.actionSheetStyle = UIActionSheetStyle.Default // no apparent change in ios8
        actionSheet.showInView(view)
    }
    
    func depreciatedUIActionSheet02() {
        
        let actionSheet = UIActionSheet(title: "Takes...",
            delegate: self,
            cancelButtonTitle: "Cancel",
            destructiveButtonTitle: "Destroy",
            otherButtonTitles: "OK",
            "title 1", "title 2")
        
        actionSheet.actionSheetStyle = UIActionSheetStyle.Automatic
        actionSheet.showInView(view)
    }
    
    // delegate method
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex {
        case 0:
            println("Destroy tapped")
        case 1:
            println("Cancel tapped")
        case 2:
            println("OK tapped")
        case 3:
            println("title 1 tapped")
        case 4:
            println("title 2 tapped")
        default:
            break
        }
    }
    
// new UIAlertController with actions
    
    func UIAlertControllerWithActions() {
        
        let alertController = UIAlertController(title: "Actions", message: "Takes the appearance of the bottom bar if specified; otherwise, same as UIActionSheetStyleDefault.", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel) { _ in
                println("Cancel tapped")
        }
        
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default) { _ in
                println("OK tapped")
        }
        
        alertController.addAction(OKAction)
        
        let destroyAction = UIAlertAction(title: "Destroy",
            style: UIAlertActionStyle.Destructive) { _ in
                println("Destroy tapped")
        }
        
        alertController.addAction(destroyAction)
        
        presentViewController(alertController,
            animated: true) { _ in
                println("show when alertController loads")
        }
        
    }
    
// new UIAlertController with destructive button
    
    func UIAlertControllerWithDestructiveButton() {
        
        let alertController = UIAlertController(title: "Title",
            message: "Message",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel) { _ in
                println("Cancel tapped")
        }
        
        alertController.addAction(cancelAction)
        
        let destroyAction = UIAlertAction(title: "Destroy",
            style: UIAlertActionStyle.Destructive) {_ in
                println("Destroy tapped")
        }
        
        alertController.addAction(destroyAction)
        
        presentViewController(alertController,
            animated: true) { _ in
                println("controller loaded")
        }
        
    }
    
// new UIAlertController login form
    
    func UIAlertControllerLogInForm() {
        
        let alertController = UIAlertController(title: "Title",
            message: "Message",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let loginAction = UIAlertAction(title: "Login",
            style: UIAlertActionStyle.Default) { _ in
                let loginTextField = alertController.textFields![0] as! UITextField
                let passwordTextField = alertController.textFields![1] as! UITextField
        }
        
        loginAction.enabled = false
        
        let forgotPasswordAction = UIAlertAction(title: "Forgot password",
            style: UIAlertActionStyle.Destructive) { _ in
            //
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel) { _ in
            //
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Login"
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification,
                object: textField,
                queue: NSOperationQueue.mainQueue()) { (notification) in
                    loginAction.enabled = textField.text != ""
            }
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
        }
        
        alertController.addAction(loginAction)
        alertController.addAction(forgotPasswordAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController,
            animated: true) { _ in
                println("Loading")
        }
    }
    
// new UIAlertController sign up form
    
    func UIAlertControllerSignUpForm() {
        
        let alertController = UIAlertController(title: "Title",
            message: "Message",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Email"
            textField.keyboardType = UIKeyboardType.EmailAddress
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password Confirmation"
            textField.secureTextEntry = true
        }

        presentViewController(alertController,
            animated: true) { _ in
                println("Loading")
        }
    }
}