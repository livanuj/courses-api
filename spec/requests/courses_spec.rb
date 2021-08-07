require 'rails_helper'

RSpec.describe "Courses", type: :request do
  let!(:courses) { create_list(:course, 10) }

  # Test suite for GET /courses
  describe "/courses" do
    context "GET /courses with no filters" do
      before { get '/api/v1/courses' }
      it 'get courses' do
        expect(json).not_to be_empty
        expect(json['data'].size).to eq(10)
      end
  
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    # Test suite for filter by self_assignable GET /courses?filter[self_assignable]=true
    context "GET /courses with filter" do
      let(:self_assignable_count) { Course.self_assignable_courses.count }
      before { get '/api/v1/courses?filter[self_assignable]=true' }

      it 'get courses with filter self_assignable true' do
        expect(json['data'].size).to eq(self_assignable_count)
        expect(json['data'].pluck('attributes').pluck('self_assignable').all?).to be(true)
      end
    end

    #Test suite for Get /course/:id
    context "GET /course/:id, show action with provided id" do
      let(:course) { create(:course) }
      before { get "/api/v1/courses/#{course.id}" }
      it 'show course' do
        expect(json).not_to be_empty
        expect(json['data']['id']).to eql(course.id.to_s)
        expect(json['data']['attributes']['name']).to eql(course.name)
      end
    end
    
    context "GET /course/:id, show action with provided id and included coach" do
      let(:course) { create(:course) }
      before { get "/api/v1/courses/#{course.id}?include=coach" }
      it 'show course' do
        expect(json).not_to be_empty
        expect(json['included'][0]['attributes']['name']).to eql(course.coach.name)
      end
    end

    # Test suite for POST /courses
    context "POST /courses" do
      let (:course_name) { 'Ruby on Rails Course' }
      let!(:coach) { create(:coach) }
      headers = { "Content-Type" => "application/vnd.api+json" }

      before {
        post '/api/v1/courses', params: {
          data: {
            type: 'courses',
            attributes: {
              name: course_name,
              "self_assignable": true,
            },
            relationships: {
              coach: {
                data: {
                  type: "coaches",
                  id: coach.id
                }
              }
            }
          }
        },
        as: :json,
        headers: {
          'Accept' => JSONAPI::MEDIA_TYPE,
          'Content-Type' => JSONAPI::MEDIA_TYPE
        } }
      it 'creates a course' do
        expect(response).to have_http_status(:created)
        expect(json['data']['attributes']['name']).to eq('Ruby on Rails Course')
      end
    end
  end
end
