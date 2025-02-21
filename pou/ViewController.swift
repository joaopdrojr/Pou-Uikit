import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var Pou: UIImageView!
    @IBOutlet weak var stool: UIImageView!
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var foodChoice: UIImageView!
    
    @IBOutlet weak var houseIcon: UIImageView!
    @IBOutlet weak var homeHeader: UIImageView!
    
    @IBOutlet weak var bottomHeader: UIView!
    
    
    
    
    
    
    // Array de imagens para alternar
    
    
    
    
    
    
    let foodImages = ["pizza", "icecream", "hotdog", "fries", "soda"]
    var currentImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuração inicial das imagens
        background.image = UIImage(named: "backgroundKitchen")
        Pou.image = UIImage(named: "pou")
        stool.image = UIImage(named: "stool")
        roomName.text = "Kitchen"
        foodChoice.image = UIImage(named: foodImages[currentImageIndex])
        houseIcon.image = UIImage(named: "houseIcon")
        bottomHeader.layer.borderColor = UIColor.white.cgColor
        
        // Adicionar Gesture Recognizer para arrastar a foodChoice
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        foodChoice.isUserInteractionEnabled = true
        foodChoice.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        
        if let viewToDrag = gesture.view {
            viewToDrag.center = CGPoint(x: viewToDrag.center.x + translation.x, y: viewToDrag.center.y + translation.y)
            gesture.setTranslation(CGPoint.zero, in: self.view)
        }
    }
    
    @IBAction func rightFoodButton(_ sender: Any) {
        currentImageIndex = (currentImageIndex + 1) % foodImages.count
        foodChoice.image = UIImage(named: foodImages[currentImageIndex])
    }
    
    @IBAction func leftFoodButton(_ sender: Any) {
        currentImageIndex = (currentImageIndex - 1 + foodImages.count) % foodImages.count
        foodChoice.image = UIImage(named: foodImages[currentImageIndex])
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
