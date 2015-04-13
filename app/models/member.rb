class Member < ActiveRecord::Base
    
   has_many :payments, dependent: :destroy 
   has_many :pacs, dependent: :destroy
   has_many :continueedus, dependent: :destroy
   has_secure_password
   #validates :password, length: { minimum: 6 }, confirmation: true
   #validates :password_confirmation, presence: true
   validates :Last_Name, presence: true, length: { maximum: 50 }
   validates :First_Name, presence: true, length: { maximum: 50 }
    
   #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   #validates :Main_Email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
    
   #VALID_ZIP_REGEX=/\A[0-9]+\z/
   #validates :Zip, length: { minimum: 5 },  format: { with: VALID_ZIP_REGEX }, allow_blank: true
   
   #VALID_PHONE_REGEX=/\A[0-9]+\z/
   #validates :Main_Phone, length: { maximum: 255 },  format: { with: VALID_PHONE_REGEX }
   
   
   
   #validates :Date_Joined_TAA, :numericality => { :greater_than => 1900, :less_than_or_equal_to => Time.now.year.to_i }
   
   #def FullName
    #[First_Name, Last_Name].join " "
   #end
   
   #Import CSV forms
   def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
       row_hash = row.to_hash
       if row_hash["Pymt_Amt"] != nil
         row_hash["Pymt_Amt"] = row_hash["Pymt_Amt"].gsub(/\D/,'').to_i
       end
       if row_hash["PAC_Contribution"] != nil
         row_hash["PAC_Contribution"] = row_hash["PAC_Contribution"].gsub(/\D/,'').to_i
       end
       if row_hash["Added_to_WebBase"] != nil
         if row_hash["Added_to_WebBase"] == "Y"
           row_hash["Added_to_WebBase"] = true
         else
           row_hash["Added_to_WebBase"] = false
         end
       end
       Member.create! row_hash
     end
   end
   
end
