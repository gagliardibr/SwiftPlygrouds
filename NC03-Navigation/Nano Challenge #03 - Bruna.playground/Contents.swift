

import UIKit
import PlaygroundSupport


// Segunda classe
class SecondViewController: UIViewController {
    
    public var titulo: String?
    //variavel que recebe os textos das 3 paginas
    public var labelText1: String?
    public var labelText2: String?
    public var labelText3: String?
    //variavel que recebe as  das 3 paginas
    public var image1: String = ""
    public var image2: String = ""
    public var image3: String = ""
    //Scroll
    public var scrollView = UIScrollView()
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
            // estanciando o Scroll
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSize(width: 2064, height: 520)
        
        scrollView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        scrollView.isPagingEnabled = true
        scrollView.flashScrollIndicators()
        scrollView.alwaysBounceVertical = false
        
        // criancao label do titulo
        let titulo1 = UILabel()
        titulo1.text = titulo
        titulo1.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
     //   titulo1.layer.backgroundColor = #colorLiteral(red: 0.803921580314636, green: 0.803921580314636, blue: 0.803921580314636, alpha: 1.0)
        titulo1.font = UIFont(name: "Helvetica", size: 30)
        titulo1.textAlignment = NSTextAlignment.center
        
        //criação das labels de texto 
        let label1 = UILabel()
        label1.text = labelText1
        label1.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
       // label1.layer.backgroundColor = #colorLiteral(red: 0.803921580314636, green: 0.803921580314636, blue: 0.803921580314636, alpha: 1.0)
        label1.numberOfLines = 0
        label1.font = UIFont(name: "helvetica", size: 22)
        label1.textAlignment = NSTextAlignment.justified
        let label2 = UILabel()
        label2.text = labelText2
        label2.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
       // label2.layer.backgroundColor = #colorLiteral(red: 0.803921580314636, green: 0.803921580314636, blue: 0.803921580314636, alpha: 1.0)
        label2.font = UIFont(name: "helvetica", size: 22)
        label2.numberOfLines = 0
        label2.textAlignment = NSTextAlignment.justified
        let label3 = UILabel()
        label3.text = labelText3
        label3.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        //label3.layer.backgroundColor = #colorLiteral(red: 0.803921580314636, green: 0.803921580314636, blue: 0.803921580314636, alpha: 1.0)
        label3.font = UIFont(name: "helvetica", size: 22)
        label3.numberOfLines = 0
        label3.textAlignment = NSTextAlignment.justified
        
        //criação das imagens 
        let imageTela1 = UIImage(named: image1)
        let imageView1 = UIImageView(image: imageTela1)
        let imageTela2 = UIImage(named: image2)
        let imageView2 = UIImageView(image: imageTela2)
        let imageTela3 = UIImage(named: image3)
        let imageView3 = UIImageView(image: imageTela3)
        

            //estanciando textos, titulo e imagens na view e na Scrollview
        view.addSubview(scrollView)
        view.addSubview(titulo1)
        scrollView.addSubview(imageView1)
        scrollView.addSubview(imageView2)
        scrollView.addSubview(imageView3)
        scrollView.addSubview(label1)
        scrollView.addSubview(label2)
        scrollView.addSubview(label3)
        
        
        //Layout
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        titulo1.translatesAutoresizingMaskIntoConstraints = false
        label1.translatesAutoresizingMaskIntoConstraints = false
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            titulo1.heightAnchor.constraint(equalToConstant: 400),
            titulo1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            titulo1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            titulo1.widthAnchor.constraint(equalToConstant: 678),
            titulo1.heightAnchor.constraint(equalToConstant: 50),
            
            imageView1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            imageView1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            imageView1.widthAnchor.constraint(equalToConstant: 678),
            imageView1.heightAnchor.constraint(equalToConstant: 350),
            
            label1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 360),
            label1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            label1.widthAnchor.constraint(equalToConstant: 678),
            label1.heightAnchor.constraint(equalToConstant: 387),
            
            imageView2.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            imageView2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 693),
            imageView2.widthAnchor.constraint(equalToConstant: 678),
            imageView2.heightAnchor.constraint(equalToConstant: 350),
            
            label2.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 360),
            label2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 693),
            label2.widthAnchor.constraint(equalToConstant: 678),
            label2.heightAnchor.constraint(equalToConstant: 387),
            
            imageView3.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            imageView3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 1381),
            imageView3.widthAnchor.constraint(equalToConstant: 678),
            imageView3.heightAnchor.constraint(equalToConstant: 350),
            
            label3.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 360),
            label3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 1381),
            label3.widthAnchor.constraint(equalToConstant: 678),
            label3.heightAnchor.constraint(equalToConstant: 387),
            
            ])
        
    }
}

