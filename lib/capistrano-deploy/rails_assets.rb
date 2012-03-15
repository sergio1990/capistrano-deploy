module CapistranoDeploy
  module RailsAssets
    def self.load_into(configuration)
      configuration.load do
        use_recipe :rails

        namespace :deploy do
          namespace :assets do
            desc 'Precompile assets'
            task :precompile do
              run "cd #{release_path} && RAILS_ENV=#{rails_env} RAILS_GROUPS=assets #{rake} assets:precompile"
            end

            desc 'Clean assets'
            task :clean do
              run "cd #{release_path} && RAILS_ENV=#{rails_env} RAILS_GROUPS=assets #{rake} assets:clean"
            end
          end
        end
      end
    end
  end
end
