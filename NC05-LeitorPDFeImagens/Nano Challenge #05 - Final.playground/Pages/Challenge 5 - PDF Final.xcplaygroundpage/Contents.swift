//Nano challenge 05
//Bruna Gagliardi

import UIKit
import PlaygroundSupport
import PDFKit

class PDFViewController: UIViewController {
    
    public var PDFDocumentos: PDFDocument?
    public var titulo: String?
    public var backgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = backgroundColor
        
        if #available(iOSApplicationExtension 11.0, *){
            
            var pdfview: PDFView!
            
            pdfview = PDFView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
            
            pdfview.document = PDFDocumentos
            pdfview.displayMode = PDFDisplayMode.singlePageContinuous
            pdfview.autoScales = true
            
            self.view = pdfview
        }
        else {
            print("PDFKit is not supported for versions before iOS 11.0")
        }
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        label.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var imagePDF: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imagePDF = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imagePDF.contentMode = UIViewContentMode.scaleAspectFit
        
        self.addSubview(imagePDF)
        self.addSubview(nameLabel)
        
        
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // CollectionView DataSource
    private let nomesPDF: [String] = ["livro_receitas-docinhos", "livro_receitas-salgadinhos", "livro_receitas-brigadeiros", "livro_receitas-tradicionais"]
    
    private var arquivosPDF: [PDFDocument] = []
    
    override func loadView() {
        super.loadView()
        self.collectionView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
        
        
        //cria URL através dos nomes do array nomePDF
        for docPDF in nomesPDF {
            
            let url = Bundle.main.url(forResource: docPDF, withExtension: "pdf")
            arquivosPDF.append(PDFDocument(url: url!)!)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PDF Leitor"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nomesPDF.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath) as! MyCollectionViewCell
        
        // UIControlerViewCells does not have viewDidLoad method, so we have to set the value directly into the element (nameLabel in this case). It is not usual.
            //recebe o pdf do vetor
        cell.nameLabel.text = nomesPDF[indexPath.row]
        //cria uma thumbnail para apresentar na tela inicial 
        if let page = arquivosPDF[indexPath.row].page(at: 0) {
            let thumb = page.thumbnail(of: cell.bounds.size, for: PDFDisplayBox.cropBox)
            cell.imagePDF.image = thumb
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        let pdfViewController = PDFViewController()
        pdfViewController.PDFDocumentos = arquivosPDF[indexPath.row] as! PDFDocument
        pdfViewController.titulo = nomesPDF[indexPath.row] 
        navigationController?.pushViewController(pdfViewController, animated: true)
    }
    @objc func openWithNavigation() {
        let newVC = PDFViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 150, height: 150)
    }
    
}

PlaygroundPage.current.liveView = UINavigationController(rootViewController:CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))


