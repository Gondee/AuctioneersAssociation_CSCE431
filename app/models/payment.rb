class Payment < ActiveRecord::Base
  belongs_to :member
  
   #Import CSV forms
   def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
       row_hash = row.to_hash
       if row_hash["Pymt_Amt"] != nil
         row_hash["Pymt_Amt"] = row_hash["Pymt_Amt"].gsub(/\D/,'').to_i
       end
       row_hash["member"] = Member.find(row_hash["member"])
       Payment.create! row_hash
     end
   end
   
end
