class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # has_many :items
         has_many :reviews
         has_many :iines, dependent: :destroy
         attachment :user_image


        has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

 		    has_many :followings, through: :following_relationships

 		    has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy

 		    has_many :followers, through: :follower_relationships

        def following?(other_user)
    	following_relationships.find_by(following_id: other_user.id)
  		end

  		def follow!(other_user)
    	following_relationships.create!(following_id: other_user.id)
 		end

  		def unfollow!(other_user)
    	following_relationships.find_by(following_id: other_user.id).destroy
  		end
      
         enum sex: { man: 0, woman: 1}

end

