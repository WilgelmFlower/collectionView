import UIKit

/*
 struct SFSymbolItem: Hashable {
     let name: String
     let image: UIImage
     
     init(name: String) {
         self.name = name
         self.image = UIImage(systemName: name)!
     }
 }
 let dataItems = [
     SFSymbolItem(name: "video"),
     SFSymbolItem(name: "person.crop.square"),
     SFSymbolItem(name: "cube"),
     SFSymbolItem(name: "livephoto"),
     SFSymbolItem(name: "timelapse"),
     SFSymbolItem(name: "slowmo"),
     SFSymbolItem(name: "square.stack.3d.down.right"),
     SFSymbolItem(name: "camera.viewfinder"),
     SFSymbolItem(name: "square.and.arrow.down"),
     SFSymbolItem(name: "eye.slash"),
     SFSymbolItem(name: "trash"),
 ]


 */

class ViewController: UIViewController {
    
    let data = [
        
        Albums(type: .albumTwoRows, title: "My Albums", button: nil, albums: [
            Album(title: "Recents", image: #imageLiteral(resourceName: "image8"), numbersOfPhotos: 1092),
            Album(title: "WhatsApp", image: #imageLiteral(resourceName: "image11"), numbersOfPhotos: 109),
            Album(title: "Favourites", image: #imageLiteral(resourceName: "image2"), numbersOfPhotos: 24),
            Album(title: "Snapseed", image: #imageLiteral(resourceName: "image12"), numbersOfPhotos: 53),
            Album(title: "Lightroom", image: #imageLiteral(resourceName: "image7"), numbersOfPhotos: 666),
            Album(title: "VN", image: #imageLiteral(resourceName: "image3"), numbersOfPhotos: 235),
            Album(title: "Instagram", image: #imageLiteral(resourceName: "image5"), numbersOfPhotos: 192),
            Album(title: "Telegram", image: #imageLiteral(resourceName: "image6"), numbersOfPhotos: 14),
        ]),
        
        Albums(type: .albumOneRow, title: "People & Places", button: nil, albums: [
            Album(title: "Places", image: #imageLiteral(resourceName: "image9"), numbersOfPhotos: 11),
            Album(title: "Summer2021", image: #imageLiteral(resourceName: "image1"), numbersOfPhotos: 8),
            Album(title: "Winter2019", image: #imageLiteral(resourceName: "image7"), numbersOfPhotos: 10),
            Album(title: "Autumn2020", image: #imageLiteral(resourceName: "image4"), numbersOfPhotos: 100)
            
        ]),
        
        Albums(type: .list, title: "Media Types", button: nil, albums: [
        Album(title: "Videos", image: UIImage(systemName: "video")!, numbersOfPhotos: 84),
        Album(title: "Selfies", image: UIImage(systemName: "person.crop.square")!, numbersOfPhotos: 148)
        ])
        
        
      ]
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PhotoCell.self, forCellWithReuseIdentifier: "cell")
        cv.register(HeaderFill.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderFill.identifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItem()
        view.addSubview(collectionView)

        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let albumGroup = self.data[sectionIndex]
            switch albumGroup.type {
            case .albumTwoRows:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
                let contentInset = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 5)
                
                let topItem = NSCollectionLayoutItem(layoutSize: itemSize)
                topItem.contentInsets = contentInset
                
                let bottomItem = NSCollectionLayoutItem(layoutSize: itemSize)
                bottomItem.contentInsets = contentInset
                
                let nestedGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(190), heightDimension: .absolute(500)),
                    subitems: [topItem, bottomItem])
                
                let section = NSCollectionLayoutSection(group: nestedGroup)
                section.contentInsets = .init(top: 0, leading: 15, bottom: 20, trailing: 0)
                section.orthogonalScrollingBehavior = .groupPaging
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .estimated(44))
                
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize,
                                                                                elementKind: UICollectionView.elementKindSectionHeader,
                                                                                alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader]
                
                return section
                
            case .albumOneRow:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
                let contentInset = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 5)
                
                let Item = NSCollectionLayoutItem(layoutSize: itemSize)
                Item.contentInsets = contentInset
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(190), heightDimension: .absolute(500)),
                    subitems: [Item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 15, bottom: 20, trailing: 0)
                section.orthogonalScrollingBehavior = .groupPaging
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .estimated(44))
                
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize,
                                                                                elementKind: UICollectionView.elementKindSectionHeader,
                                                                                alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader]
                
                return section
       
               
            case .list:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                     heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(44))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                return section
            }
        }
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderFill.identifier, for: indexPath) as! HeaderFill
        header.headerText(titleSection: data[indexPath.section].title)
        return header
    }
    
    private func configureItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: nil)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].albums.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCell
        cell.data = self.data[indexPath.section].albums[indexPath.item]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 1.5, height: collectionView.frame.height / 3)
    }
}

class PhotoCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))
    }
    
    var data: Album? {
        didSet {
            guard let data = data else { return }
            photoItem.image = data.image
            sectionLabel.text = data.title
            numberPhotosLabel.text = String(data.numbersOfPhotos)
        }
    }
    
    fileprivate let sectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    fileprivate let numberPhotosLabel: UILabel = {
        let labelNumberPhotos = UILabel()
        labelNumberPhotos.textColor = .systemGray
        return labelNumberPhotos
    }()
    
    fileprivate let photoItem: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "image5")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(photoItem)
        contentView.addSubview(sectionLabel)
        setupLabelConstraint()
        setupIntLabelConstraint()
        setupPhotoItemConstraint()
        
    }
    
    private func setupPhotoItemConstraint() {
        photoItem.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photoItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        photoItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        photoItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setupLabelConstraint() {
        addSubview(sectionLabel)
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionLabel.centerYAnchor.constraint(equalTo: bottomAnchor),
            sectionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func setupIntLabelConstraint() {
        addSubview(numberPhotosLabel)
        numberPhotosLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberPhotosLabel.centerYAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 10),
            numberPhotosLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberPhotosLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            numberPhotosLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



