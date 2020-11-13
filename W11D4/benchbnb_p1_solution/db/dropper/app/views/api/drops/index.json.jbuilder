# debugger
@drops.each do |drop|
  json.drops do
    json.set! drop.id do 
      json.partial! "api/drops/drop", drop: drop
    end
  end

  json.users do
    json.set! drop.author_id do
      json.extract! drop.author, :id, :username
    end
  end
end