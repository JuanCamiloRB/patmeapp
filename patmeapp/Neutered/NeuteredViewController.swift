//
//  NeuteredViewController.swift
//  patmeapp
//
//  Created by Juan Camilo on 14/01/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NeuteredDisplayLogic: AnyObject
{
  func displaySomething(viewModel: Neutered.Something.ViewModel)
}

class NeuteredViewController: ResourcesViewController, NeuteredDisplayLogic
{
  var interactor: NeuteredBusinessLogic?
  var router: (NSObjectProtocol & NeuteredRoutingLogic & NeuteredDataPassing)?
    var petObject: PetModel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backBrn: UIButton!
    @IBOutlet weak var neuteredBtn: UIButton!
    @IBOutlet weak var intacBtn: UIButton!
    // MARK: Object lifecycle
  
    @IBOutlet weak var addLater: UIButton!
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = NeuteredInteractor()
    let presenter = NeuteredPresenter()
    let router = NeuteredRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
      titleLbl.text = NSLocalizedString("neutered_view_title_txt_1", comment: "") + petObject.name + NSLocalizedString("neutered_view_title_txt_2", comment: "")
      
      intacBtn.setTitle(NSLocalizedString("neutered_view_title_btn_1", comment: ""), for: .normal)
      neuteredBtn.setTitle(NSLocalizedString("neutered_view_title_btn_2", comment: ""), for: .normal)
      
      addLater.setTitle(NSLocalizedString("neutered_view_title_btn_3", comment: ""), for: .normal)
      
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Neutered.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Neutered.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
    @IBAction func onIntactBtn(_ sender: Any) {
        sendNextScreen(neutured: false)
    }
    
    @IBAction func onLater(_ sender: Any) {
       sendNextScreen(neutured: nil)
     
    
    }
    @IBAction func onNeuteredBtn(_ sender: Any) {
        sendNextScreen(neutured: true)
    

    }
    
    @IBAction func onBackBtn(_ sender: Any) {
    goBackScreen()
     
    }
    func sendNextScreen(neutured: Bool?){
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterPetPictureViewController")as? RegisterPetPictureViewController
        petObject.neutered = neutured
        vc!.petObject =  petObject
       
        self.navigationController?.pushViewController(vc!, animated: true)
    
    }
    func goBackScreen(){
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GenereViewControllerViewController")as? GenereViewControllerViewController
        
        vc!.petObject =  petObject
       
        self.navigationController?.pushViewController(vc!, animated: true)
    
    }
}
