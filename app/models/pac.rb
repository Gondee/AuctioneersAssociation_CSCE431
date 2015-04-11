class Pac < ActiveRecord::Base
  belongs_to :member

#Import CSV forms
   def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
       row_hash = row.to_hash
       if row_hash["PAC_Contribution"] != nil
         row_hash["PAC_Contribution"] = row_hash["PAC_Contribution"].gsub(/\D/,'').to_i
       end
       row_hash["member"] = Member.find(row_hash["member"])
       Pac.create! row_hash
     end
   end
end
