json.partial! 'api/parties/party', party: @party
json.guests do
  json.array! @party.guests, partial: 'api/guests/guestgifts', as: :guest
end
