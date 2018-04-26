//
//  CPRMoMViewController.swift
//  IRIS
//
//  Created by Rahman Mammadov on 4/8/18.
//  Copyright © 2018 com.newolab. All rights reserved.
//

import UIKit
import MaterialComponents

class CPRMoMViewController: BaseViewController {
    
    static let CELL_INDENTIFIER_TF = "cellTextField"
    static let NIB_INDENTIFIER_TF = "TextFieldTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelResult: UILabel!
    
    let arrayTitles: Array = Constant.DefaultValuesCPRMoM.arrayTitles
    let arrayPlaceHolders: Array = Constant.DefaultValuesCPRMoM.arrayPlaceHolders
    let arrayInputTypes: Array = Constant.DefaultValuesCPRMoM.arrayInputTypes
    var arrayInputValues: Array = Constant.DefaultValuesCPRMoM.arrayInputValues
    var arrayEmptyMessages: Array = Constant.DefaultValuesCPRMoM.arrayEmptyMessages
    var arrayErrorMessages: Array = Constant.DefaultValuesCPRMoM.arrayErrorMessages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.navigationBar.barTintColor = Constant.Color.colorRed
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnCalculate(_ sender: Any) {
        for i in 0 ... self.arrayInputValues.count - 1 {
            if !self.checkValues(index: i) {
                return
            }
        }
        self.labelResult.text = Constant.DefaultValuesCPRMoM.textResultMessage  + FormulaHelper.calculateCPRMoM(arrayValues: self.arrayInputValues)
        self.labelResult.isHidden = false
    }
    
    @IBAction func btnReset(_ sender: Any) {
        self.labelResult.isHidden = true
        self.arrayInputValues = Constant.DefaultValuesCPRMoM.arrayInputValues
        self.tableView.reloadData()
    }
    
    public func checkValues(index: Int) -> Bool {
        let value = self.arrayInputValues[index]
        if value != Constant.DefaultValues.doubleTFDefault {
            switch index {
                case 0:
                    if value >= 36 && value <= 42 {
                        return true
                    } else {
                        SnackbarUtil.showSnackbar(text: self.arrayErrorMessages[index])
                        return false
                    }
                case 1:
                    if value >= 0 && value <= 6.0 {
                        return true
                    } else {
                        SnackbarUtil.showSnackbar(text: self.arrayErrorMessages[index])
                        return false
                    }
                case 2:
                    return true
                default:
                    return true
            }
        } else {
            SnackbarUtil.showSnackbar(text: self.arrayEmptyMessages[index])
            return false
        }
    }
}

extension CPRMoMViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: table view delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = CPRMoMViewController.CELL_INDENTIFIER_TF
        tableView.register(UINib(nibName: CPRMoMViewController.NIB_INDENTIFIER_TF, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        let cell: TextFieldTableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TextFieldTableViewCell)!
        
        cell.labelTitle.text = self.arrayTitles[indexPath.row]
        cell.tfInput.placeholder = self.arrayPlaceHolders[indexPath.row]
        cell.tfInput.keyboardType = self.arrayInputTypes[indexPath.row]
        cell.tfInput.tag = indexPath.row
        cell.tfInput.addTarget(self, action: #selector(RiskCalculatorsViewController.textFieldDidChange(sender:)), for: .editingChanged)
        if self.arrayInputValues[indexPath.row] > 0 {
            cell.tfInput.text = String(format: Constant.DefaultValues.doubleRoundFormat, self.arrayInputValues[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Clicked\(indexPath.row)")
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if (sender.text?.isEmpty)! {
            self.arrayInputValues[sender.tag] = Constant.DefaultValues.doubleTFDefault
        } else {
            self.arrayInputValues[sender.tag] = (sender.text! as NSString).doubleValue
        }
        self.checkValues(index: sender.tag)
    }
}
