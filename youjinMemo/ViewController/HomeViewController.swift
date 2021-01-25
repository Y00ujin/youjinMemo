//
//  ViewController.swift
//  youjinMemo
//
//  Created by 김유진 on 2021/01/24.
//

import UIKit

var memoTitle: [String] = []
var memoContents: [String] = []

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        1 / Int(CGFloat.random(in: 0...10))
        tableView.deselectRow(at: indexPath, animated: true)
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "ModifyMemoViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
        
        UserDefaults.standard.set(indexPath.row, forKey: "index")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.memoTitleLabel.text = memoTitle[indexPath.row]
        cell.memoContentLabel.text = memoContents[indexPath.row]

        return cell
    }
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var noMemoView: UIView!
    @IBAction func trashButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        if(memoTitle.count>0){
            tableview.isHidden = false
            noMemoView.isHidden = true
        }else{
            noMemoView.isHidden = false
            tableview.isHidden = true
        }
        print("didload\(memoTitle.count)")
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: .TableReload, object: nil)
    }
    
    @objc func reloadTableView(_ notification: Notification) {
        tableview.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableview.reloadData()
        if(memoTitle.count>0){
            
            tableview.isHidden = false
            noMemoView.isHidden = true
        }else{
            noMemoView.isHidden = false
            tableview.isHidden = true
        }
    }
    
    @IBAction func addMemoButton(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "MemoWritingViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
}
