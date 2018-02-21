# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Faker::Omniauth.github

10.times do
  User.create(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    username: Faker::Internet.user_name,
    bio: Faker::Matz.quote,
    github_profile_url: Faker::Internet.url("github.com"),
    avatar_url: Faker::Avatar.image,
    password: Faker::Internet.password(8)
  )
end

Community.create([
  { title: 'JavaScript', short_description: 'JavaScript (JS) is a lightweight interpreted or JIT-compiled programming language with first-class functions. While it is most well-known as the scripting language for Web pages.', user_id: 1 },
  { title: 'Ruby', short_description: 'A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.', user_id: 2 },
  { title: 'Ruby on Rails', short_description: 'Learning to build a modern web application is daunting. Ruby on Rails makes it much easier and more fun. It includes everything you need to build fantastic applications, and you can learn it with the support of our large, friendly community.', user_id: 1 },
  { title: 'Git', short_description: 'Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.', user_id: 4 },
  { title: 'Sinatra', short_description: 'Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort. Sinatra was designed and developed by Blake Mizerany (bmizerany) in California. Sinatra would not have been possible without strong company backing. In the past, financial and emotional support have been provided mainly by Heroku, GitHub and Engine Yard, and is now taken care of by Travis CI.', user_id: 5 },
  { title: 'React', short_description: 'A JavaScript library for building user interfaces. Declarative React makes it painless to create interactive UIs. Design simple views for each state in your application, and React will efficiently update and render just the right components when your data changes. Declarative views make your code more predictable and easier to debug. Component-Based Build encapsulated components that manage their own state, then compose them to make complex UIs. Since component logic is written in JavaScript instead of templates, you can easily pass rich data through your app and keep state out of the DOM. Learn Once, Write Anywhere We don’t make assumptions about the rest of your technology stack, so you can develop new features in React without rewriting existing code. React can also render on the server using Node and power mobile apps using React Native.', user_id: 8 },
  { title: 'Redux', short_description: 'Redux is a predictable state container for JavaScript apps. (Not to be confused with a WordPress framework – Redux Framework.) It helps you write applications that behave consistently, run in different environments (client, server, and native), and are easy to test. On top of that, it provides a great developer experience, such as live code editing combined with a time traveling debugger. You can use Redux together with React, or with any other view library. It is tiny (2kB, including dependencies).', user_id: 10 },
  { title: 'Golang', short_description: 'The Go programming language is an open source project to make programmers more productive. Go is expressive, concise, clean, and efficient. Its concurrency mechanisms make it easy to write programs that get the most out of multicore and networked machines, while its novel type system enables flexible and modular program construction. Go compiles quickly to machine code yet has the convenience of garbage collection and the power of run-time reflection. It is a fast, statically typed, compiled language that feels like a dynamically typed, interpreted language.', user_id: 6 },
  { title: 'Python', short_description: 'Python is an interpreted, interactive, object-oriented programming language. It incorporates modules, exceptions, dynamic typing, very high level dynamic data types, and classes. Python combines remarkable power with very clear syntax. It has interfaces to many system calls and libraries, as well as to various window systems, and is extensible in C or C++. It is also usable as an extension language for applications that need a programmable interface. Finally, Python is portable: it runs on many Unix variants, on the Mac, and on Windows 2000 and later.', user_id: 4 },
  { title: 'GitHub', short_description: 'GitHub (originally known as Logical Awesome LLC) is a web-based hosting service for version control using git. It is mostly used for computer code. It offers all of the distributed version control and source code management (SCM) functionality of Git as well as adding its own features. It provides access control and several collaboration features such as bug tracking, feature requests, task management, and wikis for every project.', user_id: 1 }
])

