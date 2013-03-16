<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tur.aspx.cs" Title="SaveServiceProcedure" %>


<script runat="server">

    // Объявления хранимых процедур
    // Вставка записи
    string sql1 =
        "CREATE PROCEDURE InsertTur "
      + "@t_bazaID		int OUTPUT,"
      + "@name		varchar(150),"
      + "@way		varchar(200),"
      + "@address		varchar(200),"
      + "@email		varchar(50),"
      + "@phone		varchar(20),"
      + "@siteurl		varchar(50),"
      + "@about		varchar(200)"
      + "AS "
      + "INSERT INTO tbaza "
      + "(name, way, address, email, phone, siteurl, about) "
      + "VALUES(@name, @way, @address, @email, @phone, @siteurl, @about) "
      + "SET @t_bazaID = @@IDENTITY";

    // Удаление записи
    string sql2 =
        "CREATE PROCEDURE DeleteTur"
      + "@t_bazaID  	int "
      + "AS "
      + "DELETE FROM tbaza WHERE t_bazaID = @t_bazaID";

    // Обновление записи
    string sql3 =
        "CREATE PROCEDURE UpdateTur "
      + "@t_bazaID		int OUTPUT,"
      + "@name		varchar(150),"
      + "@way		varchar(200),"
      + "@address		varchar(200),"
      + "@email		varchar(50),"
      + "@phone		varchar(20),"
      + "@siteurl		varchar(50),"
      + "@about		varchar(200)"
      + "AS "
      + "UPDATE tbaza "
      + "SET "
      + "name = @name,"
      + "way = @way,"
      + "address = @address, "
      + "email = @email,"
      + "phone = @phone,"
      + "siteurl = @siteurl,"
      + "about = @about"
      + "WHERE t_bazaID = @t_bazaID";

    // Выбрать все
    string sql4 =
        "CREATE PROCEDURE GetAllTurs "
      + "AS "
      + "SELECT t_bazaID, name, way, address, email, phone, siteurl, about "
      + "FROM tbaza";

    // Подсчитать число записей
    string sql5 =
        "CREATE PROCEDURE CountTurs "
      + "AS "
      + "SELECT COUNT(t_bazaID) "
      + "FROM tbaza";

    // Выбрать запись
    string sql6 =
        "CREATE PROCEDURE GetTur "
      + "@t_bazaID		int "
      + "AS "
      + "SELECT  name, way, address, email, phone, siteurl, about "
      + "FROM tbaza "
      + "WHERE t_bazaID = @t_bazaID";
   


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