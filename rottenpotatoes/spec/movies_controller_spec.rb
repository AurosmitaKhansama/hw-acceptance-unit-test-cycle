require "rails_helper"

RSpec.describe MoviesController, :type => :controller do
    describe 'GET movies_same_director' do 
    it "should get called with apt parameters" do
        mv1 = Movie.new
        mv2 = Movie.new
        fake_results=[mv1,mv2]
        director = "ABC"
        title = "Alien"

        Movie.should_receive(:get_movies_same_director).with(director).and_return(fake_results)

        get :movies_same_director, :director => director, :title => title
    end
    it "should render movies_same_director with same director movies" do
        mv1 = double("movie 2")
        mv2 = double("movie 1")
        fake_results=[mv1,mv2]
        director = "ABC"
        title = "Alien"

        Movie.stub(:get_movies_same_director).with(director).and_return(fake_results)

        get :movies_same_director, :director => director, :title => title
        response.should render_template('movies_same_director')

    end
        it "should redirect_to home page when no director" do
        title = "Alien"
        get :movies_same_director, :director => nil, :title => title
        response.should redirect_to('/movies')

    end
end
end 