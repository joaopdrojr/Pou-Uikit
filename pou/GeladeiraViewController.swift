import UIKit

class GeladeiraViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        self.GeladeiraCollection.dataSource = self
        self.GeladeiraCollection.delegate = self
        self.GeladeiraCollection.collectionViewLayout = UICollectionViewFlowLayout()
        
        self.GeladeiraCollection.register(UINib(nibName: "GeladeiraCollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: "GeladeiraCollectionViewCell")
    }
    @IBOutlet weak var GeladeiraCollection: UICollectionView!
    let foodImages: [String] = [
        "pizza", "burguer", "fish1",
        "fish2", "hotdog", "fries",
        "icecream", "soda", "trash"
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeladeiraCollectionViewCell", for: indexPath) as! GeladeiraCollectionViewCell
        
        cell.configure(foodImage: foodImages[indexPath.row], foodName: foodImages[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let totalPadding = padding * 4 // 3 espaços entre os itens
        let availableWidth = collectionView.frame.width - totalPadding
        let itemWidth = availableWidth / 3
        return CGSize(width: itemWidth, height: itemWidth) // Quadrado
    }
    
    // Espaçamento entre células
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


//func viewDidLoad() {
//       super.viewDidLoad()
//       collectionView.dataSource = self
//    collectionView.collectionViewLayout = UICollectionViewFlowLayout()
//       collectionView.delegate = self
//   }
//
//   // MARK: - UICollectionViewDataSource
//
//   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//       return foodImages.count
//   }
//
//   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! FoodCell
//       cell.foodImageView.image = UIImage(named: foodImages[indexPath.item])
//       return cell
//   }
//
//   // MARK: - UICollectionViewDelegate
//
//   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       let selectedFood = foodImages[indexPath.item]
//       print("Comida selecionada: \(selectedFood)")
//       // Aqui você pode adicionar lógica para alimentar o Pou
//   }
//
//   // MARK: - UICollectionViewDelegateFlowLayout (define tamanho das células)
//
//   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//       let spacing: CGFloat = 10  // Espaço entre os itens
//       let totalSpacing = spacing * 2  // 2 espaçamentos entre 3 colunas
//       let width = (collectionView.frame.width - totalSpacing) / 3
//       return CGSize(width: width, height: width)
//   }
