using NUnit.Framework;
using System;
using System.Data;
using System.Data.SqlClient;
using TechTalk.SpecFlow;

namespace Sql.Steps
{
    [Binding]

    public class TestSQLRequests
    {
        string connectionString = @"Data Source=DESKTOP-FJU3ARM;Initial Catalog=PersonsOrders;Integrated Security=True";
        string sqlExpression;
        SqlDataAdapter adapter;
        DataSet ds;
        SqlConnection connection;
        SqlCommand command;
        int number;

        object id;

        object summa;
        object idPersons;

        object firstName;
        string lastName;
        object age;
        string city;

        [Given(@"Data for adding user is complited")]
        public void GivenDataForAddingUserIsComplited()
        {
            firstName = "UserTest" + RandomData();
            lastName = "'Test'";
            age = 30;
            city = "'Riga'";
        }

        [Then(@"Users data in DB equals to data in request")]
        public void ThenUsersDataInDBEqualsToDataInRequest()
        {
            FillAdapterMaxId("Persons", "ID");

            lastName = lastName.Replace("'", "");
            city = city.Replace("'", "");

            Assert.AreEqual(firstName, ds.Tables[0].Rows[0].ItemArray[1]);
            Assert.AreEqual(lastName, ds.Tables[0].Rows[0].ItemArray[2]);
            Assert.AreEqual(age, ds.Tables[0].Rows[0].ItemArray[3]);
            Assert.AreEqual(city, ds.Tables[0].Rows[0].ItemArray[4]);
            Assert.AreEqual(1, number);
        }



        [Given(@"Data for adding order is complited")]
        public void GivenDataForAddingOrderIsComplited()
        {
            summa = 20.00;
            idPersons = FindAgregateItemInt("MAX", "Persons", "ID");
        }

        [When(@"I make request (.*) to table")]
        public void WhenIMakeRequestToTable(string make)
        {
            switch (make)
            {
                case "add order":
                    sqlExpression = String.Format("INSERT INTO Orders ( SUM_order, ID) VALUES ('{0}', {1})", summa, idPersons);
                    break;
                case "update order":
                    sqlExpression = String.Format("UPDATE Orders SET SUM_order={0}, ID={1} WHERE ID_order=(SELECT MAX(ID_order) FROM Orders)", summa, idPersons);
                    break;
                case "delete order":
                    sqlExpression = String.Format("DELETE FROM Orders WHERE ID_order={0}", id);
                    break;
                case "add user":
                    sqlExpression = String.Format("INSERT INTO Persons (FirstName, LastName, Age, City) VALUES ('{0}', {1}, {2}, {3})", firstName, lastName, age, city);
                    break;
            }


            using (connection = new SqlConnection(connectionString))
            {
                connection.Open();
                command = new SqlCommand(sqlExpression, connection);
                number = command.ExecuteNonQuery();
            }
        }

        [Then(@"Order in DB equals to data")]
        public void ThenOrderInDBEqualsToData()
        {
            FillAdapterMaxId("Orders", "ID_order");

            Assert.AreEqual(summa, ds.Tables[0].Rows[0].ItemArray[1]);
            Assert.AreEqual(idPersons, ds.Tables[0].Rows[0].ItemArray[2]);
            Assert.AreEqual(1, number);
        }

        [Given(@"Data for updating order is complited")]
        public void GivenDataForUpdatingOrderIsComplited()
        {
            summa = 19.00;
            idPersons = FindAgregateItemInt("MAX", "Persons", "ID");
        }

        [Given(@"Data for deleting order is complited")]
        public void GivenDataForDeletingOrderIsComplited()
        {
            FillAdapterMaxId("Orders", "ID_order");

            id = ds.Tables[0].Rows[0].ItemArray[0];

            summa = ds.Tables[0].Rows[0].ItemArray[1];
            idPersons = ds.Tables[0].Rows[0].ItemArray[2];
        }


        [Then(@"Order does not exist in DB")]
        public void ThenOrderDoesNotExistInDB()
        {
            FillAdapterMaxId("Orders", "ID_order");

            Assert.AreNotEqual(id, ds.Tables[0].Rows[0].ItemArray[0]);
            Assert.AreEqual(1, number);
        }


        public void FillAdapterMaxId(string nameTable, string nameColimn)
        {
            string sqlExpression = $"SELECT * From {nameTable} WHERE {nameColimn} = (SELECT MAX({nameColimn}) FROM {nameTable})";
            using (connection = new SqlConnection(connectionString))
            {
                connection.Open();
                adapter = new SqlDataAdapter(sqlExpression, connection);

                ds = new DataSet();
                adapter.Fill(ds);
            }
        }

        public string RandomData()
        {
            string now = DateTime.Now.ToString();
            string random = now.Replace(":", "").Replace(" ", "").Replace("/", "");
            return random;
        }

        public int FindAgregateItemInt(string operatorName, string nameBase, string nameColumn)
        {
            int maxItem;
            string sqlExpression = $"SELECT {operatorName}({nameColumn}) FROM {nameBase}";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                maxItem = (int)command.ExecuteScalar();
            }
            return maxItem;
        }
    }
}
