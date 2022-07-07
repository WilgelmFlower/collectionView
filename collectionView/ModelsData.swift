import UIKit

struct Albums {
    
    enum TypeAlbum {
        case albumTwoRows
        case albumOneRow
        case firstListSection
        case secondListSection
    }

    let type: TypeAlbum
    let title: String
    let button: String?
    let albums: [Album]
}
struct Album {
    var title: String
    var image: UIImage?
    var numbersOfPhotos: Int
}

