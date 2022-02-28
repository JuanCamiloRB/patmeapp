import UIKit

@IBDesignable class Bubble: UIView {
    @IBOutlet private var view: UIView!
    @IBOutlet private weak var bubble: UIImageView!
    @IBOutlet private weak var bubbleBorder: UIImageView!
    
    var bubbleColor: UIColor = UIColor(named: "White")! {
        didSet {
            setBubbleColor()
        }
    }
    
    var bubbleBorderColor: UIColor = UIColor(named: "Black")! {
        didSet {
            setBubbleBorderColor()
        }
    }
    
    private func setBubbleColor() {
        bubble.tintColor = bubbleColor
    }
    
    private func setBubbleBorderColor() {
        bubbleBorder.tintColor = bubbleBorderColor
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
        view = loadViewFromNib(nibName: "Bubble")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        
        setBubbleColor()
        setBubbleBorderColor()
        
        addSubview(view)
    }
    
    func loadViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }}
