//
//  DetailViewController.swift
//  BountyList_CollectionView
//
//  Created by 김영서 on 2021/05/16.
//

import UIKit

class DetailViewController: UIViewController {

  
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    //    var name : String?
//    var bounty : Int?
//
//    var bountyInfo : BountyInfo?
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnim()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnim()
    }
    
    private func prepareAnim(){
//        nameLabelCenterX.constant = view.bounds.width
//        bountyLabelCenterX.constant = view.bounds.width
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 540)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 540)
        
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    private func showAnim(){
        nameLabelCenterX.constant = 0
        bountyLabelCenterX.constant = 0
        
//        UIView.animate(withDuration: 0.3){
//            self.view.layoutIfNeeded()
//        }
//        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseIn , animations: {self.view.layoutIfNeeded()}, completion: nil)
//
//        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 20, options: .allowUserInteraction, animations: {self.view.layoutIfNeeded()}, completion: nil)
//
//        UIView.transition(with: imgView, duration: 0.3, options: .transitionCurlDown, animations: nil, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
            self.bountyLabel.alpha = 1
            
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.bountyLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
            self.bountyLabel.alpha = 1
            
        }, completion: nil)
    }
        
    func updateUI(){
        if let  bountyInfo = self.viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
         
           
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


class DetailViewModel{
    var bountyInfo : BountyInfo?
    
    func update(model : BountyInfo){
        self.bountyInfo = model
    }
}
