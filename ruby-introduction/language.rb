## Tipos de datos I: Integer, float

# Enteros
x = 5
x.class
x.methods
# Par o impar
x.odd?
x.even?
# Operaciones
x + 5
x - 6
x / 7
x * 4
x % 3
x ** 2
# Flotantes 
f = 3.4
x.class
f.methods
# Operaciones
4 / 5 # => 0
4 / 5.0 # => 0.8
# Convencion para la declaracion de variables
edad_cliente = 10
# Ruby puede manejar numeros muy grandes
x = 100**100

## Tipos de datos II: Strings

"Pepe".class
"pepe".methods

saludo = "Hola"
saludo = %q(Hola)
saludo = %Q(Hola)

# Interpolacion de variables
nombre = "Pepe"
saludo = "Hola #{nombre}"
saludo = %Q(Hola #{nombre})

# Comillas simples desactivan la interpolacion
saludo = 'Hola #{nombre}'

"simon soriano".upcase
"SIMON".downcase
"Simon".length
"SiMoN".swapcase

"Simon".include? "g" # false
"Simon".include? "S" # true

"  asdasd  ".strip # Elimina los espacios

"asda".empty?

"Simon soriano".gsub("Simon","Santiago") # "Santiago soriano"

"simon" + "santiago"

"simon" * 2

nombre = "pepe santiago"
nombre.gsub!("simon", "pepe") # ! reemplaza el resultado en la variable nombre

## Tipos de datos III: Symbols

nombre = "simon"
nombre_2 = "simon"

nombre.object_id # ver el id del objecto
nombre_2.object_id # ver el id del objecto

color = :rojo
color_2 = :rojo

:rojo.class
:rojo.methods
:rojo.to_s

## Tipos de datos IV: Arrays

letras = ["q","w","e","r","t","y"]
letras.class
letras.methods

letras.size

letras[2]
letras[-1]
letras[100] # => nil

letras.methods.class
letras.methods.size

letras.include? "q" # true
letras.include? "b" # false

letras.last
letras.first

letras.count { |x| x == "q"} # => 1
[1,2,3,4,5].count { |x| x.even? }

[1,2,3,4,5].map { |x| x*2 }
[1,2,3,4,5].map { |x| x**2 }
[1,2,3,4,5].select { |x| x.odd? } 
[1,2,3,4,5].min
[1,2,3,4,5].max
[1,2,3,4,5].sum

array = [4, 4.5, "string", :symbol, []]
array.map { |x| x.class}

"hola mundo".split(" ")
"hola mundo".split(" ").map { |x| x.upcase }
"hola mundo".split(" ").map { |x| x.upcase }.join("\n")

letras.sort
letras.sort! # "!"" Modifica a la misma variable

## Tipos de datos V: Hashes

capitales = {}
capitales.class
capitales.methods

capitales = { "Colombia" => "Bogota"}
capitales["Mexico"] = "Ciudad de mexico"
capitales["Peru"] = "Lima"
capitales["Estados Unidos"] = "Washintong"

capitales.size
capitales.empty?
capitales.has_value? "Mexico"
capitales.has_key? "Lima"
capitales.invert["Bogota"] # => Colombia
capitales.merge({"Marte" => "Musk"}) # => return hash with the new element
capitales.map { |k,v| "La capital de #{k} es #{v}"}
# puts capitales.map { |k,v| "La capital de #{k} es #{v}"} # in array
[["pepito", 13],["sutanito", 14]].to_h

## Uso de condicionales

# is_authenticated = false
# 
# if is_authenticated
#     puts "Pantalla de admin"
# else
#     puts "Pantalla de login"
# end

## Uso de ciclos

# x = 1
# while x < 5 do 
#     puts "hola #{x}"
#     x += 1
# end
# 
# x = 1
# loop do
#     puts "hola #{x}"
#     break if x >= 5
#     x = x + 1
# end
# 
# for i in 1..5 do
#     puts "hola #{x}"
# end
# 
# [1, 2, 3, 4].each { |x| puts "hola #{x}"}
# 4.times { |x| puts "hola #{x}"}

## Rangos

(1..6).to_a # no incluye extremo derecho
(1...6).to_a # incluye extremo derecho
(1..6).include? 300
('a'..'d').include? 300
('a'..'d').to_a

## Uso de Regex

is_email_regex = /\w+@gmail.com/
"simon@gmail.com".match is_email_regex

number_regex = /\+d/
"23456".match number_regex

## Procs y lambdas

saludar = Proc.new { |nombre| puts "Hola #{nombre}"}
saludar.class
saludar.call("Simon")

## Programación Orientada a Objetos en Ruby Comenzando la creación de nuestra clase

class Persona
    attr_accessor :name, :age # Evita la escritura de getters y setters

    # Metodos de clase

    def self.suggested_names
        ["Pepe", "Pepito", "Sutano"]
    end

    # Metodos de instancia

    def initialize(name, age)
        @name = name
        @age = age
    end

    #def name
    #    @name
    #end

    #def age
    #    @age
    #end

        # persona.name = "pepe"
        # (persona.name = "pepe").age = 7
    #def name=(name)
    #    @name = name
    #    self
    #end

    #def age=(age)
    #    @age = age
    #    self
    #end
end

persona = Persona.new("Pepe", 14)
# puts persona.name
Persona.suggested_names

# Otra forma seria
# class Persona < Struct.new(:name, :age) # Con struct no es necesario el initialize
#     def self.suggested_names
#         ["Pepe", "Pepito", "Sutano"]
#     end
# end
        
## Bundler y gemas

# Bundler es el gesto de dependencias
# bundle --version
# bundle init # Iniciar un proyecto
# https://www.ruby-toolbox.com/ # Search gems
# ls -/.rvm/gems/ruby-2.5.1/gems/ # Localizacion de todas las gemas instaladas
# Faker::Name.name # Para ver la gema en accion
# Faker::HarryPotter.spell
# bundle exec irb # Para asegurarme de usar las gemas que especifique en el Gemfile

# Testing en Ruby

