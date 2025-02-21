import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var Pou: UIImageView!
    @IBOutlet weak var stool: UIImageView!
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var foodChoice: UIImageView!
    @IBOutlet weak var houseIcon: UIImageView!
    @IBOutlet weak var bottomHeader: UIView!
    @IBOutlet weak var leftFoodButton: UIButton!
    @IBOutlet weak var rightFoodButton: UIButton!
    
    let foodImages = ["pizza", "icecream", "hotdog", "fries", "soda"]
    var currentImageIndex = 0
    var foodChoiceInitialPosition: CGPoint!
    
    let rooms = ["Kitchen", "Bathroom"]
    var currentRoomIndex = 0 {
        didSet {
            updateRoom()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.image = UIImage(named: "backgroundKitchen")
        Pou.image = UIImage(named: "pou")
        stool.image = UIImage(named: "stool")
        roomName.text = "Kitchen"
        foodChoice.image = UIImage(named: foodImages[currentImageIndex])
        houseIcon.image = UIImage(named: "houseIcon")
        bottomHeader.layer.borderColor = UIColor.white.cgColor
        
        let pouFrame = Pou.frame
        let reducedPouFrame = pouFrame.insetBy(dx: 100, dy: 100)
        Pou.frame = reducedPouFrame
        
        foodChoiceInitialPosition = foodChoice.center
        addPanGestureToFood()
        
        // Configuração das camadas (zPosition)
        foodChoice.layer.zPosition = 2
        Pou.layer.zPosition = 1
        stool.layer.zPosition = 0
        background.layer.zPosition = -1
        houseIcon.layer.zPosition = 1
        bottomHeader.layer.zPosition = 0
        
        fixButtonsPosition()
    }
    
    func fixButtonsPosition() {
        guard let leftButton = leftFoodButton, let rightButton = rightFoodButton else { return }
        
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.deactivate(leftButton.constraints)
        NSLayoutConstraint.deactivate(rightButton.constraints)
        
        NSLayoutConstraint.activate([
            leftButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            rightButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func addPanGestureToFood() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        foodChoice.isUserInteractionEnabled = true
        foodChoice.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        
        if let viewToDrag = gesture.view {
            switch gesture.state {
            case .began, .changed:
                viewToDrag.center = CGPoint(x: viewToDrag.center.x + translation.x, y: viewToDrag.center.y + translation.y)
                gesture.setTranslation(CGPoint.zero, in: self.view)
                
                if checkCollision() {
                    handleCollision()
                }
                
            case .ended, .cancelled:
                if currentRoomIndex == 1 { // Banheiro
                    UIView.animate(withDuration: 0.5, animations: {
                        viewToDrag.center = self.foodChoiceInitialPosition
                    })
                }
                
            default:
                break
            }
        }
    }
    
    func checkCollision() -> Bool {
        let foodFrame = foodChoice.superview?.convert(foodChoice.frame, to: self.view) ?? foodChoice.frame
        let pouFrame = Pou.superview?.convert(Pou.frame, to: self.view) ?? Pou.frame
        
        let reducedPouFrame = pouFrame.insetBy(dx: 110, dy: 110)
        return foodFrame.intersects(reducedPouFrame)
    }
    
    func handleCollision() {
        UIView.animate(withDuration: 0.3, animations: {
            self.foodChoice.alpha = 0
        }) { _ in
            self.foodChoice.isHidden = true
            self.foodChoice.isUserInteractionEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if self.currentRoomIndex == 0 {
                    self.loadNextFood()
                } else {
                    self.resetSoap()
                }
            }
        }
    }
    
    func loadNextFood() {
        currentImageIndex = (currentImageIndex + 1) % foodImages.count
        foodChoice.image = UIImage(named: foodImages[currentImageIndex])
        resetFoodChoice()
    }
    
    func resetSoap() {
        foodChoice.image = UIImage(named: "soap")
        resetFoodChoice()
    }
    
    func resetFoodChoice() {
        foodChoice.center = foodChoiceInitialPosition
        foodChoice.alpha = 1
        foodChoice.isHidden = false
        foodChoice.isUserInteractionEnabled = true
        
        foodChoice.gestureRecognizers?.forEach { foodChoice.removeGestureRecognizer($0) }
        addPanGestureToFood()
        
        UIView.animate(withDuration: 0.3) {
            self.foodChoice.alpha = 1
        }
    }
    
    @IBAction func rightFoodButton(_ sender: Any) {
        if currentRoomIndex == 0 { // Cozinha
            currentImageIndex = (currentImageIndex + 1) % foodImages.count
            updateFoodChoice()
        }
    }
    
    @IBAction func leftFoodButton(_ sender: Any) {
        if currentRoomIndex == 0 { // Cozinha
            currentImageIndex = (currentImageIndex - 1 + foodImages.count) % foodImages.count
            updateFoodChoice()
        }
    }
    
    func updateFoodChoice() {
        foodChoice.image = UIImage(named: foodImages[currentImageIndex])
        resetFoodChoice()
    }
    
    @IBAction func leftRoomButton(_ sender: Any) {
        currentRoomIndex = (currentRoomIndex - 1 + rooms.count) % rooms.count
    }
    
    @IBAction func rightRoomButton(_ sender: Any) {
        currentRoomIndex = (currentRoomIndex + 1) % rooms.count
    }
    
    func updateRoom() {
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            if self.currentRoomIndex == 0 { // Cozinha
                self.background.image = UIImage(named: "backgroundKitchen")
                self.roomName.text = "Kitchen"
                self.foodChoice.image = UIImage(named: self.foodImages[self.currentImageIndex])
            } else { // Banheiro
                self.background.image = UIImage(named: "backgroundBathroom")
                self.roomName.text = "Bathroom"
                self.foodChoice.image = UIImage(named: "soap")
            }
        }, completion: nil)
        
        resetFoodChoice()
    }
}
