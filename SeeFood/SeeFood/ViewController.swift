//
//  ViewController.swift
//  SeeFood
//
//  Created by chityuen on 2017/11/15.
//  Copyright © 2017年 chityuen. All rights reserved.
//

import UIKit
import CoreML
import Vision
import SVProgressHUD


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        cameraButton.isEnabled = false
        SVProgressHUD.show()


        
        if let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            imageView.image = userPickedImage
            imagePicker.dismiss(animated: true, completion: nil)
            
            
            let userPickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            guard let ciImage = CIImage(image: userPickedImage) else {
                fatalError("WRONG")
            }
            detect(image: ciImage)
        }
        
        
    }
    
    func detect(image: CIImage){

        DispatchQueue.global().async {
            guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
                fatalError("Loading CoreML Model Failed")
            }
            
            let request = VNCoreMLRequest(model: model) { (request, error) in
                guard let results = request.results as? [VNClassificationObservation] else{
                    fatalError("Model failed to process image")
                }
                if let firstResult = results.first {
                    let r = firstResult.identifier.split(separator: ",")
                    DispatchQueue.main.async {
                        self.cameraButton.isEnabled = true
                        SVProgressHUD.dismiss()
                        self.navigationItem.title = r.last?.description.capitalized
                    }
                }
            }
            
            
            let handler = VNImageRequestHandler(ciImage: image)
            do{
                try handler.perform([request])
            }
            catch {
                print(error)
            }
        }

       
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
}

