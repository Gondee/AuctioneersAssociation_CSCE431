require 'spec_helper'

describe MembersController, type: :controller do
    describe "merbers import" do
        it "redirects to the members page" do
<<<<<<< HEAD:spec/models/importMember_spec.rb
            allow(Member).to receive(:import).with("foo.csv")
            post :import, file: "foo.csv"
            expect(response).to redirect_to members_url
=======
            allow(Member).to receive(:import).with("foo.txt")
            post :import, file: "foo.txt"
            expect(response).to redirect_to members_path
>>>>>>> a1024417680535f001033516304f84b71204d299:spec/importMember_spec.rb
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
        

    end
end   