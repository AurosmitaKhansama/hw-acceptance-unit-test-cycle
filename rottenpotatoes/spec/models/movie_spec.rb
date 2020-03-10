require 'rails_helper'

RSpec.describe Movie, type: :model do
  require 'rails_helper'

# RSpec.describe Movie, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Movie do
    describe :get_movies_same_director do
        let!(:mv1) { FactoryGirl.create(:movie, id: 1, title: 'terminator', director: 'abc') }
        let!(:mv2) { FactoryGirl.create(:movie, id: 2, title: 'aladin', director: 'abc') }
        let!(:mv3) { FactoryGirl.create(:movie, id: 3, title: "rick n morty", director: 'def') }

        it 'should find movies by same directors' do
            expect(Movie.get_movies_same_director(mv1.director)).to include(mv1.title,mv2.title)
        end

        it 'should not find movies by different directors' do
            expect(Movie.get_movies_same_director(mv1.director)).to_not include([mv3.title])
        end
    end
end
end 