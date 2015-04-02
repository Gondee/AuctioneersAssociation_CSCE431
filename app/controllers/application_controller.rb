#rails generate scaffold Member Last_Name:string First_Name:string Company:string TX_License:integer Street1:text City:string State:string Zip:integer Main_Phone:string Main_Email:string Customer_Type:string Date_Joined_TAA:integer Pymt_Type:string Pymt_Amt:integer Pymt_Date:date Notes:text Added_to_WebBase:boolean PAC_Contribution:integer Annual_Convention_CE_Hours:integer Online_CE_Hours:integer
#rails destroy scaffold Member
#bundle exec rake db:migrate
#Roll Back database: bundle exec rake db:rollback
#remove develpment database
#sqlite3 db/development.sqlite3
#drop table table_name;
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def hello
    render text: "hello, world!"
  end
  def hello2
    render text: "hello, world2!"
  end
end