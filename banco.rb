saldo_inicial = ["Saldo Inicial",1000.to_i]
movimentos = []
movimentos.push(saldo_inicial)
acumulado = saldo_inicial[1]
op_adicional = "1"
op_adicional_arr = ["1", "s", "S", "sim", "Sim"]

while op_adicional_arr.include? op_adicional

puts "Que tipo de operação pretende fazer?"
puts "Prima a tecla D se pretender DEPOSITAR dinheiro na sua conta"
puts "Prima a tecla L se pretender LEVANTAR dinheiro da sua conta"
puts "Prima a tecla T se pretender TRANSFERIR dinheiro para outra conta bancária"
puts "Prima a tecla C se pretender Consultar o saldo"
print "=> "
tipo_operacao = gets.chomp

opcao_deposito = ["d", "D", "deposito", "Deposito"]
opcao_levantamento = ["l", "L", "Levantamento", "Levantamento"]
opcao_transferencia = ["t", "T", "transferência", "Transferência"]
opcao_consulta = ["c", "C", "consulta" , "Consulta", "saldo", "Saldo"]


if opcao_deposito.include? tipo_operacao
  print "Quantia a DEPOSITAR => "
  deposito = gets.chomp
  movimentos.push(["Deposito",deposito.to_i])
  acumulado = acumulado + deposito.to_i
  puts "Pretende realizar mais alguma operação?"
  print "1-SIM ou 2-NÃO => "
  op_adicional = gets.chomp
elsif opcao_levantamento.include? tipo_operacao
  print "Quantia a LEVANTAR => "
  levantamento = gets.chomp
    while levantamento.to_i % 5 != 0
    puts "O levantamento tem de ser múltiplo de 5 €"
    print "Quantia a LEVANTAR => "
    levantamento = gets.chomp    
    end

  # Algoritmo de entrega de notas
  lev_aux = levantamento.to_i
  tipo_notas = [5,10,20,50,100]
  notas_entregar = []
  
  if lev_aux >= 100 then max_nota = tipo_notas[4]; end
  if lev_aux >= 80 && lev_aux < 100 then max_nota = tipo_notas[3]; end
  if lev_aux >= 40 && lev_aux < 80 then max_nota = tipo_notas[2]; end
  if lev_aux > 10 && lev_aux < 40 then max_nota = tipo_notas[1]; end
  if lev_aux <= 10 then max_nota = tipo_notas[0]; end

  i = tipo_notas.index(max_nota)

  while i >= 0
  if i > 0
    num_notas = (lev_aux/tipo_notas[i]-1).to_i
    lev_aux = lev_aux.to_i - (tipo_notas[i].to_i * num_notas)
    notas_entregar.push(["#{tipo_notas[i]}",num_notas])
    i -= 1
  else
    num_notas = (lev_aux/tipo_notas[i]).to_i
    lev_aux = lev_aux.to_i - (tipo_notas[i].to_i * num_notas)
    notas_entregar.push(["#{tipo_notas[i]}",num_notas])
    i -= 1
  end
  end
  
  puts
  puts "Notas a Entregar:" 
  notas_entregar.each {|x| puts "#{x[0]} €: #{x[1]}"}
  puts
  # Fim do algoritmo de entrega de notas

  levantamento = levantamento.to_i * -1
  movimentos.push(["Levantamento",levantamento])
  acumulado = acumulado + levantamento.to_i
  puts "Pretende realizar mais alguma operação?"
  print "1-SIM ou 2-NÃO => "
  op_adicional = gets.chomp
elsif opcao_transferencia.include? tipo_operacao
  print "Quantia a TRANSFERIR => "
  transferencia = gets.chomp
  transferencia = transferencia.to_i * -1
  movimentos.push(["Transferencia",transferencia])
  acumulado = acumulado + transferencia.to_i
  puts "Pretende realizar mais alguma operação?"
  print "1-SIM ou 2-NÃO => "
  op_adicional = gets.chomp
elsif opcao_consulta.include? tipo_operacao
  lineWidth = 35
  movimentos.each do |x|
    puts "Tipo de Movimento => #{x[0]}:".ljust(lineWidth) + "#{x[1]} €".rjust(lineWidth)
  end
  puts "O seu saldo é de:".ljust(lineWidth) + "#{acumulado} €".rjust(lineWidth)
  puts
  puts "Pretende realizar mais alguma operação?"
  print "1-SIM ou 2-NÃO => "
  op_adicional = gets.chomp
else
  puts "Operação não reconhecida"
end

end
