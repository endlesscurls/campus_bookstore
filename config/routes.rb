Rails.application.routes.draw do
  # Routes for the Authorship resource:
  # CREATE
  get "/authorships/new", :controller => "authorships", :action => "new"
  post "/create_authorship", :controller => "authorships", :action => "create"

  # READ
  get "/authorships", :controller => "authorships", :action => "index"
  get "/authorships/:id", :controller => "authorships", :action => "show"

  # UPDATE
  get "/authorships/:id/edit", :controller => "authorships", :action => "edit"
  post "/update_authorship/:id", :controller => "authorships", :action => "update"

  # DELETE
  get "/delete_authorship/:id", :controller => "authorships", :action => "destroy"
  #------------------------------

  # Routes for the Course_material resource:
  # CREATE
  get "/course_materials/new", :controller => "course_materials", :action => "new"
  post "/create_course_material", :controller => "course_materials", :action => "create"

  # READ
  get "/course_materials", :controller => "course_materials", :action => "index"
  get "/course_materials/:id", :controller => "course_materials", :action => "show"

  # UPDATE
  get "/course_materials/:id/edit", :controller => "course_materials", :action => "edit"
  post "/update_course_material/:id", :controller => "course_materials", :action => "update"

  # DELETE
  get "/delete_course_material/:id", :controller => "course_materials", :action => "destroy"
  #------------------------------

  # Routes for the Book resource:
  # CREATE
  get "/books/new", :controller => "books", :action => "new"
  post "/create_book", :controller => "books", :action => "create"

  # READ
  get "/books", :controller => "books", :action => "index"
  get "/books/:id", :controller => "books", :action => "show"

  # UPDATE
  get "/books/:id/edit", :controller => "books", :action => "edit"
  post "/update_book/:id", :controller => "books", :action => "update"

  # DELETE
  get "/delete_book/:id", :controller => "books", :action => "destroy"
  #------------------------------

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
