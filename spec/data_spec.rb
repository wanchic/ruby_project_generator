def rand_name
  c = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  (1..((rand*25)+1)).map{|| c[rand * c.size]}.join
end