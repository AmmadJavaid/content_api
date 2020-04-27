class FetchLibraryService
  attr_accessor :user_id

  def initialize(user_id)
    self.user_id = user_id
  end

  def execute
    Purchase.includes(:purchase_of).where(user_id: self.user_id).alive.order('expire_at asc')
  end
end
