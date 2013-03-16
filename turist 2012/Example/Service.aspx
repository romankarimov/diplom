<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Title="SaveServiceProcedure" %>


<script runat="server">

    // Объявления хранимых процедур
    // Вставка записи
    string sql1 =
        "CREATE PROCEDURE InsertService "
      + "@serviceID		int OUTPUT,"
      + "@name		varchar(50),"
      + "@cost		int,"
      + "@comment	varchar(200) "
      + "AS "
      + "INSERT INTO services "
      + "(name, cost, comment) "
      + "VALUES(@name, @cost, @comment) "
      + "SET @serviceID = @@IDENTITY";

    // Удаление записи
    string sql2 =
        "CREATE PROCEDURE DeleteService "
      + "@serviceID		int "
      + "AS "
      + "DELETE FROM services WHERE serviceID = @serviceID";

    // Обновление записи
    string sql3 =
        "CREATE PROCEDURE UpdateService "
      + "@serviceID		int OUTPUT,"
      + "@name		varchar(50),"
      + "@cost		int,"
      + "@comment	varchar(200) "
      + "AS "
      + "UPDATE services "
      + "SET "
      + "name = @name,"
      + "cost = @cost,"
      + "comment = @comment "
      + "WHERE serviceID = @serviceID";

    // Выбрать все
    string sql4 =
        "CREATE PROCEDURE GetAllServices "
      + "AS "
      + "SELECT serviceID, name, cost, comment "
      + "FROM services";

    // Подсчитать число записей
    string sql5 =
        "CREATE PROCEDURE CountServices "
      + "AS "
      + "SELECT COUNT(serviceID) "
      + "FROM services";

    // Выбрать запись
    string sql6 =
        "CREATE PROCEDURE GetService "
      + "@serviceID		int "
      + "AS "
      + "SELECT serviceID, name, cost, comment "
      + "FROM services "
      + "WHERE serviceID = @serviceID";
   


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
            cmd.CommandText = "DROP PROCEDURE InsertService";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE InsertService\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE DeleteService";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROC DeleteService\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE UpdateService";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE UpdateService\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE GetAllServices";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE GetAllServices\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE CountEmployees";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE CountEmployees\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE GetService";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE GetService\"<br />";
        }
        catch { }

        // Выполняем команды в безопасном режиме
        // Добавляем в базу данных хранимые процедуры
        try
        {
            cmd.CommandText = sql1;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE InsertService\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql2;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE DeleteService\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql3;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdateService\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql4;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE GetAllServices\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql5;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE CountEmployees\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql6;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE GetService\"<br />";

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