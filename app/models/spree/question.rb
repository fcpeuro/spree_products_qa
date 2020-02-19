class Spree::Question < ActiveRecord::Base
  belongs_to :product
  has_one :answer, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :answer

  default_scope ->{ order("spree_questions.created_at DESC") }
  scope :visible, ->{ where(is_visible: true) }
  scope :answered, ->{ joins(:answer) }
  scope :not_answered, ->{ includes(:answer).where('spree_answers.id IS NULL').references(:answercategories) }

  validates :content, presence: true

  def answer_for_form
    self.answer.present? ? self.answer : self.build_answer
  end
end