Post.create([
  {title: 'Newbies Introduction to Ruby on Rails', content: 'Note: This tutorial is intended to newbies only who want to kick-start web development with Ruby on Rails. I will just share links to different resources and give tips based on my experience which may help you starting development with Ruby on Rails.', link: 'https://dev.to/alihaider907/newbies-introduction-to-ruby-on-rails-4be', user_id: 3, community_id: 3},
  { title: 'Glitch: You are Not in the Matrix', content: 'Hello, I’m Jessica! Thanks for taking the time to read my post. 🤗 I love my job. Why? Because I get to spend my day building apps, writing about them and then traveling to speak about them. I’m a Developer Advocate at Algolia, a wicked fast hosted search API. Most days I get to work with web applications in JavaScript, and because of that I have come across some really cool things, like Glitch.', link: 'https://dev.to/jesswest/glitch-youre-not-in-the-matrix-mgj', user_id: 3, community_id: 1 },
  { title: 'Async without await, Await without async', content: 'Say we have a function getPromise() that returns a Promise that will resolve to some value in the future. The question is whether we need to declare it with the async keyword if we want to call it either (i) using the async/await style or (ii) using the then clause.', link: 'https://dev.to/codeprototype/async-without-await-await-without-async--oom', user_id: 7, community_id: 1 },
  { title: 'Weekly Web Roundup - 07', content: 'Was it me or was webdev Twitter extra salty this week? Maybe all the nice people were too busy enjoying the Vue conference in Amsterdam 💁‍♀️. It will be a tiny roundup this week because I have been busy on some exciting things. I am hoping to share that with you soon. In any case, let us start with some news!', link: 'https://dev.to/ardennl/weekly-web-roundup---07--5od', user_id: 8, community_id: 1 },
  { title: 'Weekly most popular JS repositories. Week of love.', content: 'Almost two weeks passed from the last digest about the most interesting and popular JavaScript GitHub repositories. But this doesn’t mean you missed something! I collected everything worth your attention and delivering this scope to you today! Week of love is the alternative name for today’s digest. Simply because all this marvelous stuff is your gift on Valentine’s Day. Enjoy these weekly most popular JS repositories!', link: 'https://dev.to/iriskatastic/weekly-most-popular-js-repositories-week-of-love--dce', user_id: 7, community_id: 1 },
  { title: '', content: '', link: '', user_id: 5, community_id: 1 },
  { title: 'Building Web Components with Vanilla JavaScript', content: 'Back in 2015, I was in the midst of learning my first front-end framework -- AngularJS. The way I thought of it was that I was building my own HTML tags with custom features. Of course, that was not what was really happening, but it helped lower the learning curve.', link: 'https://dev.to/aspittel/building-web-components-with-vanilla-javascript--jho', user_id: 2, community_id: 1 },
  { title: 'Accessing Nested Objects in JavaScript', content: 'tldr; safely access nested objects in JavaScript in a super cool way. JavaScript is amazing, we all know that already. But a few things in JavaScript are really weird and they make us scratch our heads a lot. One of those things is the confrontation with this error when you try to access a nested object,', link: 'https://dev.to/flexdinesh/accessing-nested-objects-in-javascript--9m4', user_id: 9, community_id: 1 },
  { title: 'Building a Command-Line Interface with Ruby', content: 'In this post I’ll talk about my experience building a command-line interface application with Ruby; generating a gem directory, scraping the data with Nokogiri, and putting together the user interface.', link: 'https://dev.to/adjoa/building-a-command-line-interface-with-ruby--370k', user_id: 8, community_id: 2 },
  { title: 'Newbies Introduction to Ruby on Rails', content: 'Note: This tutorial is intended to newbies only who want to kick-start web development with Ruby on Rails. I will just share links to different resources and give tips based on my experience which may help you starting development with Ruby on Rails.', link: 'https://dev.to/alihaider907/newbies-introduction-to-ruby-on-rails-4be', user_id: 7, community_id: 3 },
  { title: 'David Heinemeier Hansson on the Future of Rails', content: 'The Ruby on Rails framework has had an incredible impact since its creation a decade ago, becoming the choice for some of today is mightiest tech companies. Patterns and concepts popularized by the framework have also had an indelible effect on the application architecture discussion. Rails is an open-source project which depends on innovation and good software design from its core team in order to maintain its direction and status. New paradigms are constantly emerging and Rails has done well to evolve and remain the go-to for many developers.', link: 'https://dev.to/ben/dhh-on-the-future-of-rails', user_id: 7, community_id: 3 },
  { title: 'Weekly trending Ruby on Rails repositories. February, 19', content: 'Meet the 2nd digest with the most popular Rails repositories of the week! Weekly trending Ruby on Rails repositories from Feb, 19 will include famous and brand new gems, engines, virtual machines and more. The list starts with the most recent updates.', link: 'https://dev.to/iriskatastic/weekly-trending-ruby-on-rails-repositories-february-19--57n', user_id: 7, community_id: 3 },
  { title: 'Git standup, how did I ever live without you?', content: 'I am sure you have been preparing for a meeting where a team typically discusses what they did yesterday and what they are planning to do today. These are often called "standup meetings". If you are anything like me, the "remember what you did yesterday" part does not always go as smoothly as it could. Panic typically ensues and I would find myself putting in more work than I should need to in order to simply remember the day before.', link: 'https://dev.to/ben/git-standup-how-did-i-ever-live-without-you', user_id: 4, community_id: 4 },
  { title: 'Closure? I Hardly Know Her!', content: 'I have learned about closures a few different times, and each time, I have come away feeling like I get it, but I do not necessarily understand why people make such a big deal out of them. Yeah, hooray, you get functions that can persist their data! I have seen people post things like, "If you are not using closures, you are really missing out." I think I have finally figured out why people are so excited, and why I was confused. This post will explain what closures are, when you might want to use them, and why it took me so long to get why they are special.', link: 'https://dev.to/rpalo/closure-i-hardly-know-her--1h40', user_id: 6, community_id: 9 }
])

Comment.create([
  { content: 'Nice writeup. Ruby is the perfect language for these sorts of projects.', post_id: 8, user_id: 4 },
  { content: 'love the idea of trestle, I feel like ActiveAdmin it is a bit lacking in the department of responsiveness... I have used jquery-fileupload and its satellite projects like JavaScript Load Image and JavaScript-Canvas-to-Blob and I can say they are amazing!', post_id: 10, user_id: 3 }

])

Tag.create!([
  { name: '#beginners', post_id: 4 },
  { name: '#discuss', post_id: 5 },
  { name: '#career', post_id: 1 },
  { name: '#productivity', post_id: 7 },
  { name: '#explainlikeimfive', post_id: 8 },
  { name: '#learning', post_id: 4 }
])
