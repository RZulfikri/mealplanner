//
//  CategoryViewController.swift
//  Meal Planner
//
//  Created by Fandrian Rhamadiansyah on 08/05/20.
//  Copyright © 2020 Team13. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    let mealCategories = CategoryEnum.allCases
    var selectCategory = CategoryEnum.ayam
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        print("delegate success")
        categoryCollectionView.dataSource = self
        print("datasource success")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "toFindMeal" {
                if let destinationVC = segue.destination as? FindMealViewController{
                    destinationVC.selectedCategory = selectCategory
                }
            }
        }
    }
    
}

//MARK: - Meal Category Collection View

extension CategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mealCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        cell.labelCategory.text = mealCategories[indexPath.row].rawValue
        switch mealCategories[indexPath.row] {
        case .ayam:
            cell.imageCategory.image = #imageLiteral(resourceName: "CategoryAyam")
        case .sapi:
            cell.imageCategory.image = #imageLiteral(resourceName: "CategorySapi")
        case .ikan:
            cell.imageCategory.image = #imageLiteral(resourceName: "CategoryIkan")
        case .sayur:
            cell.imageCategory.image = #imageLiteral(resourceName: "CategorySayuran")
        case .babi:
            cell.imageCategory.image = #imageLiteral(resourceName: "CategoryBabi")
        default:
            cell.imageCategory.image = #imageLiteral(resourceName: "CategoryLainnya")
        }
        cell.backgroundColor = .green
        return cell
    }
    
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("SDASD123123")
        print(mealCategories[indexPath.row].rawValue)
        selectCategory = mealCategories[indexPath.row]
        performSegue(withIdentifier: "toFindMeal", sender: self)
    }
    
}



