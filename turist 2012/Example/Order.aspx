<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Title="SaveOrderProcedure" %>


<script runat="server">

    // Объявления хранимых процедур
    // Вставка записи
    string sql1 =
        "CREATE PROCEDURE InsertOrder "
      + "@orderID		int OUTPUT,"
      + "@numbdogov		varchar(10),"
      + "@t_bazaID		int,"
      + "@t_teplID		int,"
      + "@t_zagrID		int,"
      + "@t_gostID		int,"
      + "@clientIDppl		int,"
      + "@clientIDorg		int,"
      + "@clientgo		int,"
      + "@datein    varchar(10),"
      + "@time  int,"
      + "@pasptype		int"
      
      + "AS "
      + "INSERT INTO orders "
      + "(numbdogov, t_bazaID, t_teplID,t_zagrID,t_gostID,clientIDppl,clientIDorg,clientgo, datein, time,pasptype) "
      + "VALUES(@numbdogov, @t_bazaID, @t_teplID,@t_zagrID,@t_gostID,@clientIDppl,@clientIDorg,@clientgo,@datein, @time,@pasptype) "
      + "SET @orderID = @@IDENTITY";

    // Удаление записи
    string sql2 =
        "CREATE PROCEDURE DeleteOrder "
      + "@OrderID		int "
      + "AS "
      + "DELETE FROM orders WHERE orderID = @OrderID";

    // Обновление записи
    string sql3 =
        "CREATE PROCEDURE UpdateOrder "
      + "@orderID		int OUTPUT,"
      + "@numbdogov		varchar(10),"
      + "@t_bazaID		int,"
      + "@t_teplID		int,"
      + "@t_zagrID		int,"
      + "@t_gostID		int,"
      + "@clientIDppl		int,"
      + "@clientIDorg		int,"
      + "@clientgo		int,"
      + "@datein    varchar(10),"
      + "@time  int,"
      + "@pasptype		int"
      + "AS "
      + "UPDATE orders "
      + "SET "
     
      + "numbdogov = @numbdogov,"
      + "t_bazaID = @t_bazaID,"
      + "t_teplID = @t_teplID,"
      + "t_zagrID = @t_zagrID,"
      + "t_gostID = @t_gostID,"
      + "clientIDppl = @clientIDppl,"
      + "clientIDorg = @clientIDorg,"
      + "clientgo = @clientgo,"
      + "datein = @datein,"
      + "time = @time,"
      + "pasptype = @pasptype"
      + "WHERE orderID = @orderID";

    // Выбрать все
    string sql4 =
        "CREATE PROCEDURE GetAllOrders "
      + "AS "
      + "SELECT orderID, numbdogov, t_bazaID, t_teplID,t_zagrID,t_gostID,clientIDppl,clientIDorg,clientgo, datein, time,pasptype "
      + "FROM orders";

    // Подсчитать число записей
    string sql5 =
        "CREATE PROCEDURE CountOrders "
      + "AS "
      + "SELECT COUNT(orderID) "
      + "FROM orders";

    // Выбрать запись
    string sql6 =
        "CREATE PROCEDURE GetOrder "
      + "@orderID		int "
      + "AS "
      + "SELECT orderID, numbdogov, t_bazaID, t_teplID,t_zagrID,t_gostID,clientIDppl,clientIDorg,clientgo, datein, time,pasptype "
      + "FROM orders "
      + "WHERE orderID = @orderID";
    // Выбрать список туристов в заказе
    string sql7 =
       "CREATE PROCEDURE GetOrderPeoples "
     + "@orderID		int "
     + "AS "
     + "SELECT people.peopleID, fio,  fioLat, sex,  address,  email,  phone,  birthday, seriapasp, numberpasp, whopasp, wherepasp, seriazpasp, numberzpasp, whozpasp, wherezpasp, wherendzpasp "
     + "FROM orderpeople, people "
     + "WHERE orderpeople.orderID = @orderID and orderpeople.peopleID = people.peopleID";
    // Выбрать заказ по ID клиента
    string sql8 =
        "CREATE PROCEDURE GetOrdersByClient "
      + "@clientIDppl		int," //Не нужное как нуль
      + "@clientIDorg		int"
      + "AS "
      + "SELECT orderID, numbdogov, t_bazaID, t_teplID,t_zagrID,t_gostID,clientIDppl,clientIDorg,clientgo, datein, time,pasptype "
      + "FROM orders "
      + "WHERE clientIDppl = @clientIDppl or clientIDorg = @clientIDorg";
    // Выбрать список услуг в заказе
    string sql7 =
       "CREATE PROCEDURE GetOrderServices "
     + "@orderID		int "
     + "AS "
     + "SELECT service.serviceID, name, cost, comment "
     + "FROM orderservice, services "
     + "WHERE orderservices.orderID = @orderID and orderservices.serviceID = services.serviceID";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        // Извлекли строку соединения из web.config
        string connectString = System.Web.Configuration.WebConfigurationManager.
            ConnectionStrings["mssqltur"].ConnectionString;

        // Создали объект соединения
        System.Data.SqlClient.SqlConnection con =
            new System.Data.SqlClient.SqlConnection(connectString);

        // Создали объект Command
        System.Data.SqlClient.SqlCommand cmd =
            new System.Data.SqlClient.SqlCommand();

        // Настроили объект Command
        cmd.Connection = con;
        cmd.CommandType = System.Data.CommandType.Text;

        lblInfo.Text = "";

        // Открываем соединение в безопасном режиме
        try
        {
            con.Open();
        }
        catch
        {
            con.Close();
            return;
        }

        // Выполняем команды в безопасном режиме
        // Удаляем процедуры на случай повторного запуска этой страницы
        try
        {
            cmd.CommandText = "DROP PROCEDURE InsertOrder";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE InsertOrder\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE DeleteOrder";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROC DeleteOrder\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE UpdateOrder";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE UpdateOrder\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE GetAllOrders";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE GetAllOrders\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE CountOrders";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE CountEmployees\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE GetOrder";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE GetOrder\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE GetOrderByClient";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE GetOrderByClient\"<br />";
        }
        catch { }

        // Выполняем команды в безопасном режиме
        // Добавляем в базу данных хранимые процедуры
        try
        {
            cmd.CommandText = sql1;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE InsertOrder\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql2;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE DeleteOrder\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql3;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdateOrder\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql4;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE GetAllOrders\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql5;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE CountOrders\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql6;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE GetOrder\"<br />";

        }
        catch { }
        try
        {
            cmd.CommandText = sql7;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE GetOrderByClient\"<br />";

        }
        catch { }
        finally
        {
            con.Close();
        }
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblInfo" runat="server" />
    </form>
</body>
</html>