# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ExperienceLevel.create(
    [
        {name: 'estagiário', value: 1},
        {name: 'júnior', value: 2},
        {name: 'pleno', value: 3},
        {name: 'sênior', value: 4},
        {name: 'especialista', value: 5},
    ])

locations = Location.create(
    [
        {'name': 'A'},
        {'name': 'B'},
        {'name': 'C'},
        {'name': 'D'},
        {'name': 'E'},
        {'name': 'F'},
    ]
)

paths = Path.create(
    [
        {'src': locations[Location::A], 'dst': locations[Location::B], 'distance': 5},
        {'src': locations[Location::B], 'dst': locations[Location::C], 'distance': 7},
        {'src': locations[Location::B], 'dst': locations[Location::D], 'distance': 3},
        {'src': locations[Location::C], 'dst': locations[Location::E], 'distance': 4},
        {'src': locations[Location::D], 'dst': locations[Location::E], 'distance': 10},
        {'src': locations[Location::D], 'dst': locations[Location::F], 'distance': 8},
    ])