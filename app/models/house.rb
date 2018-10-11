class House < ApplicationRecord
  after_initialize :addc
  def addc
    if current_admin
    else
        self.contact_information_for_listing_realtor=current_user.id.to_s
    end
    end
end
