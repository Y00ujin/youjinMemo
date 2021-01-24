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
    @IBOutlet weak var nomMemoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        if(memoTitle.count>0){
            tableview.isHidden = false
            nomMemoView.isHidden = true
        }else{
            nomMemoView.isHidden = false
            tableview.isHidden = true
        }
        print("didload\(memoTitle.count)")
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableview.reloadData()
        if(memoTitle.count>0){
            tableview.isHidden = false
            nomMemoView.isHidden = true
        }else{
            nomMemoView.isHidden = false
            tableview.isHidden = true
        }
    }
    
    @IBAction func addMemoButton(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "MemoWritingViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
}

