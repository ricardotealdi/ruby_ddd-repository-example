module Repositories
  class User
    def find(id)
      user_dto = find_user_dto(id)
      mapper.to_entity(user_dto)
    end

    def save(user)
      user_dto = map_to_dto(user)
      user_dto.save!
      mapper.to_entity(user_dto, user)
    end

    private

    def find_user_dto(id)
      Repositories::Dtos::User.find_by_id(id)
    end

    def map_to_dto(user)
      user_dto = find_user_dto(user.id) || Repositories::Dtos::User.new
      mapper.to_dto(user, user_dto)
    end

    def mapper
      Repositories::Mappers::User.new
    end
  end
end
