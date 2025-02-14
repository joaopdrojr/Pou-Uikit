import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Header: UIView!
    
    @IBOutlet weak var Comodo: UIStackView!
    
    @IBOutlet weak var Pou: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientView = LinearGradientView()
        gradientView.frame = view.bounds
        view.addSubview(gradientView)
        
        self.tabBarController?.tabBar.isHidden = true
        
        Task { @MainActor in
            try? await Task.sleep(for: .seconds(5.5))
            UIView.animate(withDuration: 0.5) {
                gradientView.alpha = 0
            }
            self.tabBarController?.tabBar.isHidden = false
        }
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
    
    
    
    
    
    
    
    
    
    
    
}

