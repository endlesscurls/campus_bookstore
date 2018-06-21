Rails.application.routes.draw do
  devise_for :students
  # Routes for the Student resource:
  # READ
  get "/students", :controller => "students", :action => "index"
  get "/students/:id", :controller => "students", :action => "show"


  # Routes for the Course resource:
  # CREATE
  get "/courses/new", :controller => "courses", :action => "new"
  post "/create_course", :controller => "courses", :action => "create"

  # READ
  get "/courses", :controller => "courses", :action => "index"
  get "/courses/:id", :controller => "courses", :action => "show"

  # UPDATE
  get "/courses/:id/edit", :controller => "courses", :action => "edit"
  post "/update_course/:id", :controller => "courses", :action => "update"

  # DELETE
  get "/delete_course/:id", :controller => "courses", :action => "destroy"
  #------------------------------

  # Routes for the Author resource:
  # CREATE
  get "/authors/new", :controller => "authors", :action => "new"
  post "/create_author", :controller => "authors", :action => "create"

  # READ
  get "/authors", :controller => "authors", :action => "index"
  get "/authors/:id", :controller => "authors", :action => "show"

  # UPDATE
  get "/authors/:id/edit", :controller => "authors", :action => "edit"
  post "/update_author/:id", :controller => "authors", :action => "update"

  # DELETE
  get "/delete_author/:id", :controller => "authors", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
