# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'aaa@aaa',
    password: 'aaaaaa'
  )
  
  
Genre.create!(
      [
          { name: "ケーキ" },
          { name: "キャンディー" },
          { name: "プリン" },
          { name: "チョコレート" },
      ]
)


Item.create!(
    [
        
        { name: "ホールケーキ",
          genre_id: 1,
          image: open("./app/assets/images/no_image.jpg"),
          introduction: "ホールケーキです",
          price: "1000",
          is_active: true
        },
        
        { name: "チーズケーキ",
          genre_id: 1,
          image: open("./app/assets/images/no_image.jpg"),
          introduction: "チーズケーキです",
          price: "2000",
          is_active: true
        },
        
        { name: "イチゴキャンディー",
          genre_id: 2,
          image: open("./app/assets/images/no_image.jpg"),
          introduction: "イチゴキャンディです",
          price: "1000",
          is_active: true
        },
        
        
        { name: "ぷりぷりプリン",
          genre_id: 3,
          image: open("./app/assets/images/no_image.jpg"),
          introduction: "ぷりぷりです",
          price: "3500",
          is_active: true
        },
        
        
        { name: "生チョコレート",
          genre_id: 4,
          image: open("./app/assets/images/no_image.jpg"),
          introduction: "生チョコレートです",
          price: "4000",
          is_active: true
        },
        
        
    ]
    
    
    
    )