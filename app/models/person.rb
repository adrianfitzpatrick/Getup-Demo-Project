class Person < ActiveRecord::Base
  belongs_to :postcode
  
  scope :email, lambda { |params| 
    
    q = 'lower(email) '
    q += ' NOT ' if params[:emailNeg] == 'true'
    q += ' LIKE ? '
    where(q, "%#{params[:email]}%" )
  }
  
  scope :postcode, lambda  { |params|
    q = "postcodes.number "
    q += ' NOT ' if params[:postcodeNeg] == 'true'
    q += ' IN (?) '
    where(q, params[:postcode].split(',')).joins(:postcode)
  }
  
  scope :all #need a dummy scope for blank searches
  
  def self.filter(list_options)
    raise(ArgumentError, "Expected Hash, got #{list_options.inspect}") \
        unless list_options.is_a?(Hash)

    ar_proxy = Person.all
    list_options.each do |key, value|
      next unless self.list_option_names.include?(key) # only consider list options
      next if value.blank? # ignore blank list options
      ar_proxy = ar_proxy.send(key, list_options['all']) # compose this option
    end
    ar_proxy # return the ActiveRecord proxy object
  end
  
  def self.list_option_names
    self.scopes.map{|s| s.first}
  end
  
  def self.equal?(other)
    #raise(ArgumentError, "Input object is not a Person")\
     # unless other.is_a(Person)
     #print self.name + " = " + other.name + "?"
    self.name.equal?(other.name)
  end
  
  def to_s
    name
  end

end
