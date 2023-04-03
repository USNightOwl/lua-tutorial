-- function return void()
function Hello() -- Should uppercase (ex: Hello, _Hello,...)
  print("Hello guy")
end

function Hello() -- re function (same name function)
  print("Hello boy")
end

function Hello2(name) -- dont use Hello(name) =))
  print("Hello " .. name)
end

function Hello3(name)
  if name == 'Hao' then
    print("Ohh My friend Hao!!!")
  else
    print("Hello " .. name)
  end
end

Hello()
Hello2("Hao")
Hello2("Nhat")
Hello3("Hao")
Hello3("Paht")

-- function return value
