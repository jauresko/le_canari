
@books.each do |book|
  json.extract! book, :id, :name
  json.extract! book.cover, :key
end

