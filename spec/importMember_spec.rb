require 'spec_helper'

describe MembersController, type: :controller do
    describe "merbers import" do
        it "redirects to the members page" do
            allow(Member).to receive(:import).with("foo.csv")
            post :import, file: "foo.csv"
            expect(response).to redirect_to members_path
        end
        
        it "adds a notice" do
            allow(Member).to receive(:import).with("foo.csv")
            post :import, file: "foo.csv"
            expect(flash[:notice]).to eq "Products imported."
        end
        
        it "imports the members file" do
            expect(Member).to receive(:import).with("foo.csv")
            post :import, file: "foo.csv"
        end
        
        it "converts the table to correct format" do
            
        end
    end
end   