//
//  AddCarView.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 14.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class AddCarView: PCView {

    private lazy var imageView: PCImageView = {
        return PCImageView(image: nil, contentMode: .scaleAspectFit)
    }()

    lazy var makeTextField: PCTextField = {
        return PCTextField(placeholder: "Make", textAlignment: .center)
    }()

    lazy var modelTextField: PCTextField = {
        return PCTextField(placeholder: "Model", textAlignment: .center)
    }()

    lazy var yearDatePicker: PCDatePicker = {
        return PCDatePicker(datePickerMode: UIDatePickerMode.date, minimumDate: Date().adding(.year, value: -10), maximumDate: Date().adding(.year, value: 1))
    }()

    lazy var addImageButton: PCButton = {
        return PCButton(type: .system, title: "Add Image", backgroundColor: .black, tintColor: .white)
    }()

    lazy var scrollView: PCScrollView = {
        return PCScrollView()
    }()

    override func setViews() {
        super.setViews()

        scrollView.addSubview(imageView)

        makeTextField.makeBorder()
        scrollView.addSubview(makeTextField)

        modelTextField.makeBorder()
        scrollView.addSubview(modelTextField)

        scrollView.addSubview(yearDatePicker)

        addImageButton.makeBorder()
        scrollView.addSubview(addImageButton)

        addSubview(scrollView)
    }

    override func layoutViews() {

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(preferredPadding)
            make.leading.equalToSuperview().inset(preferredPadding)
            make.trailing.equalToSuperview().inset(preferredPadding)
            make.width.equalTo(UIScreen.main.bounds.width - (preferredPadding * 2))
            make.height.equalTo(0)
        }

        makeTextField.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(preferredPadding)
            make.leading.equalTo(imageView)
            make.trailing.equalTo(imageView)
            make.height.equalTo(makeTextField.preferredHeight)
        }

        modelTextField.snp.makeConstraints { make in
            make.top.equalTo(makeTextField.snp.bottom).offset(preferredPadding)
            make.leading.equalTo(imageView)
            make.trailing.equalTo(imageView)
            make.height.equalTo(modelTextField.preferredHeight)
        }

        yearDatePicker.snp.makeConstraints { make in
            make.top.equalTo(modelTextField.snp.bottom).offset(preferredPadding)
            make.leading.equalTo(imageView)
            make.trailing.equalTo(imageView)
        }

        addImageButton.snp.makeConstraints { make in
            make.top.equalTo(yearDatePicker.snp.bottom).offset(preferredPadding * 1.5)
            make.leading.equalTo(imageView)
            make.trailing.equalTo(imageView)
            make.height.equalTo(addImageButton.preferredHeight)
            make.bottom.equalToSuperview()
        }

        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(preferredPadding)
        }
    }

    override func handleKeyboardWillShow(_ notification: Notification) {
        scrollView.contentInset.bottom = notification.estimatedKeyboardSize.height
    }

    override func handleKeyboardWillHide(_ notification: Notification) {
        scrollView.contentInset.bottom = 0
    }

}

// MARK: - Helpers
extension AddCarView {

    var isFormValid: Car? {
        guard !makeTextField.trimmedText.isEmpty else {
            makeTextField.shake()
            return nil
        }
        guard !modelTextField.trimmedText.isEmpty else {
            modelTextField.shake()
            return nil
        }
        
        return Car(model: modelTextField.trimmedText, make: makeTextField.trimmedText, year: yearDatePicker.date.year, image: imageView.image)
    }

    func setCarImage(_ image: UIImage?) {
        imageView.image = image
        imageView.snp.updateConstraints { $0.height.equalTo(image == nil ? 0 : 250) }
        imageView.superview?.layoutIfNeeded()
    }

}

private extension PCBorderable {

    func makeBorder() {
        borderColor = .black
        borderWidth = 1.0
        cornerRadius = 8.0
    }

}
