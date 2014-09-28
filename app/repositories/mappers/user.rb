module Repositories
  module Mappers
    class User
      def to_entity(user_dto, user_entity = Entities::User.new)
        return Entities::User.nil unless user_dto

        user_entity.tap do |entity|
          entity.id = user_dto.id
          entity.name = user_dto.name
          entity.email = user_dto.email
        end
      end

      def to_dto(user_entity, user_dto)
        user_dto.tap do |dto|
          dto.id = user_entity.id
          dto.name = user_entity.name
          dto.email = user_entity.email
        end
      end
    end
  end
end
