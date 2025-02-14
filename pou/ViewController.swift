import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Header: UIView!
    
    @IBOutlet weak var Comodo: UIStackView!
    
    @IBOutlet weak var Pou: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func geladeiraTapped(_ sender: Any) {
        print("toquei na geladeira!")
        
    }
    
    @IBAction func leftTopButton(_ sender: Any) {
        print("toquei botão topo esquerda")
    }
    
    @IBAction func rightTopButton(_ sender: Any) {
        print("toquei botão topo direita")
    }
    
    @IBAction func leftBottomButton(_ sender: Any) {
        print("toquei botão baixo esquerda")
    }
    
    @IBAction func rightBottomButton(_ sender: Any) {
        print("toquei botão baixo direita")
    }
    
    @IBOutlet weak var pouTapped: UIImageView!
    
    
    
    
    
    
    
    
    
    
}

