require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Design Model" do
  before(:each) do
    @design = Design.new
  end
  it 'can be created' do
    @design.should_not be_nil
  end

  context 'with icons' do
    it 'should have hobby field' do
      @design.hobby = 'hobby-swim'
      @design.hobby.should == 'hobby-swim'
    end
    it 'should have face field' do
      @design.face = 'face-angry'
      @design.face.should == 'face-angry'
    end
    it 'should have job field' do
      @design.job = 'job-cook'
      @design.job.should == 'job-cook'
    end
  end
end
