//
//  BirthdayViewController.swift
//  patmeapp
//
//  Created by Juan Camilo on 19/01/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BirthdayDisplayLogic: AnyObject
{
  func displaySomething(viewModel: Birthday.Something.ViewModel)
}
@IBDesignable
class BirthdayViewController: ResourcesViewController, BirthdayDisplayLogic
{
  var interactor: BirthdayBusinessLogic?
  var router: (NSObjectProtocol & BirthdayRoutingLogic & BirthdayDataPassing)?

    var day = String()
    var month = String()
    var year = String()
    var keyboardHeight = CGFloat(0)
    var monthD = String()
    var yearD = String()
   
    var switchBut = true
    var checkBtn = true
    var updatedString = String()
    
    var petObject: PetModel!
    var valueDate: Date?
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var tittleLbl: UILabel!
    @IBOutlet weak var switchB: UISwitch!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dayField: UITextField!

    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var contBtn: UIButton!
    
    @IBOutlet weak var addLater: UIButton!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var yearDont: UITextField!
    @IBOutlet weak var monthDont: UITextField!
    // MARK: Object lifecycle
    private var dayInput: PatMeMDCTextInput!
    private var controllerDay: MDCTextInputController!
    private var montInput: PatMeMDCTextInput!
    private var controllerMonth: MDCTextInputController!
    private var yearInput: PatMeMDCTextInput!
    private var controllerYear: MDCTextInputController!
    private var yearInputDont: PatMeMDCTextInput!
    private var controllerYearDont: MDCTextInputController!
    private var monthInputDont: PatMeMDCTextInput!
    private var controllerMonthDont: MDCTextInputController!

  
    @IBInspectable var setPlaceholderDay: String{
        get{
            
            return placeHolderDay
        }
        set(str){
            placeHolderDay = str
        }
    }
    @IBInspectable var setPlaceholderMonth: String{
        get{
            
            return placeHolderMonth
        }
        set(str){
            placeHolderMonth = str
        }
    }
    @IBInspectable var setPlaceholderYear: String{
        get{
            
            return placeHolderYear
        }
        set(str){
            placeHolderYear = str
        }
    }
    @IBInspectable var setPlaceholderMonthDont: String{
        get{
            
            return placeHolderMonthDont
        }
        set(str){
            placeHolderMonthDont = str
        }
    }
    @IBInspectable var setPlaceholderYearDont: String{
        get{
            
            return placeHolderYearDont
        }
        set(str){
            placeHolderYearDont = str
        }
    }
    private var placeHolderDay = "DD"
    private var placeHolderMonth = "MM"
    private var placeHolderYear = "YYYY"
    private var placeHolderMonthDont = "Months"
    private var placeHolderYearDont = "Years"
    
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
    let interactor = BirthdayInteractor()
    let presenter = BirthdayPresenter()
    let router = BirthdayRouter()
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
  
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
    setupInputDay()
    setupContollerDay()
      setupInputMonth()
      setupContollerMonth()
      setupInputYear()
      setupContollerYear()
      setupInputYearDont()
      setupContollerYearDont()
      setupInputMonthDont()
      setupContollerMonthDont()
      hideExact(hide: false)
      dayField.isHidden = true
      monthField.isHidden = true
      yearField.isHidden = true
      monthDont.isHidden = true
      yearDont.isHidden = true
      descLbl.text = NSLocalizedString("birthday_view_title_txt_5", comment: "")
    
      tittleLbl.text = String(format: NSLocalizedString("birthday_view_title_txt_3", comment: ""),petObject.name)
     
