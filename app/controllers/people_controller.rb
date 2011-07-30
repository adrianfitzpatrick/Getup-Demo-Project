class PeopleController < ApplicationController
  # GET /people
  # GET /people.xml
  def index

    @list_options = load_list_options
    
    @people = Person.filter(@list_options)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  private

  def load_list_options
    # define default list options here. They will be used if none are given
    options = {}
    # find relevant query parameters and override list options
    Person.list_option_names.each do |name|
      options[name] = params[name] unless params[name].blank?
    end
    #need to add full params list so that model scopes can access "neg" params
    options['all'] = params
    options
  end
  
end
