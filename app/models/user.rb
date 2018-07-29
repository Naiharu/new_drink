class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:name]
         attachment :user_image
         has_many :reviews, dependent: :destroy
         has_many :iines, dependent: :destroy
         enum sex: {man: 0, woman: 1}

          def email_required?
          false
          end
          def email_changed?
          false
          end

         validates :name, presence: true, length: { maximum: 10 }
         validates :age, presence: true,numericality: { only_integer: true }
         # validates :email, presence: true
         validates :favorite, presence: true,length: { maximum: 20 }
         validates :sex, presence: true


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
end

