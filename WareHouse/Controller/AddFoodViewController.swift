//
//  AddFoodViewController.swift
//  WareHouse
//
//  Created by 김호중 on 2020/04/27.
//  Copyright © 2020 hojung. All rights reserved.
//

import UIKit

class AddFoodViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var name: UITextField!
    @IBOutlet var expDate: UIDatePicker!
    @IBOutlet var category: UIPickerView!
    
    override func viewDidLoad() { // textField에 Custom디자인을 적용한 코드. 밑줄이 생성된다.
        let border = CALayer()
        let width = CGFloat(0.3)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: name.frame.size.height - width, width: name.frame.size.width, height: name.frame.size.height)
        border.borderWidth = width
        name.layer.addSublayer(border)
        name.layer.masksToBounds = true
        
        self.category.delegate = self
        self.category.dataSource = self
        
    }
    // UIPickerView 설정 메서드
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(FoodCategory.count)
        return FoodCategory.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return FoodCategory(rawValue: row)?.description
        
    } // 새 Food객체 생성 메서드
    func newFood() -> Food? {
        let food = Food(value: ["name":name.text!, "expDate":expDate.date])
        food.category = FoodCategory(rawValue: category.selectedRow(inComponent: 0))!
        return food
        
    }
    // unwind 하기 전 실행되는 메서드.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addDone" {
            guard let food = newFood() else {
                return
            }
            guard let refrigeratorTableViewController = segue.destination as? RefrigetorTableViewController else {
                return
            }
            let realm = refrigeratorTableViewController.realm!
            
            do{
                try realm.write {
                    realm.add(food)
                }
            } catch {
                print("Error Add \(error)")
            }
        }
    }
}
    



