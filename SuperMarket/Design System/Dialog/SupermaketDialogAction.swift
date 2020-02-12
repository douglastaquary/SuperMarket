//
//  SupermaketDialogAction.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

@objc public final class SupermaketDialogAction: NSObject {
    
    public let title: String?
    public let handler: ((_ action: SupermaketDialogAction) -> Void)?
    
    @objc public init(title: String?, handler: ((_ action: SupermaketDialogAction) -> Void)?) {
        self.title = title
        self.handler = handler
        super.init()
    }
    
    @objc public static func ok(handler: ((_ action: SupermaketDialogAction) -> Void)? = nil) -> SupermaketDialogAction {
        return SupermaketDialogAction(title: "Ok", handler: handler)
    }
    
    @objc public static func cancel(handler: ((_ action: SupermaketDialogAction) -> Void)? = nil) -> SupermaketDialogAction {
        return SupermaketDialogAction(title: "Cancelar", handler: handler)
    }
    
}



