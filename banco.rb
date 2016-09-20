saldo_inicial = 1000.to_i
movimentos = []
movimentos.push(saldo_inicial)
acumulado = saldo_inicial
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
  movimentos.push(deposito.to_i)
  puts "#{movimentos}"
  acumulado = acumulado + deposito.to_i
  puts "#{acumulado}"
  puts "Pretende realizar mais alguma operação?"
  print "1-SIM ou 2-NÃO => "
  op_adicional = gets.chomp
elsif opcao_levantamento.include? tipo_operacao
  print "Quantia a LEVANTAR => "
  levantamento = gets.chomp
  levantamento = levantamento.to_i * -1
  movimentos.push(levantamento)
  puts "#{movimentos}"
  acumulado = acumulado + levantamento.to_i
  puts "#{acumulado}"
  puts "Pretende realizar mais alguma operação?"
  print "1-SIM ou 2-NÃO => "
  op_adicional = gets.chomp
elsif opcao_transferencia.include? tipo_operacao
  print "Quantia a TRANSFERIR => "
  transferencia = gets.chomp
  transferencia = transferencia.to_i * -1
  movimentos.push(transferencia)
  puts "#{movimentos}"
  acumulado = acumulado + transferencia.to_i
  puts "#{acumulado}"
  puts "Pretende realizar mais alguma operação?"
  print "1-SIM ou 2-NÃO => "
  op_adicional = gets.chomp
elsif opcao_consulta.include? tipo_operacao
  lineWidth = 20
  movimentos.each {|x| puts "Movimento n.º #{movimentos.index(x)}:".ljust(lineWidth) + "#{x} €".rjust(lineWidth)}
  puts "O seu saldo é de:".ljust(lineWidth) + "#{acumulado} €".rjust(lineWidth)
  puts
  puts "Pretende realizar mais alguma operação?"
  print "1-SIM ou 2-NÃO => "
  op_adicional = gets.chomp
else
  puts "Operação não reconhecida"
end

end
