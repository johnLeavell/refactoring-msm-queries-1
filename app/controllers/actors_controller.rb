class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index.html.erb" })
  end

  def show
    #get the id from the path
    the_id = params.fetch("path_id")
    #look up the actor where the id appears in the id coloum
    matching_actors = Actor.where({ :id => the_id })
    #get the first element out of the relation
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show.html.erb" })
  end
end
