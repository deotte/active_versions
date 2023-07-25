# Active Versions

A small project showcasing a cool thing you can do with `ActiveRecord` - creating versioned records in a Rails application without using a gem.

## Technology Used

- Rails
- [ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html)
- [ActiveModel::Dirty](https://api.rubyonrails.org/classes/ActiveModel/Dirty.html)

## Local Development

You'll first need an environment that can run Rails (like Unix), or a good Docker image to use for Windows. Second, you'll need Postgres installed locally.

### Cloning the Project

1. Clone the project locally
2. Once cloned, navigate to the project, and use the `.env.example` to create a `.env` file. This will be used for connecting to the DB locally.
3. Make sure Ruby and Rails is installed locally. (A version manager like [rbenv](https://github.com/rbenv/rbenv) might also be required if multiple Rails projects are on your machine)
4. Run `bundle install`

### Connecting to Postgres
1. Before continuing, make sure you have Postgres installed locally, and can access it. This could be through `psql`, or a desktop application like [PgAdmin](https://www.pgadmin.org/) or [DBeaver](https://dbeaver.io/).
2. Create a database locally, you could name it `versionhistory`, or whatever suits your fancy.
2. You could also create a database on a service like Supabase and connect to it locally, it would probably just take a few more steps.
3. Find the connection details of your local postgres database. You'll need the `HOST`, `DATABASE`, `USERNAME`, and `PASSWORD`. `PORT` should default to 5432.
4. Once connected, you should be able to run your rails commands and start your server!

### Running the Project
1. With Postgres connected, you should be able to run `rails db:setup` to create your tables, load the schema, and run the seeds file that creates `Customers` and `CustomerVersions`.
2. You may or may not need to run `rake assets:precompile` and `rake assets:clean`.
3. Start the project up with `rails s`
