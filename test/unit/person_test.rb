require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  
  fixtures :people
  
  test "testcase_0" do

    @peeps = Person.find(:all)
    assert_equal 10, @peeps.count
  end
  
  test "testcase_1" do
    params = {:email => 'hotmail'}
    params['all'] = params
    @people = Person.filter(params)
    assert_equal 2, @people.count
    assert @people.include?(people(:person_1))
    assert @people.include?(people(:person_7))
  end
  
  test "testcase_2" do
    params = {:postcode => '2000', :postcodeNeg => 'true'}
    params['all'] = params
    @people = Person.filter(params);
    assert_equal 8, @people.count
    assert @people.include?(people(:person_2))
    assert @people.include?(people(:person_3))
    assert @people.include?(people(:person_4))
    assert @people.include?(people(:person_5))
    assert @people.include?(people(:person_7))
    assert @people.include?(people(:person_8))
    assert @people.include?(people(:person_9))
    assert @people.include?(people(:person_10))
    #assert @people.include?(['Christian Hoying', 'Max Moshier', 'Noreen Zacharias', 'Darren Radovich', 'Ted Kuehne', 'Clinton Banegas', 'Neil Ancona', 'Clare Straube'])
  end
  
  test "testcase_3" do
     params = {:postcode => '2000,2010'}
     params['all'] = params
     @people = Person.filter(params);
     assert_equal 4, @people.count
     assert @people.include?(people(:person_1))
     assert @people.include?(people(:person_2))
     assert @people.include?(people(:person_6))
     assert @people.include?(people(:person_7))
     #assert @people.include?(['Cody Kinnaman', 'Christian Hoying', 'Erik Pendergast', 'Ted Kuehne'])
  end
  
  test "testcase_4" do
      params = {:postcode => '2010', :email => 'gmail'}
      params['all'] = params
      @people = Person.filter(params);
      #assert people.include?('Christian Hoying')
      assert_equal 1, @people.count
  end
  
  test "testcase_5" do
    params = {:postcode => '2060,2061,2065', :email => 'gmail', :emailNeg => 'true'}
    params['all'] = params
    @people = Person.filter(params);
    assert_equal 4, @people.count
    #assert people.include?(['Noreen Zacharias', 'Darren Radovich', 'Clinton Banegas', 'Clare Straube'])
  end
  
end
