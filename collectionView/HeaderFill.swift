import UIKit

class HeaderFill: UICollectionReusableView {
    
    static let identifier = "HeaderFill"
    
    private let label: UILabel = {
        let labelHeader = UILabel()
        labelHeader.textColor = .black
        labelHeader.font = UIFont.boldSystemFont(ofSize: 20)
        labelHeader.translatesAutoresizingMaskIntoConstraints = false
        return labelHeader
    }()
    
    private let button: UIButton = {
        let buttonHeader = UIButton()
        buttonHeader.setTitleColor(UIColor.systemBlue, for: .normal)
        buttonHeader.translatesAutoresizingMaskIntoConstraints = false
        return buttonHeader
    }()
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.26)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    public func headerTextAndButton(titleSection: String, buttonSection: String) {
        label.text = titleSection
        button.setTitle(buttonSection, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(button)
        addSubview(line)
        addSubview(stackView)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderFill {
    
    func configure() {
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: line.bottomAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            line.bottomAnchor.constraint(equalTo: stackView.topAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
    }
}




