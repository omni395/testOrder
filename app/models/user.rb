class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role # принадлежит ролям

  # Устанавливаем роль при создании пользователя
  before_create :set_role

  # Валидации
  validates :name, presence: true,
            length: { maximum: 30 }

  # Проверка роли пользователя и активности аккаунта
  def is_role?(role)
    self.role == Role.find_by_name(role)
  end

  #def active_for_authentication?
  #  super && self.active?
  #end

  #def inactive_message
  #  :inactive
  #end
  
  private
    def set_role
      if User.first == nil
        self.role = Role.find_by_name('admin')
        #self.active = true #
      else
        self.role = Role.find_by_name('registered')
      end
    end
end