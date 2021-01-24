//
//  MemoWritingViewController.swift
//  youjinMemo
//
//  Created by 김유진 on 2021/01/24.
//

import UIKit

class MemoWritingViewController: UIViewController{
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var memoTitleTextField: UITextField!
    @IBOutlet weak var memoContentTextView: UITextView!
    
    let titleunwritealert = UIAlertController(title: "경고", message: "제목을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
    let contentunwritealert = UIAlertController(title: "경고", message: "내용을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
    let writetitle = UIAlertAction(title: "제목 입력하기", style: UIAlertAction.Style.default, handler: nil)
    let writecontent = UIAlertAction(title: "내용 입력하기", style: UIAlertAction.Style.default, handler: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleunwritealert.addAction(writetitle)
        contentunwritealert.addAction(writecontent)
    }
    
    @IBAction func backButton(_ sender: Any) {
        if(memoTitleTextField.text == ""){
            present(titleunwritealert, animated: true, completion: nil)
        }else if(memoContentTextView.text == ""){
            present(contentunwritealert, animated: true, completion: nil)
        }else{
            memoTitle.append(memoTitleTextField.text!)
            memoContents.append(memoContentTextView.text)
        }
        
        print("memoTitle[] : \(memoTitle)")
        print("memoContents[] : \(memoContents)")
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