    hideKeyboardWhenTappedAround(onView: self.view)
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
      DispatchQueue.main.async {
      
          self.dayField.becomeFirstResponder()
          self.monthField.becomeFirstResponder()
      }
  }
    @objc func keyboardWillShow(notification:NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                  keyboardHeight = keyboardSize.height
               
                    // The 1st keyboardWillShow gets the keyboard size height then observer removed as no need to get keyboard height every time it shows or hides
                    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
                    
                    // Store KeyboardHeight in UserDefaults to use when in Edit Mode
                    UserDefaults.standard.set(keyboardHeight, forKey: "KeyboardHeight")
                    UserDefaults.standard.synchronize()
                }
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
  
     
    }
    private func setupInputDay(){
        //MARK: Text Input Setup
        
        if let _ = view.viewWithTag(1){return}
        dayInput = PatMeMDCTextInput()
        dayInput.setup()
        view.addSubview(dayInput)
        dayInput.placeholder = placeHolderDay
        dayInput.delegate = self
        NSLayoutConstraint.activate([
            (dayInput.topAnchor.constraint(equalTo: dayField.topAnchor)),
            (dayInput.bottomAnchor.constraint(equalTo: dayField.bottomAnchor)),
            (dayInput.leadingAnchor.constraint(equalTo: dayField.leadingAnchor)),
            (dayInput.trailingAnchor.constraint(equalTo: dayField.trailingAnchor))
        ])
    }
    
    private func setupContollerDay(){
        // MARK: Text Input Controller Setup
        
        controllerDay = MDCTextInputController(textInput: dayInput)
        controllerDay.setup()
      
        
    }
    private func setupInputMonth(){
        //MARK: Text Input Setup
        
        if let _ = view.viewWithTag(2){return}
        montInput = PatMeMDCTextInput()
        montInput.setup()
        view.addSubview(montInput)
        montInput.placeholder = placeHolderMonth
        montInput.delegate = self
        NSLayoutConstraint.activate([
            (montInput.topAnchor.constraint(equalTo: monthField.topAnchor)),
            (montInput.bottomAnchor.constraint(equalTo: monthField.bottomAnchor)),
            (montInput.leadingAnchor.constraint(equalTo: monthField.leadingAnchor)),
            (montInput.trailingAnchor.constraint(equalTo: monthField.trailingAnchor))
        ])
    }
    
    private func setupContollerMonth(){
        // MARK: Text Input Controller Setup
        
        controllerMonth = MDCTextInputController(textInput: montInput)
        controllerMonth.setup()
     
        
    }
    
    private func setupInputYear(){
        //MARK: Text Input Setup
        
        if let _ = view.viewWithTag(2){return}
        yearInput = PatMeMDCTextInput()
        yearInput.setup()
        view.addSubview(yearInput)
        yearInput.placeholder = placeHolderYear
        yearInput.delegate = self
        NSLayoutConstraint.activate([
            (yearInput.topAnchor.constraint(equalTo: yearField.topAnchor)),
            (yearInput.bottomAnchor.constraint(equalTo: yearField.bottomAnchor)),
            (yearInput.leadingAnchor.constraint(equalTo: yearField.leadingAnchor)),
            (yearInput.trailingAnchor.constraint(equalTo: yearField.trailingAnchor))
        ])
    }
    
    private func setupContollerYear(){
        // MARK: Text Input Controller Setup
        
        controllerYear = MDCTextInputController(textInput: yearInput)
        controllerYear.setup()
     
        
    }
    private func setupInputYearDont(){
        //MARK: Text Input Setup
        
        if let _ = view.viewWithTag(2){return}
        yearInputDont = PatMeMDCTextInput()
        yearInputDont.setup()
        view.addSubview(yearInputDont)
        yearInputDont.placeholder = placeHolderYearDont
        yearInputDont.delegate = self
        NSLayoutConstraint.activate([
            (yearInputDont.topAnchor.constraint(equalTo: yearDont.topAnchor)),
            (yearInputDont.bottomAnchor.constraint(equalTo: yearDont.bottomAnchor)),
            (yearInputDont.leadingAnchor.constraint(equalTo: yearDont.leadingAnchor)),
            (yearInputDont.trailingAnchor.constraint(equalTo: yearDont.trailingAnchor))
        ])
    }
    
    private func setupContollerYearDont(){
        // MARK: Text Input Controller Setup
        
        controllerYearDont = MDCTextInputController(textInput: yearInputDont)
        controllerYearDont.setup()
     
        
    }
    private func setupInputMonthDont(){
        //MARK: Text Input Setup
        
        if let _ = view.viewWithTag(2){return}
        monthInputDont = PatMeMDCTextInput()
        monthInputDont.setup()
        view.addSubview(monthInputDont)
        monthInputDont.placeholder = placeHolderMonthDont
        monthInputDont.delegate = self
        NSLayoutConstraint.activate([
            (monthInputDont.topAnchor.constraint(equalTo: monthDont.topAnchor)),
            (monthInputDont.bottomAnchor.constraint(equalTo: monthDont.bottomAnchor)),
            (monthInputDont.leadingAnchor.constraint(equalTo: monthDont.leadingAnchor)),
            (monthInputDont.trailingAnchor.constraint(equalTo: monthDont.trailingAnchor))
        ])
    }
    
    private func setupContollerMonthDont(){
        // MARK: Text Input Controller Setup
        
        controllerMonthDont = MDCTextInputController(textInput: monthInputDont)
        controllerMonthDont.setup()
     
        
    }
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Birthday.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Birthday.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    @IBAction func onContBtn(_ sender: Any) {
        petObject.isExactBirthday = switchB.isOn
        petObject.birthday = valueDate
        savePet()
    }
    
    @IBAction func onSwitchBtn(_ sender: UISwitch) {
      
        hideExact(hide: !sender.isOn)
    }
    func hideExact(hide: Bool){
        validBtn()
        dayInput.isHidden = hide
        montInput.isHidden = hide
        yearInput.isHidden = hide
        yearInputDont.isHidden = !hide
        monthInputDont.isHidden = !hide
        switchBut = !hide
        
    }
    
    func savePet(){
        ResourceService.savePet(petModel: petObject, completion: { (result) -> () in
            self.onResponseSave(petModelDTO: result)})
    
    }
    func onResponseSave(petModelDTO: PetModelDTO) -> Void{
        print("enviando datos")
        DispatchQueue.main.async {
            
            self.sendNextScreen()
        }
    }
    
    @IBAction func onBackBtn(_ sender: Any) {
       goBackScreen()
        
    }
    func sendNextScreen(){
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SuccesRegisterViewController")as? SuccesRegisterViewController
        
        // you can set any value stored in the destination VC here
        
        vc!.petObject = petObject
        self.navigationController?.pushViewController(vc!, animated: true)
    
    }
    func goBackScreen(){
        if petObject.specie == MainSpeciesEnum.other {
           var vc = UIStoryboard (name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterPetPictureViewController")as? RegisterPetPictureViewController
            
            vc!.petObject = petObject
            self.navigationController?.pushViewController(vc!, animated: true)
                
            
        }else{
            var vc = UIStoryboard (name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BreedViewController")as? BreedViewController
        vc!.petObject =  petObject
        self.navigationController?.pushViewController(vc!, animated: true)
            }
     
    
    }
    func validBtn(){
        var currenDate = Date()
        
        ageLbl.isHidden = true
        iconImg.isHidden = true
        valueDate = nil
        DispatchQueue.main.async {
            if self.switchB.isOn {
                self.contBtn.isHidden = !(!self.day.isEmpty && !self.month.isEmpty && !self.year.isEmpty && Int(self.year) ?? 1800 >= 1800)
            
                self.addLater.isHidden = !self.contBtn.isHidden
                
            
            if !self.contBtn.isHidden{
                
                self.valueDate = DateComponents(calendar: .current, year: Int(self.year), month: Int(self.month), day: Int(self.day)).date!
                var currentMonths = currenDate.months(from: self.valueDate!)
            var currentYear = Int(currentMonths / 12)
            currentMonths = currentMonths - currentYear * 12
            print(currentYear)
            print("Años")
            print(currentMonths)
            print("Meses")
                self.ageLbl.isHidden = false
                self.iconImg.isHidden = false
                self.ageLbl.text = String(format: NSLocalizedString("birthday_view_title_txt_1", comment: ""),self.petObject.name, currentYear, currentMonths)
                print(self.valueDate)
            }
        }else{
       
            self.contBtn.isHidden =  !((!self.monthD.isEmpty || !self.yearD.isEmpty) && (Int(self.monthD) != 0 || Int(self.yearD) != 0))
                self.addLater.isHidden =  !self.contBtn.isHidden
                
          
            if !self.contBtn.isHidden{
              
                var intYear = Int(self.yearD) ?? 0
                var intMonth = Int(self.monthD) ?? 0
                currenDate.addOrSubtractMonth(month: -(intMonth  + intYear  * 12))
            print(    currenDate.addOrSubtractMonth(month: -(intMonth  + intYear  * 12)))
                self.valueDate = currenDate.addOrSubtractMonth(month: -(intMonth  + intYear  * 12))
                self.valueDate!.get(.month)
                
                DateUtils.monthToString(intMonth: self.valueDate!.get(.month))
                self.ageLbl.isHidden = false
                self.iconImg.isHidden = false
                
                self.ageLbl.text = String(format: NSLocalizedString("birthday_view_title_txt_2", comment: ""),self.petObject.name, self.valueDate!.get(.year),  DateUtils.monthToString(intMonth: self.valueDate!.get(.month)))
                print(self.valueDate)
            }
        }
        }
    }
    func animateViewMoving (_ up:Bool, moveValue :CGFloat){
            let movementDuration:TimeInterval = 0.3
            let movement:CGFloat = ( up ? -moveValue : moveValue)
            UIView.beginAnimations( "animateView", context: nil)
            UIView.setAnimationBeginsFromCurrentState(true)
            UIView.setAnimationDuration(movementDuration )
            self.contBtn.frame = self.contBtn.frame.offsetBy(dx: 0,  dy: movement)
        self.addLater.frame = self.addLater.frame.offsetBy(dx: 0,  dy: movement)
            UIView.commitAnimations()
    print("Moviendo")
        
    }
    @IBAction func onLater(_ sender: Any) {
       savePet()
    }
    
}
extension BirthdayViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile numer validation
        
        let oldText = textField.text! as NSString
        var newText = oldText.replacingCharacters(in: range, with: string)
        var conver = Int(newText)
        if textField == dayInput {
            if  !(newText.isEmpty || (conver != nil && conver ?? 0 > 0 && conver ?? 32 < 32 ) ){
         
                return false
        
            }
            day = newText
       
        }
            if textField == montInput {
                if  !(newText.isEmpty || (conver != nil && conver ?? 0 > 0 && conver ?? 13 < 13 ) ){
                    
                    return false
                    
                }
        month = newText
    
                }
        if textField == yearInput {
            if  !(newText.isEmpty || (conver != nil && conver ?? 0 > 0 && conver ?? 3000 < 3000 ) ){
                
                return false
                
            }
    year = newText
       
            }
        if textField == yearInputDont {
            if  !(newText.isEmpty || (conver ?? 20 < 20 ) ){
                
                return false
                
            }
    yearD = newText
       
            }
        if textField == monthInputDont {
            if  !(newText.isEmpty || ( conver ?? 13 < 13 ) ){
                
                return false
                
            }
    monthD = newText
         
            }
       validBtn()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        DispatchQueue.main.async {
            self.animateViewMoving(false, moveValue: self.keyboardHeight )
        }
        print("down")
          
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        DispatchQueue.main.async {
            self.animateViewMoving(true, moveValue: self.keyboardHeight  )
        }
        print("up")
        if textField == dayInput {
           
            let texto = dayInput.text ?? ""
            if (texto.count >= 0 && texto.count < 3) {
       
            }
        
        }
        if textField == montInput {
           
            let texto = montInput.text ?? ""
            if (texto.count >= 0 && texto.count < 3) {
            }
        
        }
        if textField == yearInput {
          
            let texto = yearInput.text ?? ""
            if (texto.count >= 0 && texto.count < 3) {
            }
        
        }
        if textField == yearInputDont {
       
            let texto = yearInputDont.text ?? ""
            if (texto.count >= 0 && texto.count < 3) {

               
              
            }
        
        }
        if textField == monthInputDont {
          
            let texto = monthInputDont.text ?? ""
            if (texto.count >= 0 && texto.count < 3) {
        
               
              
            }
        
        }
        
    }
    
}
extension Date{
    func months(from date: Date) -> Int {
            return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
        
        }
    
    func addOrSubtractMonth(month:Int)->Date{
      return Calendar.current.date(byAdding: .month, value: month, to: Date())!
    }
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
            return calendar.component(component, from: self)
        }
}


