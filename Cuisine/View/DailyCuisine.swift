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
	
//	@EnvironmentObject var modelData: ModelData
	
	@State private var activeSheet : ActiveSheet?
	@State private var loadingState = LoadingState.loading
	@State var WikiResult : String

	
	var meal: Meal

    var body: some View {
		

        VStack {
			
			MapDate(meal:meal)
				.frame(width: 250, height: 150, alignment: .center)
				.padding(.bottom, 75)
				.padding(.top, 1)
			
            

			Divider()
				.padding(10)
                    
			if loadingState == .loaded{
				
				Text(WikiResult)
					.font(.system(size: 14, weight: .light, design: .serif))
					.foregroundColor(.black)
					.lineLimit(6)
					.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
					.frame(height: 150)
				
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
			
			
			Spacer()
				.frame(minHeight: 15, idealHeight: 25, maxHeight: 30)

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
			fetchNearbyPlaces()
		})
			.padding(.bottom, 40)
		.sheet(item: $activeSheet){item in
			switch item {
			case .breakfast:
//				mealDetail(activeSheet: self.$activeSheet, m: meal.mealDetails.Breakfast)
				SafariView(url:URL(string: self.meal.mealDetails.Breakfast.recipeURL)!)
			
			case .lunch:
//				mealDetail(activeSheet: self.$activeSheet, m: meal.mealDetails.Lunch)
				SafariView(url:URL(string: self.meal.mealDetails.Lunch.recipeURL)!)
			case .dinner:
//				mealDetail(activeSheet: self.$activeSheet, m: meal.mealDetails.Dinner)
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
	
	func fetchNearbyPlaces() {
		let wikipedia = Wikipedia()
		WikipediaNetworking.appAuthorEmailForAPI = "ryley.wells88@gmail.com"
			
		let language = WikipediaLanguage("en")
			
		var result : [String] = []

		let _ = Wikipedia.shared.requestOptimizedSearchResults(language: language, term: "Soft rime") { (searchResults, error) in

			guard error == nil else { return }
			guard let searchResults = searchResults else { return }

			print(searchResults.items[0].displayText.components(separatedBy: "\n")[0])
			loadingState = .loaded
			WikiResult = searchResults.items[0].displayText.components(separatedBy: "\n")[0]
	}
}




struct DailyCuisine_Previews: PreviewProvider {
    static var previews: some View {
		DailyCuisine(WikiResult: "", meal: ModelData().meals[0])
			.environmentObject(ModelData())
			.previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
}
