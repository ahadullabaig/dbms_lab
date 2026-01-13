Name, address – (building, street, area, pincode), id, cuisine, nearby landmarks, online delivery- yes/no, famous for (name of the dish)

db.rest.insertOne(
    {
        Name: "KFC",
        address: {
            building: "red building",
            street: 23,
            area: "dollars colony",
            pincode: 560054
        },
        id: 1,
        cuisine: "Fast Food",
        landmarks: [ "red rose", "tea stall" ],
        online_delivery: "yes",
        famous_for: "Chicken"
    }
)

db.rest.insertMany([
   {
       Name: "Little Italy",
       address: {
           building: "Heron Tower",
           street: "12th Main",
           area: "Indiranagar, Bangalore",
           pincode: 560038
       },
       id: 101,
       cuisine: "Italian",
       landmarks: ["Metro Station", "CMH Hospital"],
       online_delivery: "yes",
       famous_for: "Pizza"
   },
   {
       Name: "Punjab Bistro",
       address: {
           building: "Prestige Plaza",
           street: "1st Cross",
           area: "Koramangala, Bangalore",
           pincode: 560095
       },
       id: 102,
       cuisine: "North Indian thali",
       landmarks: ["Forum Mall", "Sony Signal"],
       online_delivery: "no",
       famous_for: "Butter Chicken"
   },
   {
       Name: "Empire Restaurant",
       address: {
           building: "Empire Suites",
           street: "Church Street",
           area: "MG Road, Bangalore",
           pincode: 560001
       },
       id: 103,
       cuisine: "Andhra",
       landmarks: ["Metro Station", "Cubbon Park"],
       online_delivery: "yes",
       famous_for: "Kebabs"
   }
])
