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
    private struct ErrorKeys {
        static var Message  = "KZErrorMessage"
    }
    
    public func showOverLayView(view:UIView) {
        if let _ = objc_getAssociatedObject(self, &ErrorKeys.Message) as? UIView {
            return
        }
        
        view.frame = bounds
        makeErrorView(view)
    }
    
    public func hideOverlayView() {
        if let view = objc_getAssociatedObject(self, &ErrorKeys.Message) as? UIView {
            view.removeFromSuperview()
            objc_setAssociatedObject(self, &ErrorKeys.Message, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private func makeErrorView(view:UIView) -> UIView {
        objc_setAssociatedObject(self, &ErrorKeys.Message, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addSubview(view)
        return view
    }
    
}
