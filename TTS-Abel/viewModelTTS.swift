//
//  viewModelTTS.swift
//  TTS-Abel
//
//  Created by macOS abel on 18/09/23.
//

import Foundation
class viewModelTTS: ObservableObject{
    @Published var model = TTS(text: "apple", rate: 0.3)
    @Published var elements: [Element] = []



    func speakText(to text:String){
        model.speakText(to: text)
    }
    
    init() {
        model.downloadJSONFromURL()
        // proyector del array en el model
        // cuando cambie, cambie el array del VM, Ambas propiedades deben ser published
        model.$elements.assign(to: &$elements)
    }
    
    func changeRatio(to rate: Float){
        model.changeRatio(to: rate)
    }
    
   
}
