class User < ApplicationRecord
  def to_pleasant_string
    "#{id}.  #{name.titleize} , account created on #{created_at.to_s(:long)}"
  end
end
