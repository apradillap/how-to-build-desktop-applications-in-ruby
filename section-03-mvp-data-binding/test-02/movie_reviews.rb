require 'glimmer-dsl-libui'

require 'facets/array/average'

MovieReview = Struct.new(:reviewer, :movie, :rating, keyword_init: true) do
  def reset
    self.reviewer = ''
    self.movie = ''
    self.rating = 0
  end
end

MovieRating = Struct.new(:movie, :average_rating, :reviewers, keyword_init: true) do
  def rating
    average_rating.round(2).to_s
  end
end

class MovieReviewsPresenter
  def new_movie_review
    @new_movie_review ||= MovieReview.new(rating: 0)
  end
  
  def save
    movie_review = @new_movie_review.clone
    movie_reviews << movie_review
    @new_movie_review.reset
  end
  
  def movie_reviews
    @movie_reviews ||= []
  end
  
  def movie_ratings
    movie_reviews.group_by(&:movie).map do |movie, movie_reviews|
      average_rating = movie_reviews.map(&:rating).average
      reviewers = movie_reviews.map(&:reviewer).join(', ')
      MovieRating.new(movie: movie, average_rating: average_rating, reviewers: reviewers)
    end
  end
  
  def movies
    movie_reviews.map(&:movie).uniq.sort
  end
end

class MovieReviewsView
  include Glimmer
  
  def initialize
    @movie_reviews_presenter = MovieReviewsPresenter.new
    create_gui_body
  end
  
  def create_gui_body
    @window = window {
      title 'Movie Reviews'
      content_size 550, 550
      margined true
      
      vertical_box {
        form {
          stretchy false
          
          entry {
            label 'Reviewer'
            text <=> [@movie_reviews_presenter.new_movie_review, :reviewer]
          }
        
          editable_combobox {
            label 'Movie'
            items <= [@movie_reviews_presenter, :movies, computed_by: :movie_reviews]
            text <=> [@movie_reviews_presenter.new_movie_review, :movie]
          }
          
          spinbox(0, 10) {
            label 'Rating'
            value <=> [@movie_reviews_presenter.new_movie_review, :rating]
          }
        }
        
        button('Save') {
          stretchy false
          
          on_clicked do
            @movie_reviews_presenter.save
          end
        }
        
        table {
          text_column 'Movie'
          text_column 'Rating'
          text_column 'Reviewers'
          
          cell_rows <=> [@movie_reviews_presenter, :movie_ratings, computed_by: :movie_reviews]
        }
      }
    }
  end
  
  def launch
    @window.show
  end
end

@movie_reviews_view = MovieReviewsView.new
@movie_reviews_view.launch
