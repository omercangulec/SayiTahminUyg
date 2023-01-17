//
//  TahminEkraniVC.swift
//  SayiTahminUyg
//
//  Created by Ömer Can Güleç on 15.01.2023.
//

import UIKit

class TahminEkraniVC: UIViewController {

    @IBOutlet weak var labalKalanHak: UILabel!
    
    @IBOutlet weak var textFieldGirdi: UITextField!
    @IBOutlet weak var labelYardim: UILabel!
    
    @IBOutlet weak var info: UITextView!
    var rasgeleSayi:Int?
    var kalanHak = 5
    override func viewDidLoad() {
        super.viewDidLoad()

        //rasgeleSayi = Int(arc4random_uniform(100))
        rasgeleSayi = Int.random(in: 0...20)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gelenVeri = sender as? Bool {
            let gidilecekVC = segue.destination as! SonucEkraniVC
            gidilecekVC.sonuc = gelenVeri
        }
    }
    
  
    
    
    
    
    @IBAction func tahminEt(_ sender: Any) {
        labelYardim.isHidden = false
        kalanHak -= 1
        
        if let veri = textFieldGirdi.text {
            if let tahmin = Int(veri){
                if tahmin == rasgeleSayi! {
                    let sonuc = true
                    performSegue(withIdentifier: "tahminToSonuc", sender: sonuc)
                    return
                }
                
                if tahmin > rasgeleSayi! {
                    labelYardim.text = "Azalt"
                    labalKalanHak.text = "Kalan Hak : \(kalanHak)"
                }
                
                if tahmin < rasgeleSayi! {
                    labelYardim.text = "Arttır"
                    labalKalanHak.text = "Kalan Hak : \(kalanHak)"
                }
                
                if (kalanHak == 0) {
                    let sonuc = false
                    performSegue(withIdentifier: "tahminToSonuc", sender: sonuc)
                    return
                }
                
                textFieldGirdi.text = ""
            }
        }
        
        
    }
    
    @IBAction func nasilOynanir(_ sender: Any) {
        if info.isHidden {
            info.isHidden = false
        }else{
            info.isHidden = true
        }
        
    }
}
