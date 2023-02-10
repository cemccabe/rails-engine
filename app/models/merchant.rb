class Merchant < ApplicationRecord
  has_many :items

  def self.search(name)
    Merchant.where('lower(name) ILIKE ?', "%#{name.downcase}%")
            .order(Arel.sql('lower(name)'))
            .limit(1)
  end
end
