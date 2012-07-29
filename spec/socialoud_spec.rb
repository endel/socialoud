# encoding: utf-8
require File.expand_path('spec/spec_helper')

describe Socialoud do
  aggregator = nil
  describe Socialoud::Client do
    it 'should be already included' do
      defined?(Socialoud::Client).should == 'constant'
    end

    it 'should load YAML configuration' do
      aggregator = Socialoud::Client.configure(File.expand_path('spec/fixtures/config.yml'))
      aggregator.should be_an_instance_of Socialoud::Client
    end
  end

  describe Socialoud::Services::Gravatar do
    it 'should retrieve image url' do
      aggregator.gravatar.image(300).should == "http://www.gravatar.com/avatar/c35f590e9178794d7f4c4f07192d3772?s=300"
      aggregator.gravatar.profile_url.should == "http://www.gravatar.com/c35f590e9178794d7f4c4f07192d3772"
    end
  end

  describe Socialoud::Services::Twitter do
    it 'should retrieve last tweet' do
      aggregator.twitter.last_tweet.should be_an_instance_of String
      aggregator.twitter.location.should == 'São Leopoldo, Brazil'
    end
  end

  describe Socialoud::Services::Linkedin do
    it 'should retrieve name' do
      aggregator.linkedin.full_name.should == "Endel Dreyer"
      aggregator.linkedin.first_name.should == "Endel"
      aggregator.linkedin.family_name.should == "Dreyer"
    end

    it 'should retrieve headline' do
      aggregator.linkedin.headline.should be_an_instance_of String
    end

    it 'should retrieve current occupation' do
      aggregator.linkedin.current.should be_an_instance_of String
    end

    it 'should retrieve an array of all skills' do
      skills = aggregator.linkedin.skills
      skills.should be_an_instance_of Array
    end

    it 'should retrieve summary' do
      aggregator.linkedin.summary.should be_an_instance_of String
    end
  end

  describe Socialoud::Services::Github do
    it 'should retrieve list of repositories' do
      aggregator.github.repositories.should be_an_instance_of Array
      aggregator.github.repositories.first.should respond_to :name
    end

    it "should retrieve list of followers" do
      aggregator.github.followers
    end
  end
end
