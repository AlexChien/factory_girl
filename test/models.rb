ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => File.join(File.dirname(__FILE__), 'test.db')
)

class CreateSchema < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.boolean :admin, :default => false
    end

    create_table :posts, :force => true do |t|
      t.string  :title
      t.integer :author_id
    end
        
    create_table :companies, :force => true do |t|
      t.string :name
    end
    
  end
end

CreateSchema.suppress_messages { CreateSchema.migrate(:up) }

class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email
  has_many :posts, :foreign_key => 'author_id'
end

class Post < ActiveRecord::Base
  validates_presence_of :title, :author_id
  belongs_to :author, :class_name => 'User'
end

class Company < ActiveRecord::Base
end
