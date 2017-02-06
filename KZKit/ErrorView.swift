//
//  ErrorView.swift
//  SwipeRX
//
//  Created by Zonily Jame Pesquera on 19/10/2016.
//
//

import UIKit
import ObjectiveC

class ErrorView: UIView {
    @IBOutlet private weak var imgPhoto: UIImageView!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var centerconstraint: NSLayoutConstraint!
    @IBOutlet private weak var lblMessage: UILabel!
    @IBOutlet private weak var backgroundView: UIView!
    
    var message:String? {
        get {
            return lblMessage.text
        }
        set(value) {
            lblMessage.text = value
        }
    }
    
    var image:UIImage? {
        get {
            return imgPhoto.image
        }
        set(value) {
            imgPhoto.image = value
        }
    }
    
    var bgColor: UIColor? {
        get {
            return backgroundView.backgroundColor
        }
        set(value) {
            backgroundView.backgroundColor = value
        }
    }
}


public extension UIView {
    private struct ErrorKeys {
        static var Action   = "KZErrorAction"
        static var Message  = "KZErrorMessage"
    }
    
    private func makeErrorWithMessage(message:String, image:UIImage?, backgroundColor:UIColor?) -> ErrorView {
        let errorView:ErrorView = KZEVHelper.frameWorkBundle!.loadNibNamed("ErrorView", owner: self, options: nil)?.first as! ErrorView
        errorView.layoutIfNeeded()
        errorView.backgroundColor = UIColor.clearColor()
        errorView.frame = UIScreen.mainScreen().bounds
        errorView.message = message
        errorView.centerconstraint.constant = errorView.lblMessage.frame.height * -1
        errorView.btnAction.hidden = true
        if image != nil {
            errorView.image = image
        }
        if backgroundColor != nil {
            errorView.bgColor = backgroundColor
        }
        return errorView
    }
    
    private func makeErrorWithAction(message:String, target:AnyObject?, action:Selector, image:UIImage?, backgroundColor:UIColor?) -> ErrorView {
        let errorView:ErrorView = KZEVHelper.frameWorkBundle!.loadNibNamed("ErrorView", owner: self, options: nil)?.first as! ErrorView
        errorView.layoutIfNeeded()
        errorView.backgroundColor = UIColor.clearColor()
        errorView.frame = bounds
        errorView.message = message
        errorView.centerconstraint.constant = (errorView.lblMessage.frame.height + errorView.btnAction.frame.height) * -1
        errorView.btnAction.layer.cornerRadius = 3
        errorView.btnAction.layer.borderColor = UIColor.darkGrayColor().CGColor
        errorView.btnAction.layer.borderWidth = 1
        errorView.btnAction.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        if image != nil {
            errorView.image = image
        }
        if backgroundColor != nil {
            errorView.bgColor = backgroundColor
        }
        return errorView
    }
    
    public func showErrorWithAction(message:String, target:AnyObject, action:Selector) {
        showErrorWithAction(message, target: target, action: action, image: nil, backgroundColor: nil)
    }
    
    public func showErrorWithAction(message:String, target:AnyObject, action:Selector, image:UIImage?, backgroundColor:UIColor?) {
        if let _ = objc_getAssociatedObject(self, &ErrorKeys.Message) as? UIView {
            return
        }
        
        let errorView = makeErrorWithAction(message, target: target, action: action, image: image, backgroundColor: backgroundColor)
        makeErrorView(errorView)
    }
    
    public func hideErrorView() {
        if let errorView = objc_getAssociatedObject(self, &ErrorKeys.Message) as? UIView {
            errorView.removeFromSuperview()
            objc_setAssociatedObject(self, &ErrorKeys.Message, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        if let errorView = objc_getAssociatedObject(self, &ErrorKeys.Action) as? UIView {
            errorView.removeFromSuperview()
            objc_setAssociatedObject(self, &ErrorKeys.Message, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func showErrorWithMessage(message:String, image:UIImage?, backgroundColor:UIColor?) {
        if let _ = objc_getAssociatedObject(self, &ErrorKeys.Message) as? UIView {
            return
        }
        
        let errorView = makeErrorWithMessage(message, image: image, backgroundColor: backgroundColor)
        makeErrorView(errorView)
    }
    
    public func showErrorWithMessage(message:String) {
        showErrorWithMessage(message, image: nil, backgroundColor: nil)
    }
    
    private func makeErrorView(view:ErrorView) -> ErrorView {
        objc_setAssociatedObject(self, &ErrorKeys.Message, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addSubview(view)
        return view
    }
    
    private func makeErrorViewWithAction(view:ErrorView) -> ErrorView {
        objc_setAssociatedObject(self, &ErrorKeys.Action, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addSubview(view)
        return view
    }
}
