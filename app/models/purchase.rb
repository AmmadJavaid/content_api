class Purchase < ApplicationRecord
  belongs_to :purchase_of, polymorphic: true
  belongs_to :purcahsed_by, class_name: 'User', foreign_key: 'user_id'

  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :content_quality, inclusion: {in: %w(HD SD)}
  validate :check_purchase_of_uniqness

  before_create :set_expiry

  scope :expired, -> { where("expire_at < ?", Time.now) }
  scope :alive, -> { where("expire_at >= ?", Time.now) }

  def is_expiry?
    Time.now > self.expire_at
  end

  def set_expiry
    self.expire_at = Time.now + 2.days
  end

  def check_purchase_of_uniqness
    if Purchase.where(purchase_of: self.purchase_of).where("expire_at >= ?", Time.now).exists?
      self.errors.add(:base, 'Item is already purchased')
    end
  end
end
