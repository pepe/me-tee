set :application, "me-tee.laststar.eu"
set :repository, "git://github.com/pepe/me-tee.git"
set :revision, "origin/deploy"

# Set :user if you want to connect (via ssh) to your server using a
# different username. You will also need to include the user in :domain
# (see below).
#
set :user, "deploy"
set :domain, "deploy@fina.laststar.eu"

set :deploy_to, "/var/apps/#{application}"

# ============================================================================
# You probably don't need to worry about anything beneath this point...
# ============================================================================

require "tempfile"
require "vlad"

namespace :vlad do
  remote_task :bundle_install do
    run %{cd #{current_path} && RB_USER_INSTALL="1" bundle install}
  end

  remote_task :link_icons do
    run %{cd #{current_path} && ln -s #{shared_path}/icons/*.gif public/icons/}
  end
  
  task :update do
    Rake::Task["vlad:bundle_install"].invoke
    Rake::Task["vlad:link_icons"].invoke
  end

  # Depending on how you host Nesta, you might want to swap :start_app
  # with :start below; :start_app works fine with Phusion Passenger, which
  # is the default app server (you can change it in the call to Vlad.load
  # in Rakefile).
  desc "Deploy the code and restart the server"
  task :deploy => [:update, :start_app]

  remote_task :start_app, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end
