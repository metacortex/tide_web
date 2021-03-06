# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Category.create([
  { name: "design",       title: "디자인",     title_en: "Design",
    tags_text: "Cognitive Science\nContemporary\nMinimalism\nWeb\nInteraction Design\n" },
  { name: "technology",   title: "기술",      title_en: "Technology",
    tags_text: "Internet\nFull Duplex\nDemux\nFurniture\n" },
  { name: "entrepreneur", title: "비즈니스",    title_en: "Entrepreneur",
    tags_text: "Management\nMarketing\nIndustry\nFinancial\n" },
  { name: "essay",        title: "에세이",     title_en: "Essay",
    tags_text: "Books\nJournal\nDating\nMobile\nUniversity\n" },
])

User.create([
  { email:"9ruvie@gmail.com", password:"1234", password_confirmation:"1234", name:"손정욱", name_en:"Son Jung Wook", 
    location:"Seoul, Korea", url_website:"http://www.google.com\nhttp://www.naver.com\nhttp://www.daum.net",
    work:"MY COMPANY INC.", role:"admin" },
  { email:"9ruvie2@gmail.com", password:"1234", password_confirmation:"1234", name:"김하나", name_en:"Kim Hanna", 
    location:"Seoul, Korea", url_website:"http://www.google.com\nhttp://www.naver.com\nhttp://www.daum.net",
    work:"MY COMPANY INC." },
  { email:"9ruvie3@gmail.com", password:"1234", password_confirmation:"1234", name:"아이유", name_en:"Ah E U", 
    location:"Seoul, Korea", url_website:"http://www.google.com\nhttp://www.naver.com\nhttp://www.daum.net",
    work:"MY COMPANY INC." },
  { email:"9ruvie4@gmail.com", password:"1234", password_confirmation:"1234", name:"제시카", name_en:"Jessica", 
    location:"Seoul, Korea", url_website:"http://www.google.com\nhttp://www.naver.com\nhttp://www.daum.net",
    work:"MY COMPANY INC." },
  { email:"9ruvie5@gmail.com", password:"1234", password_confirmation:"1234", name:"티아라 은정", name_en:"Tiara Eunjung", 
    location:"Seoul, Korea", url_website:"http://www.google.com\nhttp://www.naver.com\nhttp://www.daum.net",
    work:"MY COMPANY INC." },
  { email:"9ruvie6@gmail.com", password:"1234", password_confirmation:"1234", name:"크리스탈", name_en:"Crystal", 
    location:"Seoul, Korea", url_website:"http://www.google.com\nhttp://www.naver.com\nhttp://www.daum.net",
    work:"MY COMPANY INC." },
  { email:"9ruvie7@gmail.com", password:"1234", password_confirmation:"1234", name:"이효리", name_en:"Lee Hyo Ri", 
    location:"Seoul, Korea", url_website:"http://www.google.com\nhttp://www.naver.com\nhttp://www.daum.net",
    work:"MY COMPANY INC." },
])

Tagging.create([
  { content_type:"User", content_id:1, name:"Management" },
  { content_type:"User", content_id:1, name:"Cognitive Science" },
  { content_type:"User", content_id:1, name:"Strategist" },
  { content_type:"User", content_id:1, name:"Android" },
  { content_type:"User", content_id:1, name:"HAN SOLO" },
  { content_type:"User", content_id:2, name:"WOMAN" },
  { content_type:"User", content_id:3, name:"GIRL" },
  { content_type:"User", content_id:4, name:"GIRL" },
  { content_type:"User", content_id:4, name:"Android" },
  { content_type:"User", content_id:5, name:"GIRL" },
  { content_type:"User", content_id:5, name:"HAN SOLO" },
  { content_type:"User", content_id:6, name:"GIRL" },
  { content_type:"User", content_id:6, name:"Brown Eyes" },
  { content_type:"User", content_id:6, name:"Android" },
  { content_type:"User", content_id:7, name:"WOMAN" },
])


Post.create([
  { user_id: 1, category_id: 2, title:"첫번째 포스트", title_en:"", kind:"compose",
    body:"I can't quite figure out how to pull off @include transition(box-shadow) and have compass compile that into -webkit-transition: -webkit-box-shadow, -moz-transition: -moz-box-shadow, etc. Is this currently possible?",
    source_url:"http://www.naver.com", published_at: 1.week.ago },
  { user_id: 1, category_id: 2, title:"두번째 포스트", title_en:"", kind:"link", 
    body:"I can't quite figure out how to pull off @include transition(box-shadow) and have compass compile that into -webkit-transition: -webkit-box-shadow, -moz-transition: -moz-box-shadow, etc. Is this currently possible?",
    source_url:"http://www.naver.com", published_at: 1.week.ago },
  { user_id: 1, category_id: 3, title:"세번째 포스트", title_en:"", kind:"link",
    body:"I can't quite figure out how to pull off @include transition(box-shadow) and have compass compile that into -webkit-transition: -webkit-box-shadow, -moz-transition: -moz-box-shadow, etc. Is this currently possible?",
    source_url:"http://www.naver.com", published_at: 4.day.ago },
  { user_id: 1, category_id: 4, title:"네번째 포스트", title_en:"", kind:"link",
    body:"I can't quite figure out how to pull off @include transition(box-shadow) and have compass compile that into -webkit-transition: -webkit-box-shadow, -moz-transition: -moz-box-shadow, etc. Is this currently possible?",
    source_url:"http://www.naver.com", published_at: 3.day.ago },
])

