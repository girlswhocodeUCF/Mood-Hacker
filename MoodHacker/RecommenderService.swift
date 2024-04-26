import Foundation
import Combine
import NaturalLanguage

public class RecommenderService: ObservableObject {
    @Published var recommendedActivities: [ActivityModel] = []
    
    public init(for userEnergyLevel: String) {
        var activityModel = ActivityModel()
        let allActivities = activityModel.loadCSV(from: "activity_list")
        
        var likedActivity = getRatedActivity(for: userEnergyLevel, activities: allActivities)
        
        recommendedActivities = recommendActivitiesBasedOnDescription(likedActivity!, energyLevel: userEnergyLevel, allActivities: allActivities)
    }
    
    
    public func getRecommendedActivities() -> [ActivityModel] {
        return recommendedActivities
    }
    
    public func updateRecommendedActivities(for userEnergyLevel: String) {
            var activityModel = ActivityModel()
            let allActivities = activityModel.loadCSV(from: "activity_list")

            var likedActivity = getRatedActivity(for: userEnergyLevel, activities: allActivities)

            recommendedActivities = recommendActivitiesBasedOnDescription(likedActivity!, energyLevel: userEnergyLevel, allActivities: allActivities)
        }

    
    // Filters out activities by user's energy level and filters out negatively rated activities
    func filterActivities(for energyLevel: String, activities: [ActivityModel]) -> [ActivityModel] {
        return activities.filter { $0.energyLevel == energyLevel && $0.rating != "0" }
    }

    // Returns a single positively rated activity
    func getRatedActivity(for energyLevel: String, activities: [ActivityModel]) -> ActivityModel? {
        let filteredActivities = filterActivities(for: energyLevel, activities: activities)
        let wellRatedActivities = filteredActivities.filter { $0.rating.trimmingCharacters(in: .whitespacesAndNewlines) == "1" }
        return wellRatedActivities.randomElement()
    }

    // Compute similarity between two activity descriptions using word embeddings
    func computeDescriptionSimilarity(_ description1: String, _ description2: String) -> Double {
        if let sentenceEmbedding = NLEmbedding.sentenceEmbedding(for: .english) {
            if let vector = sentenceEmbedding.vector(for: description1) {
                print(vector)
            }
            
            let distance = sentenceEmbedding.distance(between: description1, and: description2)
            print(distance.description);
            return distance
        }
        return 100000.0
    }

    // Step 3: Recommend activities based on description similarity
    func recommendActivitiesBasedOnDescription(_ activity: ActivityModel, energyLevel: String, allActivities: [ActivityModel]) -> [ActivityModel] {
        let filteredActivities = filterActivities(for: energyLevel, activities: allActivities)
        let similarActivities = filteredActivities.filter { $0.name != activity.name } // Exclude the chosen activity
            .sorted { computeDescriptionSimilarity(activity.description, $0.description) > computeDescriptionSimilarity(activity.description, $1.description) }
            .prefix(2) // Return 2 most similar activities based on description
        return Array(similarActivities)
    }
    
    func getUserEnergyLevel() -> String {
        // Implement
        return "High" // Placeholder
    }
}


