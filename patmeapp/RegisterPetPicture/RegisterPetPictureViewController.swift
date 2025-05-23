//
//  RegisterPetPictureViewController.swift
//  patmeapp
//
//  Created by Juan Camilo on 17/01/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Alamofire

protocol RegisterPetPictureDisplayLogic: AnyObject
{
  func displaySomething(viewModel: RegisterPetPicture.Something.ViewModel)
}

class RegisterPetPictureViewController: ResourcesViewController, RegisterPetPictureDisplayLogic, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
  var interactor: RegisterPetPictureBusinessLogic?
  var router: (NSObjectProtocol & RegisterPetPictureRoutingLogic & RegisterPetPictureDataPassing)?

    var photo = String()
    var petObject: PetModel!
    @IBOutlet weak var contBtn: UIButton!
    @IBOutlet weak var pickBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var addLater: UIButton!

    // MARK: Object lifecycle
  
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
    let interactor = RegisterPetPictureInteractor()
    let presenter = RegisterPetPicturePresenter()
    let router = RegisterPetPictureRouter()
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
      lblTitle.text = String(format: NSLocalizedString("register_Picture_view_title_txt_1", comment: ""),petObject.name)
      imageView.layer.cornerRadius = imageView.frame.size.width/2
      imageView.clipsToBounds = true
      imageView.layer.masksToBounds = true
      imageView.layer.borderWidth = 6
      addLater.setTitle(NSLocalizedString("register_Picture_view_title_btn_1", comment: ""), for: .normal)
      contBtn.setTitle(NSLocalizedString("register_Picture_view_btn_txt_1", comment: ""), for: .normal)
      contBtn.isHidden = true
      addLater.isHidden = false
      switch petObject.specie {
      case MainSpeciesEnum.dog:
          let image2:UIImage? = UIImage(named: "dogWithoutborder.svg")
          
          pickBtn.setBackgroundImage(image2, for: UIControl.State.normal)

      case MainSpeciesEnum.cat:
          let image2:UIImage? = UIImage(named: "cat_withoutborder.svg")
          
          pickBtn.setBackgroundImage(image2, for: UIControl.State.normal)

      case MainSpeciesEnum.bird:
          let image2:UIImage? = UIImage(named: "bird_withoutborder.svg")
          
          pickBtn.setBackgroundImage(image2, for: UIControl.State.normal)
          print("is a bird")
          
      case MainSpeciesEnum.horse:
          let image2:UIImage? = UIImage(named: "horse_withoutborder.svg")
          
          pickBtn.setBackgroundImage(image2, for: UIControl.State.normal)
          print("is a  horse")
          
      case MainSpeciesEnum.rabbit:
          let image2:UIImage? = UIImage(named: "rabbit_withoutborder.svg")
          
          pickBtn.setBackgroundImage(image2, for: UIControl.State.normal)
          print("is a rabbit")
          
      case MainSpeciesEnum.other:
          print("is a other")
      
      default:
          print("Have you done something new?")
      }
      
  }
    func conVali(){
      
        contBtn.isHidden = photo.isEmpty
        addLater.isHidden = !photo.isEmpty
            
            
        
    }
    @IBAction func onTakePic(_ sender: Any) {
        
        let imagePick = UIImagePickerController()
        imagePick.delegate = self
        imagePick.allowsEditing = true
        imagePick.modalPresentationStyle = .fullScreen
        let actionSh = UIAlertController(title: "Photo Source", message: "Open a source", preferredStyle: .actionSheet)
        actionSh.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePick.sourceType = .camera
                self.present(imagePick, animated: true, completion: nil)
                
            }else{
                print("Camera not avalaible")
                
            }
           
            
        }))
        
        actionSh.addAction(UIAlertAction(title: "Photo library", style: .default, handler: { (action: UIAlertAction) in imagePick.sourceType = .photoLibrary
            self.present(imagePick, animated: true, completion: nil)
    
        }))
        actionSh.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in self.imageView.image = nil
            self.photo = ""
            self.conVali()
        }))
        self.present(actionSh, animated: true, completion: nil)
        
        
      
    }
    // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        imageView.image = image
        photo = image.jpegData(compressionQuality:1)?.base64EncodedString() ?? ""
        print(photo)
        conVali()
        picker.dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
  func doSomething()
  {
    let request = RegisterPetPicture.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: RegisterPetPicture.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
    @IBAction func onBackBtn(_ sender: Any) {
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NeuteredViewController")as? NeuteredViewController
        
        // you can set any value stored in the destination VC here
       
        vc!.petObject =  petObject
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func onContBtn(_ sender: Any) {
        sendNextScreen(picture: photo)
    }
    
    @IBAction func onLater(_ sender: Any) {
        sendNextScreen(picture: nil)
        
    }
    func sendNextScreen(picture: String?){
        petObject.picture = picture
        if petObject.specie == MainSpeciesEnum.other {
           var vc = UIStoryboard (name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BirthdayViewController")as? BirthdayViewController
            
            vc!.petObject =  petObject
            self.navigationController?.pushViewController(vc!, animated: true)
                
            
        }else{
            var vc = UIStoryboard (name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BreedViewController")as? BreedViewController
        vc!.petObject =  petObject
        self.navigationController?.pushViewController(vc!, animated: true)
            }
    
    }
    func goBackScreen(){
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NeuteredViewController")as? NeuteredViewController
        
        vc!.petObject =  petObject
       
        self.navigationController?.pushViewController(vc!, animated: true)
    
    }
}
