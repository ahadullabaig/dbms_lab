use empdb

db.employees.insertOne(
    {
        eid: 1 ,
        ename: "Rahul" ,
        dept: "UI/UX" ,
        design: "developer" ,
        salary: 60000 ,
        yoj: "2025-12-01" ,
        address: {
            dno: 57,
            street: 2,
            locality: "Dollars Colony",
            city: "Bengaluru"
        }
    }
)

db.employees.insertMany(
    [
        {
            eid: 2 ,
            ename: "Anjali" ,
            dept: "DevOps" ,
            design: "developer" ,
            salary: 40000 ,
            yoj: "2023-10-01" ,
            address: {
                dno: 54,
                street: 1,
                locality: "Dollars Colony",
                city: "Bengaluru"
            }
        },
        {
            eid: 3 ,
            ename: "Ahad" ,
            dept: "Rust Engineer" ,
            design: "developer" ,
            salary: 100000 ,
            yoj: "2020-01-01" ,
            address: {
                dno: 23,
                street: 9,
                locality: "Dollars Colony",
                city: "Bengaluru"
            }
        },
        {
            eid: 4 ,
            ename: "Raj" ,
            dept: "Sales" ,
            design: "Marketer" ,
            salary: 40000 ,
            yoj: "2024-12-01" ,
            address: {
                dno: 57,
                street: 2,
                locality: "Dollars Colony",
                city: "Bengaluru"
            }
        }
    ]
)
