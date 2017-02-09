json.array! @parties do |party|
  json.partial! 'api/parties/party', party: party
  json.guests do
    json.array! party.guests, partial: 'api/guests/guest', as: :guest
  end
end
