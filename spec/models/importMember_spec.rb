require 'spec_helper'

describe MembersController, type: :controller do
    describe "merbers import" do
        it "redirects to the members page" do
            allow(Member).to receive(:import).with("foo.txt")
            post :import, file: "foo.txt"
            expect(response).to redirect_to members_url
        end
        
        it "adds a notice" do
            allow(Member).to receive(:import).with("foo.txt")
            post :import, file: "foo.txt"
            expect(flash[:notice]).to eq "Products imported."
        end
        
        it "imports the members file" do
            expect(Member).to receive(:import).with("foo.txt")
            post :import, file: "foo.txt"
        end
    end
end   