// Classe principal
class FirstViewController : UIViewController {
    
    override func loadView() {
        super.loadView()
        // UI
        self.view.backgroundColor = #colorLiteral(red: 0.803921580314636, green: 0.803921580314636, blue: 0.803921580314636, alpha: 1.0)
        
        //criação das botões, com titulo e foto
        
        let button1 = UIButton(type: .custom)
        button1.setBackgroundImage(#imageLiteral(resourceName: "IMG_0013.JPG"), for: .normal)
        button1.setTitle("Museu do Louvre", for: .normal)
        button1.contentVerticalAlignment = .bottom
        button1.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button1.titleLabel?.font = UIFont(name: "helvetica", size: 25)
        button1.layer.cornerRadius =  5
        button1.layer.borderWidth = 4
        button1.layer.borderColor = UIColor.black.cgColor
        button1.tag = 1 
        
        button1.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        
        view.addSubview(button1)
        
        let button2 = UIButton(type: .custom)
        button2.setBackgroundImage(#imageLiteral(resourceName: "1__#$!@%!#__IMG_0019.JPG"), for: .normal)
        button2.setTitle("Museu do Prado", for: .normal)
        button2.titleLabel?.font = UIFont(name: "helvetica", size: 16)
        button2.contentVerticalAlignment = .bottom
        button2.layer.cornerRadius =  5
        button2.layer.borderWidth = 3
        button2.layer.borderColor = UIColor.black.cgColor
        button2.tag = 2
        
        button2.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        
        view.addSubview(button2)
        
        let button3 = UIButton(type: .custom)
        button3.setBackgroundImage(#imageLiteral(resourceName: "IMG_0028.JPG"), for: .normal)
        button3.setTitle("Galleria degli Uffizi", for: .normal)
        button3.titleLabel?.font = UIFont(name: "helvetica", size: 16)
        button3.contentVerticalAlignment = .bottom
        button3.layer.cornerRadius =  5
        button3.layer.borderWidth = 3
        button3.layer.borderColor = UIColor.black.cgColor
        button3.tag = 3
        
        button3.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        
        view.addSubview(button3)
        
        let button4 = UIButton(type: .custom)
        button4.setBackgroundImage(#imageLiteral(resourceName: "IMG_0026.JPG"), for: .normal)
        button4.setTitle("Museu de Arte de S.P.", for: .normal)
        button4.titleLabel?.font = UIFont(name: "helvetica", size: 16)
        button4.contentVerticalAlignment = .bottom
        button3.layer.cornerRadius =  5
        button4.layer.borderWidth = 3
        button3.layer.borderColor = UIColor.black.cgColor
        button4.tag = 4
        
        button4.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        
        view.addSubview(button4)
        
        // Layout botões 
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            button1.widthAnchor.constraint(equalToConstant: 615),
            button1.heightAnchor.constraint(equalToConstant: 350),
            
            button2.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            button2.widthAnchor.constraint(equalToConstant: 200),
            button2.heightAnchor.constraint(equalToConstant: 120),
            
            button3.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            button3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 244),
            button3.widthAnchor.constraint(equalToConstant: 200),
            button3.heightAnchor.constraint(equalToConstant: 120),
            
            button4.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            button4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 452),
            button4.widthAnchor.constraint(equalToConstant: 200),
            button4.heightAnchor.constraint(equalToConstant: 120),
            
            ])
        
    }
    
    
    @objc func openWithNavigation(sender:UIButton) {
        let newVC = SecondViewController()
        
        //switch case que estância a as images, texto e titulos na segunda view quando o botão é apertado.
        
        switch sender.tag {
        case 1:
            newVC.titulo = "Museu do Louvre"
            newVC.image1 = "IMG_0013.JPG"
            newVC.labelText1 = "Inaugurado em Paris em 1793, o Louvre ajudou a formar o conceito de museu como uma instituição pública voltada para a arte. O museu é o lar da Monalisa, de Leonardo da Vinci, um dos quadros mais famosos do mundo."
            
            newVC.image2 = "IMG_0014.JPG"
            newVC.labelText2 = "                                              A Divinha \n\nA Adivinha. é uma pintura do artista barroco italiano Michelangelo Merisi da Caravaggio. Existem duas versões, ambas de Caravaggio, sendo a primeira de 1594, e a segunda de 1595. As datas em ambos os casos são contestadas. \n\n Artista: Caravaggio \n Material: Tinta a óleo"
            
            newVC.image3 = "IMG_0017.JPG"
            newVC.labelText3 = "                                  O Juramento dos Horácios \n\nO Juramento dos Horácios é uma obra do pintor francês Jacques-Louis David. Apesar de ter sido pintado cinco anos antes do começo da Revolução Francesa, ilustra os ideais artísticos do neoclassicismo. \n\n Artistas: Jacques-Louis David, Anne-Louis Girodet"
            
            self.navigationController?.pushViewController(newVC, animated: true)
        case 2:
            newVC.titulo = "Museu do Prado"
            newVC.image1 = "IMG_0019.JPG"
            newVC.labelText1 = "Inaugurado em 1819, o Museu do Prado é um dos mais importantes da Espanha e do mundo. Junto com o Museu Thyssen-Bornemisza e o Museu Rainha Sofia ele forma o triângulo da arte em Madri."
            
            newVC.image2 = "IMG_0021.JPG"
            newVC.labelText2 = "Santo Domingo de Silos\n\nSanto Domingos de Silos é a obra mais conhecida do pintor espanhol Bartolomé Bermejo.\n\nEstilo: Gótico\nAutor: Bartolomé Bermejo, h. 1474-1477\nTécnica: Óleo sobre tabla"
            
            newVC.image3 =  "IMG_0022.JPG"
            newVC.labelText3 = "Adoração dos Reis Magos\n\n Técnica: Óleo sobre madeira\n Artista: Hans Memling"

            self.navigationController?.pushViewController(newVC, animated: true)
        case 3: 
            newVC.titulo = "Galleria degli Uffizi "
            newVC.image1 =  "IMG_0028.JPG"
            newVC.labelText1 = "A Galeria Uffizi foi inaugurada em 1580, em Florença, na Itália, e é um dos museus de pintura e escultura mais famosos e antigos do mundo. Sua coleção compreende obras-primas aclamadas, incluindo trabalhos de Giotto, Piero della Francesca, Fra Angelico, Botticelli, Leonardo da Vinci, Raphael, Michelangelo e Caravaggio."
            
            newVC.image2 = "IMG_0030.JPG"
            newVC.labelText2 = "Adoração aos magos\n\nFicha técnica\nAno: c. 142\nTécnica: têmpera sobre madeira\nDimensões: 144 x 177 cm\nLocalização: Galleria deglu Uffizi, Florença, Itália"
            
            newVC.image3 =   "IMG_0032.JPG"
            newVC.labelText3 = "O sacrifício de Isaac\n\nResultado de imagem para Caravaggio Sacrifício de Isaac\nArtista: Caravaggio\nMaterial: Tinta a óleo"
            
            self.navigationController?.pushViewController(newVC, animated: true)
        case 4:
            newVC.titulo = "Museu de Arte de São Paulo (MASP)"
            newVC.image1 =  "IMG_0026.JPG"
            newVC.labelText1 = "O Museu de Arte de São Paulo Assis Chateaubriand, mais conhecido como Masp, foi inaugurado em 1947. Obras dos italianos Rafael, Botticceli e Bellini, do flamengo Rembrandt e dos espanhóis Velazquéz e Goya fazem parte da coleção do museu."
            
            newVC.image2 =  "IMG_0034.JPG"
            newVC.labelText2 = "A dama de verde\n\nTítulo: A dama de verde\nData: 1908 - 1908\nPintor: Arthur Timótheo da Costa\nMeio: Óleo sobre tela "
            
            newVC.image3 =  "IMG_0036.JPG"
            newVC.labelText3 = "Cachoeira de Paulo Afonso\n\nCachoeira de Paulo Afonso é uma pintura a óleo sobre madeira, executada pelo pintor de paisagens neerlandês Frans Post em 1649. A obra retrata a famosa queda de água homônima, localizada no curso do rio São Francisco.\nArtista: Frans Post\nData: 1649"
            
            self.navigationController?.pushViewController(newVC, animated: true)
default:
            self.navigationController?.pushViewController(newVC, animated: true)
            break 
        }
        
    }
    
}

let firstViewController = FirstViewController()

PlaygroundPage.current.liveView = UINavigationController(rootViewController: firstViewController)

