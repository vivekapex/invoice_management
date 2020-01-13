[
  'Bread and cereals',
  'Meat',
  'Fish',
  'Milk, cheese and eggs',
  'Butter, margarine and fats',
  'Fruits',
  'Vegetables',
  'Sugar, jam, honey, chocolate, crisps and ice-cream',
  'Drinks'
].each do |category_name|
  Category.create(name: category_name, description: category_name)
end
