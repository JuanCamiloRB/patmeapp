//
//  LoginAuth0Presenter.swift
//  PatMe
//
//  Created by Juan Camilo on 9/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginAuth0PresentationLogic
{
  func presentSomething(response: LoginAuth0.Something.Response)
}

class LoginAuth0Presenter: LoginAuth0PresentationLogic
{
  weak var viewController: LoginAuth0DisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: LoginAuth0.Something.Response)
  {
    let viewModel = LoginAuth0.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
