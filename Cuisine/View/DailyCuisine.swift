//
//  DailyCuisine.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI
import SafariServices
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
				.padding(.bottom, 3)
				.padding(.leading, 10)
				.padding(.trailing, 10)



			Divider()
				.padding(.top, 3)
				.padding(.bottom, 3)

			if loadingState == .loaded{

				Text(WikiResult)
					.font(.system(size: 14, weight: .light, design: .serif))
					.foregroundColor(.black)
					.padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
					.minimumScaleFactor(0.01)


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
					.padding(.top, -10)
					.padding(.leading, 10)
					.font(.footnote)
//					.frame(width: 250, height: 10, alignment: .leading)
					.minimumScaleFactor(0.01)
				Spacer()

			}



			Spacer()
				.frame(minHeight: 5, idealHeight: 10, maxHeight: 10)

			HStack (alignment: .center, spacing: 20){
				VStack {
					Button(action: {activeSheet = .breakfast}){
						meal.mealDetails.Breakfast.image
							.resizable()
//							.frame(width: 80, height: 80, alignment: .center)
							.tag("Breakfast")
							.aspectRatio(1, contentMode: .fit)
							.minimumScaleFactor(0.01)
					}
					Text("Breakfast")
						.foregroundColor(.black)
				}
			.minimumScaleFactor(0.01)
			.padding(.trailing, 10)
			.padding(.leading, 2)
				VStack {
					Button(action: {activeSheet = .lunch}){
						meal.mealDetails.Lunch.image
							.resizable()
//							.frame(width: 80, height: 80, alignment: .center)
							.tag("Lunch")
							.aspectRatio(1,contentMode: .fit)
							.minimumScaleFactor(0.01)
					}
					Text("Lunch")
						.foregroundColor(.black)
				}
			.minimumScaleFactor(0.01)
			.padding(.trailing, 10)
			.padding(.leading, 2)
				VStack {
					Button(action: {activeSheet = .dinner}){
						meal.mealDetails.Dinner.image
							.resizable()
							.tag("Dinner")
							.aspectRatio(1,contentMode: .fit)
							
					}
					Text("Dinner")
						.foregroundColor(.black)
				}
				.padding(.trailing, 10)
				.padding(.leading, 2)
				.minimumScaleFactor(0.01)

			}
			.padding(.leading, 30)
			.padding(.trailing, 30)



		}.onAppear(perform: {
			
			DispatchQueue.global().async {
				let caller = APICaller()
				loadingState = .loading
				caller.fetchWikiAPI(completion: {(result) in
					self.WikiResult = result[0]
					loadingState = .loaded
					
				}, searchTerm: meal.country)
			}
			
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





struct DailyCuisine_Previews: PreviewProvider {
    static var previews: some View {
	
			
			DailyCuisine(WikiResult: "fd",  WikiURL: URL(string: "fd")!,meal: ModelData().meals[0])
				.previewDevice("iPhone 12 Pro Max")
				.environmentObject(ModelData())
				.previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
		
    }
}
}
