class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender , inclusion: { in: ["male","female"]}
  validate :presence_of_first_or_last,:presence_of_sue
  
  def presence_of_first_or_last
  	if (first_name.nil? && last_name.nil?)
  		errors.add(:first_name,"Both Cannot be Blank")
  		errors.add(:last_name,"Both Cannot be Blank")
  	end
  end
  
  def presence_of_sue
  	if gender == "male" && first_name == "Sue"
  		errors.add(:first_name,"This cannot be a male name")
  	end
  end

  def self.get_all_profiles(min,max)
  		self.where({birth_year: min..max}).order('birth_year ASC')
  end
end
