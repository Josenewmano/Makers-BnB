Makers BNB
=================

This is a basic AirBnB clone, where you can do the following:
- Sign up with Makers BnB.
- Login / logout of your Makers BnB.
- Submit properties to be listed.
- Book properties that you wish to stay in.

User stories:
-------

```
As a landlord, 
So that I can list my whole property portfolio, 
I want to add more than one space.

As a landlord,
So that I can describe my space,
I want to give my space a name.

As a landlord, 
So that I can describe my space, 
I want to give my space a short description.

As a landlord, 
So that I can describe my space, 
I want to give my space a price per night.

As a landlord, 
So that I can list my whole property portfolio,
I want to add more than one space.

As a customer, 
So that I can book a landlord’s space,
I want to request to hire a space for a night.

As a landlord, 
So that my customers can see when my space is available, 
I want to offer a range of dates.

As a landlord, 
So that I can hire my space out, 
I want to approve customer’s hire requests.

As a customer, 
So that I understand if my request is confirmed or rejected, 
I want to see the landlord’s decision.

As a landlord, 
If I don’t wish to hire my space out, 
I want to deny a customer’s hire request.

As a customer, 
So that I know if a space isn’t available, 
I want to only have access to available nights.
```

Domain Model & structures
-----

Here are our miro board purposes:

![Screenshot](https://i.imgur.com/UPmocjL.png)

Here are our miro board values & agreements:

![Screenshot](https://i.imgur.com/L1s3H5I.png)

Here is the database structure plan in action (prior to all user details added):

![Screenshot](https://i.imgur.com/tw4kSDw.png)

Here is our trello board in action:

![Screenshot](https://i.imgur.com/HFi3nN9.png)

To set up the bookmark manager database
-----

Connect to `psql` and create the `makers_bnb` database:

```
CREATE DATABASE makers_bnb;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

To set up the test database
-----

Connect to `psql` and create the `makers_bnb_test` database:

```
CREATE DATABASE makers_bnb_test;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

Viewing Makers BnB
-----

To view the webpage, run `rackup` and navigate to `localhost:2929`.