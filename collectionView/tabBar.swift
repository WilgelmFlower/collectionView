import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .systemBackground
           tabBar.tintColor = .label
           setupVCs()
    }
    
    func setupVCs() {
          viewControllers = [
              createNavController(for: ViewController(), title: NSLocalizedString("Library", comment: ""), image: UIImage(systemName: "photo.fill.on.rectangle.fill")),
              createNavController(for: ViewController(), title: NSLocalizedString("For You", comment: ""), image: UIImage(systemName: "heart.text.square")),
              createNavController(for: ViewController(), title: NSLocalizedString("Albums", comment: ""), image: UIImage(systemName: "square.stack.fill")),
              createNavController(for: ViewController(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass"))
          ]
      }

fileprivate func createNavController(for rootViewController: UIViewController,
                                                title: String,
                                                image: UIImage?) -> UIViewController {
      let navController = UINavigationController(rootViewController: rootViewController)
      navController.tabBarItem.title = title
      navController.tabBarItem.image = image
      navController.navigationBar.prefersLargeTitles = true
      rootViewController.navigationItem.title = "Albums"
      return navController
  }
}
