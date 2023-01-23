
    ***Status***
    Hilal = " "
    Umut = "Person cart curt"
    Mert = "  "

!! Receipt in timestamp i date değiştirilmeli

* In this system there are people. These people can be residents of the apartment, apartment manager (resident or an external person - then you should pay for this person), apartment manager assistant, controller (who looks at the expenses and check, kind of inspector), apartment serviceman (apartman görevlisi), and people you get service as apartment (repairmen etc). 

* CASE 2 SOLVED +++ (apartmanda bulunan insan sayısı >= 9 ise ve DecisionsDesc = aidat ise  manager paid flag = 0 )

* Apartment manager has some legal authority such as a) he can set an electricity subscription, b) he can set as an water subscription, c) he can get other subscriptions. Generally apartment should pay the bills for these subscriptions. It can be monthly but sometimes period can change as well.

* There are 2 electricity subscriptions: one for elevator, one for corridors, garage, and other areas.

* In apartment meetings there will be decisions made by the apartment (either majority voting, or full voting). These meeting, decisions on these meetings, votes, and if it is approved or not should be stored. If there are 9 flat then 5 or more is majority, 9 is full voting. Some decisions requires full voting. This is decided by the law so user of the system should enter this manually.

* All the expenses must be stored in the database.

* Dues (aidat) must be stored in the database.

* Amount of dues are decided at a meeting. Then it is fixed until it is changed in another meeting.

* Sometime extra due can be collected for extra needs (i.e. big maintenance operation etc).

* There should be reports such as monthly expenses, unpaid dues, expense/due balance, average expense within a period etc.

* Controller has only read-only access to expenses, dues and reports to investigate if apartment manager is honest with them.

* Apartment manager can send message to residents (so their mail, phone numbers, whatsapp/telegram connection etc must be stored).

* Once you pay the bills (online or physically) these bills (as pdf or scanned images) must be stored in the database so that they can be accessed later.

* For maintenance tasks you should get a payment receipt from the handyman.

* Once a resident paid its monthly due then you should give a due receipt to the resident.

* A resident can move to other flat. For example a person can live in flat 9 for 3 years then this person can move to another flat in the same apartment (for example flat 2). This person can be also apartment manager. So roles must be not bind to flat, they must be bind to a person. Historical data must be preserved intact. If I want to see a certain time in apartment management (expenses, dues, roles) I should able to get it correctly.