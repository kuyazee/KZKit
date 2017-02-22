//
//  ErrorView.swift
//  SwipeRX
//
//  Created by Zonily Jame Pesquera on 19/10/2016.
//
//

import UIKit
import ObjectiveC

public extension UIView {
    fileprivate struct ErrorKeys {
        static var Message  = "KZErrorMessage"
    }
    
    public func showOverLayView(_ view:UIView) {
        if let _ = objc_getAssociatedObject(self, &ErrorKeys.Message) as? UIView {
            return
        }
        
        view.frame = bounds
        _ = makeErrorView(view)
    }
    
    public func hideOverlayView() {
        if let view = objc_getAssociatedObject(self, &ErrorKeys.Message) as? UIView {
            view.removeFromSuperview()
            objc_setAssociatedObject(self, &ErrorKeys.Message, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate func makeErrorView(_ view:UIView) -> UIView {
        objc_setAssociatedObject(self, &ErrorKeys.Message, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addSubview(view)
        return view
    }
    
}
