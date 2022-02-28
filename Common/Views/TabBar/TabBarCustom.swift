import UIKit

@IBDesignable class TabBarCustom: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var diaryAction: TabBarAction!
    @IBOutlet weak var taskAction: TabBarAction!
    @IBOutlet weak var documentAction: TabBarAction!
    @IBOutlet weak var homeOption: TabBarOption!
    @IBOutlet weak var petsOption: TabBarOption!
    @IBOutlet weak var mainOption: TabBarMainOption!
    
    private var options: Array<TabBarOption> = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        view = loadViewFromNib(nibName: "TabBarCustom")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        
        initialize()
        
        addSubview(view)
    }
 
    func loadViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func initialize() {
        homeOption.option = .home
        homeOption.isActive = true
        petsOption.option = .pets
        
        homeOption.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(optionTap(_:))))
        petsOption.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(optionTap(_:))))
        options = [homeOption, petsOption]
        
        diaryAction.action = .diary
        taskAction.action = .task
        documentAction.action = .document
        diaryAction.isHidden = true
        taskAction.isHidden = true
        documentAction.isHidden = true
        
        mainOption.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(mainOptionTap(_:))))
    }
    
    @objc func mainOptionTap(_ sender: UITapGestureRecognizer) {
        mainOption.isOpen = !mainOption.isOpen
        diaryAction.isHidden = !mainOption.isOpen
        taskAction.isHidden = !mainOption.isOpen
        documentAction.isHidden = !mainOption.isOpen
    }
    
    @objc func optionTap(_ sender: UITapGestureRecognizer) {
        if let pressedOption: TabBarOption = sender.view as? TabBarOption {
            for itOption in options {
                itOption.isActive = itOption.option == pressedOption.option;
            }
        }
    }
}
