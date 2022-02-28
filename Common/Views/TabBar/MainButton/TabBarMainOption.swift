import UIKit

class TabBarMainOption: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var closeImage: UIImageView!
    var isOpen: Bool = false {
        didSet {
            setStatus()
        }
    }
    
    func setStatus() {
        addImage.isHidden = isOpen
        closeImage.isHidden = !isOpen
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
        view = loadViewFromNib(nibName: "TabBarMainOption")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        
        setStatus()
        
        addSubview(view)
    }
    
    func loadViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
