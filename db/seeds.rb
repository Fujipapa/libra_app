# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.create(genre: "作画")
Genre.create(genre: "メイキング")
Genre.create(genre: "塗り")
Genre.create(genre: "背景")
Book.create(title: '髪の書き方', title_kana: 'カミノカキカタ', genre_id: 1)
Book.create(title: '髪の書き方', title_kana: 'カミノカキカタ', genre_id: 1)
Book.create(title: 'デジタルイラストの塗り辞典', title_kana: 'デジタルイラストノヌリジテン', genre_id: 3)
Book.create(title: 'デジタルイラストの塗り辞典', title_kana: 'デジタルイラストノヌリジテン', genre_id: 3)
Book.create(title: '神絵師の極意', title_kana: 'カミエシノゴクイ', genre_id: 2)
Book.create(title: '神絵師の極意', title_kana: 'カミエシノゴクイ', genre_id: 2)
Book.create(title: '美しい背景の書き方', title_kana: 'ウツクシイハイケイノカキカタ', genre_id: 4)
Book.create(title: '美しい背景の書き方', title_kana: 'ウツクシイハイケイノカキカタ', genre_id: 4)