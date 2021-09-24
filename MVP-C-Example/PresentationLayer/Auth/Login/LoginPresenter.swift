//
//  LoginPresenter.swift
//  PharmacyPortal
//
//  Created by vlad.kosyi on 20.10.2020.
//  Copyright © 2020 com.chisw. All rights reserved.
//

import Foundation

struct LoginPresenterRoutes {
    var onEnter: VoidBlock
    var onError: ((ErrorMessage) -> Void)?
}

protocol LoginPresenterProtocol {
    func enter()
}

class LoginPresenter: NSObject, LoginPresenterProtocol {
    
    private let authServices: AuthService
    private let userService: UserService
    private let loader = Loader()
    private var routes: LoginPresenterRoutes
    // MARK: - Init
    
    init(services: Services, routes: LoginPresenterRoutes) {
        self.authServices = services.authNetworkServices
        self.userService = services.userService
        self.routes = routes
        super.init()
    }
    
    func enter() {
        self.routes.onEnter?()
    }
}
