//
//  AddCarViewController.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 14.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust
import AVFoundation

class AddCarViewController: PCViewController {

    override func loadView() {
        view = AddCarView()
    }

    var pcView: AddCarView {
        return view as! AddCarView
    }

    override func setNavigationItem() {
        navigationItem.title = "Add New Car"
        navigationItem.rightBarButtonItem = PCBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSaveBarButton))
    }

    override var shouldEndEditingOnTap: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        pcView.addImageButton.addTarget(self, action: #selector(didTapAddImageButton), for: .touchUpInside)

        registerForKeyboardEvents()
    }

    deinit {
        unregisterFromKeyboardEvents()
    }

    override func keyboardWillShow(_ notification: Notification) {
        pcView.handleKeyboardWillShow(notification)
    }

    override func keyboardWillHide(_ notification: Notification) {
        pcView.handleKeyboardWillHide(notification)
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension AddCarViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true)
        let image = info[UIImagePickerControllerEditedImage] as? UIImage
        pcView.setCarImage(image)
    }

}

// MARK: - Actions & Helpers
private extension AddCarViewController {

    @objc
    func didTapSaveBarButton() {
        guard let car = pcView.isFormValid else { return }

        if let index = Car.cars.index(where: { $0.first?.make == car.make }) {
            Car.cars[index].append(car)
        } else {
            Car.cars.append([car])
        }

        navigationController?.popViewController(animated: true)
    }

    @objc
    func didTapAddImageButton() {
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .default) { _ in
            self.showCamera()
        }
        let choosePhotoAction = UIAlertAction(title: "Choose Photo", style: .default) { _ in
            self.showGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        presentAlert(title: "Add Photo", message: nil, preferredStyle: .actionSheet, actions: [takePhotoAction, choosePhotoAction, cancelAction])
    }

}

// MARK: - Camera & Gallery
private extension AddCarViewController {

    func showCamera() {
        guard checkCameraPersmission() else { return }
        present(pickerViewController(forSource: .camera), animated: true, completion: nil)
    }

    func showGallery() {
        present(pickerViewController(forSource: .photoLibrary), animated: true, completion: nil)
    }

    func checkCameraPersmission() -> Bool {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .denied, .restricted:
            self.showPermissionDeniedAlert()
            return false

        case .notDetermined:
            self.askForCameraPersmission()
            return false

        default:
            return true
        }
    }

    func askForCameraPersmission() {
        AVCaptureDevice.requestAccess(for: .video) { _ in
            self.showCamera()
        }
    }

    func showPermissionDeniedAlert() {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            guard let url = URL(string: UIApplicationOpenSettingsURLString) else { return }
            UIApplication.shared.openURL(url)
        }

        presentAlert(title: "Camera Access Denied", message: "Please allow camera access from Settings.", actions: [cancelAction, settingsAction])
    }

    func pickerViewController(forSource source: UIImagePickerControllerSourceType) -> UIImagePickerController {
        let pickerVC = UIImagePickerController()
        pickerVC.sourceType = source
        pickerVC.delegate = self
        pickerVC.allowsEditing = true
        return pickerVC
    }
    
}