Tagging.create([
  { content_type:"Post", content_id:1, name:"Android" },
  { content_type:"Post", content_id:1, name:"Strategy" },
  { content_type:"Post", content_id:1, name:"Platform" },
  { content_type:"Post", content_id:2, name:"Bankrupt" },
  { content_type:"Post", content_id:2, name:"Default" },
  { content_type:"Post", content_id:3, name:"Overflow" },
  { content_type:"Post", content_id:3, name:"iOS" },
  { content_type:"Post", content_id:3, name:"Android" },
  { content_type:"Post", content_id:3, name:"Algorithm" },
  { content_type:"Post", content_id:4, name:"Type" },
  { content_type:"Post", content_id:4, name:"Cloud Computing" },
])

Comment.create([
  { content_type:"Post", content_id:1, user_id:2, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:1, user_id:3, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:1, user_id:4, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:1, user_id:5, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:1, user_id:1, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:1, user_id:3, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:1, user_id:5, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:1, user_id:6, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:1, user_id:7, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:2, user_id:5, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:2, user_id:4, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:2, user_id:1, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:2, user_id:4, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:2, user_id:1, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Post", content_id:3, user_id:3, body:"안녕하세요.\n 정말 좋은 글이에요." },
])

Agreement.create([
  { post_id:1, comment_id:1, user_id:1, direction:1 },
  { post_id:1, comment_id:1, user_id:2, direction:1 },
  { post_id:1, comment_id:1, user_id:3, direction:1 },
  { post_id:1, comment_id:1, user_id:4, direction:1 },
  { post_id:1, comment_id:1, user_id:5, direction:1 },
  { post_id:1, comment_id:1, user_id:6, direction:1 },
  { post_id:1, comment_id:1, user_id:7, direction:1 },
  { post_id:1, comment_id:2, user_id:1, direction:1 },
  { post_id:1, comment_id:2, user_id:2, direction:1 },
  { post_id:1, comment_id:2, user_id:3, direction:-1 },
  { post_id:1, comment_id:2, user_id:4, direction:-1 },
  { post_id:1, comment_id:2, user_id:5, direction:-1 },
  { post_id:1, comment_id:2, user_id:6, direction:-1 },
  { post_id:1, comment_id:2, user_id:7, direction:-1 },
  { post_id:1, comment_id:3, user_id:1, direction:1 },
  { post_id:1, comment_id:3, user_id:2, direction:-1 },
  { post_id:1, comment_id:3, user_id:3, direction:1 },
  { post_id:1, comment_id:3, user_id:4, direction:-1 },
  { post_id:1, comment_id:3, user_id:5, direction:1 },
  { post_id:1, comment_id:3, user_id:6, direction:-1 },
])


Connection.create([
  # requests
  { user_id:2, target_id:1, connection_type:"co-worker" },
  { user_id:2, target_id:2, connection_type:"co-worker" },
  { user_id:2, target_id:3, connection_type:"co-worker" },
  { user_id:2, target_id:4, connection_type:"co-worker" },
])

Connection.create([
  # friends
  { user_id:3, target_id:1, connection_type:"co-worker" },
  { user_id:4, target_id:1, connection_type:"friend" },
  { user_id:5, target_id:1, connection_type:"classmate" },
  { user_id:6, target_id:1, connection_type:"co-worker" },
  { user_id:7, target_id:1, connection_type:"etc" },
]).each do |c|
  c.accept!
end

Connection.where(target_id:1, user_id:3).first.update_attributes(remark:"완전 멋진 오라버니!")
Connection.where(target_id:1, user_id:4).first.update_attributes(remark:"술고래")
Connection.where(target_id:1, user_id:5).first.update_attributes(remark:"한국의 주커버그")
Connection.where(target_id:1, user_id:6).first.update_attributes(remark:"애교덩어리")

Connection.where(target_id:3, user_id:1).first.update_attributes(remark:"귀요미 1")
Connection.where(target_id:4, user_id:1).first.update_attributes(remark:"귀요미 2")
Connection.where(target_id:5, user_id:1).first.update_attributes(remark:"귀요미 3")



Event.create([
  { name:"Test Event 1", abbr:"This is a test event. Hello~ :)", body:"This is a test event. Hello~ :)", category:"event", status:"register", opened_at:  2.day.since, closed_at:  3.day.since },
  { name:"Test Event 2", abbr:"This is a test event. Hello~ :)", body:"This is a test event. Hello~ :)", category:"event", status:"close", opened_at: 12.day.since, closed_at: 15.day.since },
  { name:"Test Event 3", abbr:"This is a test event. Hello~ :)", body:"This is a test event. Hello~ :)", category:"event", status:"register", opened_at: 22.day.since, closed_at: 23.day.since },
  { name:"Test Event 4", abbr:"This is a test event. Hello~ :)", body:"This is a test event. Hello~ :)", category:"event", status:"register", opened_at: 32.day.since, closed_at: 33.day.since },
])

Comment.create([
  { content_type:"Event", content_id:4, user_id:2, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Event", content_id:4, user_id:3, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Event", content_id:4, user_id:4, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Event", content_id:3, user_id:2, body:"안녕하세요.\n 정말 좋은 글이에요." },
  { content_type:"Event", content_id:2, user_id:2, body:"안녕하세요.\n 정말 좋은 글이에요." },
])






