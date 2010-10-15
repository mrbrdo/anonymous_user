class AnonymousUserGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  include Rails::Generators::Migration
  
  def files
    class_collisions 'AnonymousUser'
    template 'model.rb', File.join('app/models', 'anonymous_user.rb')
    migration_template 'migration.rb', 'db/migrate/create_anonymous_users.rb'
  end
  
  private
    def self.next_migration_number(dirname) #:nodoc:
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end
end
