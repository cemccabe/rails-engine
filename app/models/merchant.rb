class Merchant < ApplicationRecord
  has_many :items

  def self.search(name)
    where('name ILIKE ?', "%#{name.downcase}%")
            .order(Arel.sql('lower(name)'))
            .limit(1)
            .first
  end
end
