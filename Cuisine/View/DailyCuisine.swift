//
//  DailyCuisine.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI
import SafariServices
import WikipediaKit

enum ActiveSheet: Identifiable {
	case breakfast, lunch, dinner
	
	var id: Int {
		hashValue
	}
}
enum LoadingState {
	case loading, loaded, failed
}


struct DailyCuisine: View {
	

	
	@State private var activeSheet : ActiveSheet?
	@State private var loadingState = LoadingState.loading
	@State var WikiResult : String
	@State var WikiURL : URL

	
	var meal: Meal

    var body: some View {
		

        VStack {
			
			MapDate(meal:meal)
				.padding(.bottom, 10)
				.padding(.top, 0)
			
            

			Divider()
				.padding(.top, 5)
				.padding(.bottom, 5)
                    
			if loadingState == .loaded{
				
				Text(WikiResult)
					.font(.system(size: 14, weight: .light, design: .serif))
					.foregroundColor(.black)
					.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
					.frame(minWidth: 400, idealWidth: 400, maxWidth: .infinity, minHeight: 140, idealHeight: 170, maxHeight: 170, alignment: .center)
				
			}
			else if loadingState == .loading {
				Text("Loading ... ")
					.font(.system(size: 14, weight: .light, design: .serif))
					.foregroundColor(.black)
					.lineLimit(6)
					.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
					.frame(height: 150)
			}
			else{
				Text("Please try again later")
					.font(.system(size: 14, weight: .light, design: .serif))
					.foregroundColor(.black)
					.lineLimit(6)
					.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
					.frame(height: 150)
			}
			HStack(alignment: .firstTextBaseline){
				Link("Content derived from Wikipedia ", destination: WikiURL)
//					.padding(.top, -100)
					.padding(.leading, 10)
					.font(.footnote)
					.frame(width: 250, height: 50, alignment: .leading)
				Spacer()
				
			}
			
			
			
//			Spacer()
//				.frame(minHeight: 5, idealHeight: 10, maxHeight: 10)

			HStack (alignment: .center, spacing: 20){
				VStack {
					Button(action: {activeSheet = .breakfast}){
						meal.mealDetails.Breakfast.image
							.resizable()
							.clipShape(	Circle())
							.frame(width: 110, height: 110, alignment: .leading)
							.tag("Breakfast")
							.aspectRatio(0.5, contentMode: .fill)
					}
					Text("Breakfast")
						.foregroundColor(.black)
				}
			.padding(.trailing, 10)
			.padding(.leading, 2)
				VStack {
					Button(action: {activeSheet = .lunch}){
						meal.mealDetails.Lunch.image
							.resizable()
							.clipShape(	Circle())
							.frame(width: 110, height: 110, alignment: .leading)
							.tag("Lunch")
							.aspectRatio(0.5, contentMode: .fill)
					}
					Text("Lunch")
						.foregroundColor(.black)
				}
			.padding(.trailing, 10)
			.padding(.leading, 2)
				VStack {
					Button(action: {activeSheet = .dinner}){
						meal.mealDetails.Dinner.image
							.resizable()
							.clipShape(	Circle())
							.frame(width: 110, height: 110, alignment: .leading)
							.tag("Dinner")
							.aspectRatio(1, contentMode: .fill)
					}
					Text("Dinner")
						.foregroundColor(.black)
				}
				.padding(.trailing, 10)
				.padding(.leading, 2)
		
			}


			
		}.onAppear(perform: {
			fetchNearbyPlaces(searchTerm: meal.country)
		})
			.padding(.bottom, 20)
		.sheet(item: $activeSheet){item in
			switch item {
			case .breakfast:

				SafariView(url:URL(string: self.meal.mealDetails.Breakfast.recipeURL)!)
			case .lunch:
				SafariView(url:URL(string: self.meal.mealDetails.Lunch.recipeURL)!)
			case .dinner:
				SafariView(url:URL(string: self.meal.mealDetails.Dinner.recipeURL)!)
			}
		}
		
		
		
	}
	struct SafariView: UIViewControllerRepresentable {

		let url: URL

		func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
			return SFSafariViewController(url: url)
		}

		func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

		}

	}
	
	func fetchNearbyPlaces(searchTerm: String) {
		let wikipedia = Wikipedia()
		WikipediaNetworking.appAuthorEmailForAPI = "ryley.wells88@gmail.com"
			
		let language = WikipediaLanguage("en")
			
		var result : [String] = []

		let _ = Wikipedia.shared.requestOptimizedSearchResults(language: language, term: searchTerm) { (searchResults, error) in

			guard error == nil else { return }
			guard let searchResults = searchResults else { return }

			
			loadingState = .loaded
			
			
			WikiURL = searchResults.items[0].url!
			
			let tmp = searchResults.items[0].displayText.components(separatedBy: "\n")[0]
			
			let result = tmp.components(separatedBy: ".")
			
			var Sentence = ""
			

			if result.count >= 3{
				WikiResult = result[0] + ". " + result[1] + ". " + result[2] + "."
			}else if result.count  == 2{
				WikiResult = result[0] + ". " + result[1] + ". "
			}else{
				WikiResult = result[0] + "."
			}
			
		
	}
}




struct DailyCuisine_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			DailyCuisine(WikiResult: "", WikiURL: URL(string: "")!,meal: ModelData().meals[0])
				.environmentObject(ModelData())
				.previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
			DailyCuisine(WikiResult: "",  WikiURL: URL(string: "")!,meal: ModelData().meals[0])
				.previewDevice("iPhone 12 Pro Max")
				.environmentObject(ModelData())
				.previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
		}
    }
}
}
