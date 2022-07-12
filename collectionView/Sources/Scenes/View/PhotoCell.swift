import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let reuseID = "HorizontalCollection"
    
    var data: Album? {
        didSet {
            guard let data = data else { return }
            photoImageView.image = data.image
            namePhotoLabel.text = data.title
            numberPhotosLabel.text = String(data.numbersOfPhotos)
        }
    }
    
    lazy var namePhotoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberPhotosLabel: UILabel = {
        let labelNumberPhotos = UILabel()
        labelNumberPhotos.textColor = .systemGray
        labelNumberPhotos.translatesAutoresizingMaskIntoConstraints = false
        return labelNumberPhotos
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "image5")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(photoImageView)
        contentView.addSubview(namePhotoLabel)
        contentView.addSubview(numberPhotosLabel)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotoCell {
    
    func configure() {
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            namePhotoLabel.centerYAnchor.constraint(equalTo: bottomAnchor),
            namePhotoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            namePhotoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            namePhotoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            numberPhotosLabel.centerYAnchor.constraint(equalTo: namePhotoLabel.bottomAnchor, constant: 10),
            numberPhotosLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberPhotosLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            numberPhotosLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}



