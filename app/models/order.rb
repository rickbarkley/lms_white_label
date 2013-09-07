# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  course_id  :integer
#  expiration :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ActiveRecord::Base
    attr_accessible :course_title, :stripe_card_token, :course_id, :user_id
    attr_accessor :stripe_card_token
    # attr_accessible :title, :body
    belongs_to :course
    belongs_to :user
    accepts_nested_attributes_for :course
    
    
    def save_with_payment
        
        @amount = self.course.cost
        
        if valid?
            charge = Stripe::Charge.create(amount: @amount, currency: 'usd', card: stripe_card_token)
            #self.stripe_customer_token = customer.id
            save!
        end
        rescue Stripe::InvalidRequestError => e
        logger.error "Stripe error while creating customer: #{e.message}"
        errors.add :base, "There was a problem with your credit card."
        false
    end
    
    # It returns the articles whose titles contain one or more words that form the query
    def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("user_id like ?", "%#{query}%")
    end
end
