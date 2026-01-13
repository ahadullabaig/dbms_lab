db.employees.find(
    { salary: { $gt: 50000, $lt: 75000 } }
)

db.employees.find(
    { design: "developer" }
)

db.employees.updateOne(
    { ename: "Rahul" },
    { $set: { age: 28 } }
)

db.employees.updateOne(
    { ename: "Rahul" },
    { $unset: { yoj: "" } }
)

db.employees.updateOne(
    { ename: "Rahul" },
    { $unset: { p3: "" } }
)

db.employees.updateOne(
    { ename: "Rahul" },
    { $set: { contacts: {
                            email: ["rahul@gmail.com"],
                            phone: [123567890]
                        } } }
)

db.employees.updateOne(
    { ename: "Rahul" },
    { $push: { "contacts.phone": { $each: [5156535413, 4548465444] } } }
)
