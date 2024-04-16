import Foundation
import TabularData

// MARK: -> ActivityModel

@Observable
public class ActivityModel{
    var name: String
    var description: String
    var energyLevel: String
    var rating: String
    
    init(name: String = "", description: String = "", energyLevel: String = "", rating: String = "") {
        self.name = name
        self.description = description
        self.energyLevel = energyLevel
        self.rating = rating
    }
    
    public func loadCSV(from csvName: String) -> [ActivityModel] {
        var csvToStruct = [ActivityModel]()
        
        // locate the csv file
        guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
            return []
        }
        
        // convert the contents of the file into one very long string
        var data = ""
        do {
            guard let data = try? String(contentsOfFile: filePath, encoding: .utf8) else {
                // Handle error if unable to read file or convert data to string
                print("cannot convert contents of file to string")
                return[]
            }
            
            
            // split the long string into an arrow of "rows" of data. Each row is a string
            // detect "\n" carriage return, then split
            var rows = data.components(separatedBy: "\n")
            
            // remove header rows
            // count the num of header columns before removing
            let columnCount = rows.first?.components(separatedBy: ",").count
            rows.removeFirst()
            
            // loop around each row and split into columns
            for row in rows {
                let csvColumns = row.components(separatedBy: ",")
                if csvColumns.count == columnCount {
                    let activityStruct = ActivityModel.init(name: csvColumns[0], description: csvColumns[1], energyLevel: csvColumns[2], rating: csvColumns[3])
                    csvToStruct.append(activityStruct)
                }
            }
            
            return csvToStruct
            
        }
    }
}
