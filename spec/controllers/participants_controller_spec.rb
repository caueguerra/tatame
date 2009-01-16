require File.dirname(__FILE__) + '/../spec_helper'

describe ParticipantsController do
  before(:each) do
    @participant = mock_model(Participant)
  end
  
  it "should save the participant and redirect to root_url" do
    Participant.should_receive(:new).once.and_return(@participant)
    @participant.should_receive(:dojo_id=).once
    @participant.should_receive(:save).once.and_return(true)
    
    post 'create'
    assigns[:participant].should equal(@participant)
    response.should redirect_to(root_url)
  end
  
  it "should delete a participant" do
    Participant.should_receive(:find).once.with(params[:id]).and_return(@participant)
    @participant.should_receive(:destroy).once
    
    post 'destroy'
    response.should redirect_to(root_url)
  end
end