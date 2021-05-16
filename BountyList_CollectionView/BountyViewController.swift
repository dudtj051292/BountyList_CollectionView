//
//  BountyViewController.swift
//  BountyList_CollectionView
//
//  Created by 김영서 on 2021/05/16.
//

import UIKit

class BountyViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let ViewModel = BountyViewModel()
    
    //UICollectionViewDataSource
    // 몇개를 보여줄지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ViewModel.numOfBounrtInfoList
    }
     // 셀은 어떻게 표현될지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    print("1")

    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else{ return UICollectionViewCell() }
    print("2")

    let BountyInfo = ViewModel.bountyInfo(at: indexPath.item)
    cell.update(info: BountyInfo)
    print("3")

    return cell
        
    }

    //UICollectionViewDelegate
    //셀이 클릭 되었을때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("-->\(indexPath.item)")
        performSegue(withIdentifier: "ShowDetail", sender: indexPath.item)
    }
    
    //UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSpacing : CGFloat = 10
        let textAreaHeight : CGFloat = 65
        
        
        let width : CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let height : CGFloat = width * 10/7 + textAreaHeight
        
        
        
        return CGSize(width: width, height: height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 에게 데이터 전달해주는 메서드
        if segue.identifier == "ShowDetail" {
            let vc = segue.destination as? DetailViewController
            if let idx = sender as? Int{
                
                vc?.viewModel.update(model: ViewModel.bountyInfo(at: idx))
            }
            
        }
        
    }
    
  
}




class BountyViewModel{
    let bountyInfoList : [BountyInfo] = [
        BountyInfo(name: "brook"  , bounty: 33000000)
      , BountyInfo(name: "chopper", bounty: 50)
      , BountyInfo(name: "franky" , bounty: 44000000)
      , BountyInfo(name: "luffy"  , bounty: 3000000000)
      , BountyInfo(name: "nami"   , bounty: 16000000)
      , BountyInfo(name: "robin"  , bounty: 80000000)
      , BountyInfo(name: "sanji"  , bounty: 77000000)
      , BountyInfo(name: "zoro"   , bounty: 120000000)
    ]
    
    
    var sortedList : [BountyInfo]{
        let sortedList = bountyInfoList.sorted{ prev , next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numOfBounrtInfoList :Int {
        return bountyInfoList.count
    }
    func bountyInfo(at index : Int) -> BountyInfo{
        return sortedList[index]
    }
    
}



class GridCell : UICollectionViewCell{
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info : BountyInfo){
        print("gridcell")
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text =  "\(info.bounty)"
    }
    
}
