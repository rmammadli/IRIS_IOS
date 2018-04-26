//
//  RiskCalculatorsViewController.swift
//  IRIS
//
//  Created by Rahman Mammadov on 4/8/18.
//  Copyright © 2018 com.newolab. All rights reserved.
//

import UIKit
import MaterialComponents

class RiskCalculatorsViewController: BaseViewController {

    static let CELL_INDENTIFIER_BUTTONS = "cellButtons"
    static let CELL_INDENTIFIER_TF = "cellTextField"
    static let NIB_INDENTIFIER_BUTTONS = "SegmentedTableViewCell"
    static let NIB_INDENTIFIER_TF = "TextFieldTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelResult: UILabel!
    
    let arrayCellTypes: Array = Constant.DefaultValuesRiskCalculator.arrayCellTypes
    let arrayTitles: Array = Constant.DefaultValuesRiskCalculator.arrayTitles
    let arrayPlaceHolders: Array = Constant.DefaultValuesRiskCalculator.arrayPlaceHolders
    let arrayInputTypes: Array = Constant.DefaultValuesRiskCalculator.arrayInputTypes
    var arrayInputValues: [Double] = Constant.DefaultValuesRiskCalculator.arrayInputValues
    var arrayEmptyMessages: Array = Constant.DefaultValuesRiskCalculator.arrayEmptyMessages
    var arrayErrorMessages: Array = Constant.DefaultValuesRiskCalculator.arrayErrorMessages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = Constant.Color.colorBlue
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
        if checkValues(index: 2) {
            self.labelResult.text = Constant.DefaultValuesRiskCalculator.textResultMessage + FormulaHelper.calculateRisk(arrayValues: self.arrayInputValues)
            self.labelResult.isHidden = false
        }
    }
    
    @IBAction func btnReset(_ sender: Any) {
        self.labelResult.isHidden = true
        self.arrayInputValues = Constant.DefaultValuesRiskCalculator.arrayInputValues
        self.tableView.reloadData()
    }
    
    public func checkValues(index: Int) -> Bool {
        let value = self.arrayInputValues[index]
        if value >= 0 && value <= 3.0 {
            return true
        } else if value == Constant.DefaultValues.doubleTFDefault {
            SnackbarUtil.showSnackbar(text: self.arrayEmptyMessages[index])
            return false
        } else {
            SnackbarUtil.showSnackbar(text: self.arrayErrorMessages[index])
            return false
        }
    }
}

extension RiskCalculatorsViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: table view delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.arrayCellTypes[indexPath.row] == 0 {
            let cellIdentifier = RiskCalculatorsViewController.CELL_INDENTIFIER_BUTTONS
            tableView.register(UINib(nibName: RiskCalculatorsViewController.NIB_INDENTIFIER_BUTTONS, bundle: nil), forCellReuseIdentifier: cellIdentifier)
            let cell: SegmentedTableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? SegmentedTableViewCell)!
            
            cell.labelTitle.text = self.arrayTitles[indexPath.row]
            cell.btnNo.tag = indexPath.row
            cell.btnYes.tag = indexPath.row
            cell.btnNo.addTarget(self, action: #selector(RiskCalculatorsViewController.pressNo(sender:)), for: .touchUpInside)
            cell.btnYes.addTarget(self, action: #selector(RiskCalculatorsViewController.pressYes(sender:)), for: .touchUpInside)
            
            if self.arrayInputValues[indexPath.row] == 0 {
                cell.btnNo.setEnabled(false, animated: true)
                cell.btnYes.setEnabled(true, animated: true)
            } else {
                cell.btnNo.setEnabled(true, animated: true)
                cell.btnYes.setEnabled(false, animated: true)
            }
            
            return cell
        } else {
            let cellIdentifier = RiskCalculatorsViewController.CELL_INDENTIFIER_TF
            tableView.register(UINib(nibName: RiskCalculatorsViewController.NIB_INDENTIFIER_TF, bundle: nil), forCellReuseIdentifier: cellIdentifier)
            let cell: TextFieldTableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TextFieldTableViewCell)!
            
            cell.labelTitle.text = self.arrayTitles[indexPath.row]
            cell.tfInput.placeholder = self.arrayPlaceHolders[indexPath.row]
            cell.tfInput.keyboardType = self.arrayInputTypes[indexPath.row]!
            cell.tfInput.tag = indexPath.row
            cell.tfInput.addTarget(self, action: #selector(RiskCalculatorsViewController.textFieldDidChange(sender:)), for: .editingChanged)
            if self.arrayInputValues[indexPath.row] > 0 {
                cell.tfInput.text = "\(self.arrayInputValues[indexPath.row])"
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Clicked\(indexPath.row)")
    }
    
    func getCell(row: Int) -> SegmentedTableViewCell {
        let indexPath = IndexPath(row: row, section: 0)
        return tableView.cellForRow(at: indexPath) as! SegmentedTableViewCell
    }
    
    @objc func pressNo(sender: UIButton) {
        self.arrayInputValues[sender.tag] = 0.0
        self.tableView.reloadData()
    }
    
    @objc func pressYes(sender: UIButton) {
        self.arrayInputValues[sender.tag] = 1.0
        self.tableView.reloadData()
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if (sender.text?.isEmpty)! {
            self.arrayInputValues[sender.tag] = -99.0
        } else {
            self.arrayInputValues[sender.tag] = (sender.text! as NSString).doubleValue
        }
        self.checkValues(index: sender.tag)
    }
}
