# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Unit.delete_all
Ingredient.delete_all
Recipe.delete_all
IngredientForRecipe.delete_all
ActsAsTaggableOn::Tag.delete_all

l = Unit.create!(name: "l")
cup = Unit.create!(name: "cup")
spn = Unit.create!(name: "spn")
tspn = Unit.create!(name: "tspn")
kg = Unit.create!(name: "kg")
item = Unit.create!(name: "item")

tomato = Ingredient.create!(name: "tomato")
water = Ingredient.create!(name: "water")
flour = Ingredient.create!(name: "flour")
salt = Ingredient.create!(name: "salt")
mozarella = Ingredient.create!(name: "mozarella")
bread = Ingredient.create!(name: "bread")
chickpea = Ingredient.create!(name: "chickpea")
cumin = Ingredient.create!(name: "cumin")
onion = Ingredient.create!(name: "onion")
paprika = Ingredient.create!(name: "paprika")

directions = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Proin nibh augue,
             suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque 
             aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. 
             Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, 
             sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, 
             elit magna vulputate arcu, vel tempus metus leo non est. Etiam sit amet lectus quis 
             est congue mollis. Phasellus congue lacus eget neque. Phasellus ornare, ante vitae 
             consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus eget nisi. 
             Praesent sodales velit quis augue. Cras suscipit, urna at aliquam rhoncus, urna quam 
             viverra nisi, in interdum massa nibh nec erat."

pizza = Recipe.create!(name: "Pizza", description: "Very very tasty", directions: directions,
                      servings: 4, vegan: false )
pasta = Recipe.create!(name: "Pasta", description: "Very very very tasty", directions: directions,
                      servings: 4, vegan: true )
leczo = Recipe.create!(name: "Leczo", description: "Dish from hungary. Autumn star", directions: directions,
                      servings: 8, vegan: true )
chickpea_curry = Recipe.create!(name: "Chickpea curry", description: "Is ok", directions: directions,
                      servings: 4, vegan: true )
sandwich = Recipe.create!(name: "Sandwich", description: "Dish? huh?", directions: directions,
                      servings: 1, vegan: true )
tortilla = Recipe.create!(name: "Tortilla", description: "Fast, cheap, good", directions: directions,
                      servings: 4, vegan: false )
pizza.tag_list.add "Extra delicious"
pizza.save
pasta.tag_list.add "Classic"
pasta.save
leczo.tag_list.add "Fast"
leczo.save
tortilla.tag_list.add("Cheap", "Fast")
tortilla.save
sandwich.tag_list.add "Pepek's favourite"
sandwich.save  


IngredientForRecipe.create!(recipe_id: pizza.id, ingredient_id: tomato.id, amount: 8, unit_id: item.id)
IngredientForRecipe.create!(recipe_id: pizza.id, ingredient_id: flour.id, amount: 1, unit_id: kg.id)
IngredientForRecipe.create!(recipe_id: pizza.id, ingredient_id: water.id, amount: 0.5, unit_id: l.id)
IngredientForRecipe.create!(recipe_id: pizza.id, ingredient_id: mozarella.id, amount: 4, unit_id: item.id)
IngredientForRecipe.create!(recipe_id: pasta.id, ingredient_id: tomato.id, amount: 9, unit_id: item.id)
IngredientForRecipe.create!(recipe_id: pasta.id, ingredient_id: salt.id, amount: 0.25, unit_id: spn.id)
IngredientForRecipe.create!(recipe_id: leczo.id, ingredient_id: salt.id, amount: 0.25, unit_id: spn.id)
IngredientForRecipe.create!(recipe_id: leczo.id, ingredient_id: tomato.id, amount: 1, unit_id: kg.id)
IngredientForRecipe.create!(recipe_id: leczo.id, ingredient_id: onion.id, amount: 1, unit_id: kg.id)
IngredientForRecipe.create!(recipe_id: leczo.id, ingredient_id: paprika.id, amount: 1, unit_id: kg.id)








