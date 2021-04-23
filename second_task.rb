confirmTot = 0
deathTot = 0
comfirmSlot = {}
deathSlot = {}
vacinSlot = {}
confirmSort = []


File.open "boletim-covid-21-04-2021.csv" do |file|
  puts file.each_line{|l|   
    datab = l.split ","
    state = datab[6].to_sym

    comfirmSlot[state] = datab[8].to_i
    deathSlot[state] = datab[9].to_i
    vacinSlot[state] = datab[10].to_i
    confirmSort.push(datab[8])
    confirmTot += datab[8].to_i
    deathTot += datab[9].to_i
  }
end

stateConfirmedSort = comfirmSlot.sort_by{|key, value|value}
stateDeathSort = deathSlot.sort_by{|key, value|value}
stateVacinationSort = vacinSlot.sort_by{|key, value|value}

def print message, first_state, first_number, second_state, second_number, third_state, third_number
  puts ""
  puts message
  puts "1º #{first_state} com #{first_number} pessoas"
  puts "2º #{second_state} com #{second_number} pessoas"
  puts "3º #{third_state} com #{third_number} pessoas"
end

max_confirmed_cases = [stateConfirmedSort[27], stateConfirmedSort[26], stateConfirmedSort[25]]
max_vaccination = [stateVacinationSort[27], stateVacinationSort[26], stateVacinationSort[25]]
max_deaths = [stateDeathSort[27], stateDeathSort[26], stateDeathSort[25]]
min_confirmed_cases = [stateConfirmedSort[1], stateConfirmedSort[2], stateConfirmedSort[3]]
min_vaccination = [stateVacinationSort[1], stateVacinationSort[2], stateVacinationSort[3]]
min_deaths = [stateDeathSort[1], stateDeathSort[2], stateDeathSort[3]]

print "Os três estados com mais casos confirmados são:", max_confirmed_cases[0][0], max_confirmed_cases[0][1], max_confirmed_cases[1][0], max_confirmed_cases[1][1], max_confirmed_cases[2][0], max_confirmed_cases[2][1]

print "Os três estados com maior índice de vacinação:", max_vaccination[0][0], max_vaccination[0][1], max_vaccination[1][0], max_vaccination[1][1], max_vaccination[2][0], max_vaccination[2][1]

print "Os três estados com mais mortes são:", max_deaths[0][0], max_deaths[0][1], max_deaths[1][0], max_deaths[1][1], max_deaths[2][0], max_deaths[2][1]

print "Os três estados com menos casos confirmados são:", min_confirmed_cases[0][0], min_confirmed_cases[0][1], min_confirmed_cases[1][0], min_confirmed_cases[1][1], min_confirmed_cases[2][0], min_confirmed_cases[2][1]

print "Os três estados com menor índice de vacinação:", min_vaccination[0][0], min_vaccination[0][1], min_vaccination[1][0], min_vaccination[1][1], min_vaccination[2][0], min_vaccination[2][1]

print "Os três estados com menos mortes são:", min_deaths[0][0], min_deaths[0][1], min_deaths[1][0], min_deaths[1][1], min_deaths[2][0], min_deaths[2][1]

puts ""

puts "Total de casos confirmados: #{confirmTot}"
puts "Total de mortes: #{deathTot}"