class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  def clickbait?
    clickbait_keywords = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title
      if !clickbait_keywords.any? {|ele| self.title.include?(ele)}
        errors.add(:title, "must be clickbait")
      end
    else
      errors.add(:title, "must be clickbait")
    end
  end

end
