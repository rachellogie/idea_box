

class IdeaBox < Sinatra::Base
  set :method_override, true

  db = {}

  get '/' do
    erb :index, :locals => {db: db}
  end

  post '/' do
    title = params[:idea_title]
    description = params[:idea_description]
    db[title] = description
    erb :index, :locals => {db: db}
  end

  delete '/' do
    name = params[:idea_name]
    if db.has_key? name
      db.delete(name)
    end
    erb :index, :locals => {db: db}
  end


end