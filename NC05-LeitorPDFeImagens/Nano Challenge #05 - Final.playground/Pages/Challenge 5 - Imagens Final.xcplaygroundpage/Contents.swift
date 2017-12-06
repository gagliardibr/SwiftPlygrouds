//Bruna Gagliardi

import UIKit
import PlaygroundSupport

class ImageViewController: UIViewController {
    
    public var images: UIImage?
    public var titulo: String?
    public var backgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = backgroundColor
            
            var imgView: UIImageView!
            
        imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
            //mantém o tamanho da imagem quan apresentada
        imgView.contentMode = UIViewContentMode.scaleAspectFit
            //recebe a imagem enviada pela collection view controller 
        imgView.image = images
            
            self.view = imgView
        }
    }


class MyCollectionViewCell: UICollectionViewCell {
    
    public var imageLeitor: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //formato da imagem da tela inicial 
        
        imageLeitor = UIImageView(frame: CGRect(x: 5, y: 0, width: frame.size.width - 10, height: frame.size.height))
            
        imageLeitor.contentMode = UIViewContentMode.scaleToFill
        
        self.addSubview(imageLeitor)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //vetor com as imagens
    private var images: [UIImage] = [#imageLiteral(resourceName: "IMG_0013.JPG"),#imageLiteral(resourceName: "IMG_0012.JPG"),#imageLiteral(resourceName: "IMG_0034.JPG"),#imageLiteral(resourceName: "IMG_0036.JPG"),#imageLiteral(resourceName: "IMG_0019.JPG")]
    
    override func loadView() {
        super.loadView()
        self.collectionView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fotos"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath) as! MyCollectionViewCell
            // envia as imagens para tela
            cell.imageLeitor.image = images[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        let imageViewController = ImageViewController()
            //envia as imagens para imageViewController.
        imageViewController.images = images[indexPath.row] 
        navigationController?.pushViewController(imageViewController, animated: true)
    }
    @objc func openWithNavigation() {
        let newVC = ImageViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 150, height: 150)
    }
    
}

PlaygroundPage.current.liveView = UINavigationController(rootViewController:CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))


