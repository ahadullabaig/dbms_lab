db.rest.find(
    {
        "address.area": /Bangalore/,
        cuisine: "Italian"
    },
    { Name: 1, address: 1, _id: 0 }
)

db.rest.find(
    {
        "address.area": /Bangalore/,
        cuisine: "North Indian thali"
    },
    { Name: 1, address: 1, landmarks: 1, _id: 0 }
)

db.rest.find(
    { "address.area": /Bangalore/ },
    { Name: 1, address: 1, famous_for: 1, _id: 0 }
)
