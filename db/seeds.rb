# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
User.create!([
    {
        name: "Super User1",
        email: "superuser1@gmail.com",
        password: "superuser1@gmail.com1",
        super_user_flag: true,
        role: 1,
        phone: '09222222222',
        address: "No11/13 55 street Lower Block Botahtaung Township.",
        birthday: '2010-03-27'
    },
    {
        name: "User 2",
        email: "user1@gmail.com",
        password: "user1@gmail.com1",
        super_user_flag: false,
        role: 1,
        phone: '09333333333',
        address: "No11/13 55 street Lower Block Botahtaung Township.",
        birthday: '2011-03-27'
    },
    {
        name: "User 3",
        email: "user2@gmail.com",
        password: "user2@gmail.com1",
        super_user_flag: false,
        role: 1,
        phone: '09444444444',
        address: "No11/13 55 street Lower Block Botahtaung Township.",
        birthday: '2012-03-27'
    }
])

Post.destroy_all
Post.create!([
    {
        title: "Soul",
        description: "After landing the gig of a lifetime, a New York jazz pianist suddenly finds himself trapped in a strange land between Earth and the afterlife.",
        public_flag: true,
    },
    {
        title: "The Lord of the Rings: The Fellowship of the Ring",
        description: "The Fellowship of the Ring embark on a journey to destroy the One Ring and end Sauron's reign over Middle-earth. A young Hobbit known as Frodo has been thrown on an amazing adventure, when he is appointed the job of destroying the One Ring, which was created by the Dark Lord Sauron.",
        public_flag: false,
    },
    {
        title: "Terminator 2",
        description: "Terminator 2 follows Sarah Connor and her ten-year-old son John as they are pursued by a new, more advanced Terminator: the liquid metal, shapeshifting T-1000, sent back in time to kill John Connor and prevent him from becoming the leader of the human resistance.",
        public_flag: false,
    }
])

p "Created #{User.count} users"
p "Created #{Post.count} posts"