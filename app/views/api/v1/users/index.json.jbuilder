json.array! @users do |user|
  json.extract! user, :id, :username, :phone_number, :email, :first_name, :last_name, :coins
end
