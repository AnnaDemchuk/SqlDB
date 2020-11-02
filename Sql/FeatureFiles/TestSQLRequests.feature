Feature: Test SQL requests

	In order when placing an order you do not have to fill in your data
	As a customer
	I want to add my details to the customer database

	In order to buy the product
	As a customer
	I want to make the order

	In order there is a correct order in the database if the customer changes the order data
	As a store manager
	I want to edit an order

	In order not to buy what I do not need
	As a customer
	I want to delete an order


@user
Scenario: Add user
	Given Data for adding user is complited	
	When I make request add user to table
	Then Users data in DB equals to data in request


@order
Scenario: Add order (to last userId)
	Given Data for adding order is complited	
	When I make request add order to table
	Then Order in DB equals to data

@order
	Scenario: Update order (last order)
	Given Data for updating order is complited	
	When  I make request update order to table
	Then Order in DB equals to data

@order
	Scenario: Delete order (last order)
	Given Data for deleting order is complited	
	When  I make request delete order to table
	Then Order does not exist in DB 

