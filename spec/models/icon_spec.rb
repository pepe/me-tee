require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe Icon do
  before(:each) do
    Icon.destroy_all
  end
  it "is initialized" do
    Icon.new.should be_true
  end
  it "is filled with right attributes when initialized" do
    icon = Icon.new(:name => 'cook', :filename => 'cook.gif', :type => 'hobby')
    icon.name.should == 'cook'
  end
  it "have id as 'hobby-cook'" do
    icon = Icon.new(:name => 'cook', :filename => 'cook.gif', :type => 'hobby')
    icon.id.should == 'hobby-cook'
  end
  it "is then retrieved by key like 'hobby-cook'" do
    icon = Icon.create(:name => 'cook', :filename => 'cook.gif', :type => 'hobby')
    Icon.find('hobby-cook').should == icon
  end

  context "on the web" do
    it "prints whole path to the picture" do
      icon = Icon.create(:name => 'cook', :filename => 'cook.gif', :type => 'hobby')
      icon.path.should == '/icons/cook.gif'
    end
    it "prints full name with type" do
      icon = Icon.create(:name => 'cook', :filename => 'cook.gif', :type => 'hobby')
      icon.full_name.should == 'hobby cook'
    end
  end

  context "type scopes" do
    it "finds hobby icons " do
      icon = Icon.create(:name => 'cook', :filename => 'cook.gif', :type => 'hobby')
      Icon.hobbies.should == [icon]
    end
    it "finds face icons " do
      icon = Icon.create(:name => 'cook', :filename => 'cook.gif', :type => 'face')
      Icon.faces.should == [icon]
    end
    it "finds job icons " do
      icon = Icon.create(:name => 'cook', :filename => 'cook.gif', :type => 'job')
      Icon.jobs.should == [icon]
    end
  end

  context 'random' do
    it 'should get random icon for type' do
      %(swim voley read).each do |icon|
        Icon.create(:name => icon, :type => 'hobby', :filename => "#{icon}.gif")
      end
      Icon.create(:name => 'angry', :type => 'face', :filename => "angry.gif")
      5.times {Icon.random('hobby').should =~ /hobby-.*/}
    end
  end
end
