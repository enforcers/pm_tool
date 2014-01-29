json.start_at_slide @start_at_slide
json.set! :data do
  json.set! :timeline do
    json.headline @project.name
    json.type 'default'
    json.text ' '
    json.startDate @first.start_at.strftime("%Y,%m,%d")
    json.date @milestones do |milestone|
      json.headline milestone.name
      json.text milestone.description
      json.startDate milestone.start_at.strftime("%Y,%m,%d")
      json.endDate milestone.end_at.nil? ? nil : milestone.end_at.strftime("%Y,%m,%d")
    end
  end
end