import UIKit

class TabBarOption: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var iconActive: UIImageView!
    @IBOutlet weak var iconDisabled: UIImageView!
    var option: TabBarOptionEnum? = nil {
        didSet {
            setOptionProperties()
        }
    }
    var isActive: Bool = false {
        didSet {
            setOptionStatus()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        view = loadViewFromNib(nibName: "TabBarOption")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        
        setOptionStatus()
        
        addSubview(view)
    }
    
    func setOptionProperties() {
        guard option != nil else {
            return
        }
        iconDisabled.image = UIImage(named: option!.iconDisabled)
        iconActive.image = UIImage(named: option!.iconActive)
        name.text = option!.name
    }
    
    func setOptionStatus() {
        iconActive.isHidden = !isActive
        iconDisabled.isHidden = isActive
        
        name.textColor = isActive ? UIColor(named: "Black") : UIColor(named: "Gray")
    }
 
    func loadViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
