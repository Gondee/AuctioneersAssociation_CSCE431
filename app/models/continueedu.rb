class Continueedu < ActiveRecord::Base
  belongs_to :member

#Import CSV forms
   def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
       row_hash = row.to_hash
       row_hash["member"] = Member.find(row_hash["member"])
       Continueedu.create! row_hash
     end
   end
end
