<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="People.aspx.cs" Title="SavePeopleProcedure"  %>


<script runat="server">

    // Объявления хранимых процедур
    // Вставка записи
    string sql1 =
        "CREATE PROCEDURE InsertPeople "
      + "@peopleID		int OUTPUT,"
      + "@fio		varchar(150),"
           + "@fiolat		varchar(150),"
           + "@sex		varchar(1),"
           + "@address		varchar(200),"
           + "@email		varchar(50),"
           + "@phone		varchar(20),"
           + "@birthday		varchar(10),"
           + "@seriapasp		varchar(10),"
           + "@numberpasp		varchar(10),"
           + "@whopasp		varchar(150),"
           + "@wherepasp		varchar(10),"
           + "@seriazpasp		varchar(10),"
           + "@numberzpasp		varchar(10),"
           + "@whozpasp		varchar(150),"
           + "@wherezpasp		varchar(10),"
           + "@wherendzpasp		varchar(10)"
      + "AS "
      + "INSERT INTO people "
      + "(fio,  fioLat, sex,  address,  email,  phone,  birthday, seriapasp, numberpasp, whopasp, wherepasp, seriazpasp, numberzpasp, whozpasp, wherezpasp, wherendzpasp) "
      + "VALUES(@fio,  @fioLat, @sex,  @address,  @email,  @phone,  @birthday, @seriapasp, @numberpasp, @whopasp, @wherepasp, @seriazpasp, @numberzpasp, @whozpasp, @wherezpasp, @wherendzpasp) "
      + "SET @peopleID = @@IDENTITY";

    // Удаление записи
    string sql2 =
        "CREATE PROCEDURE DeletePeople "
      + "@peopleID		int "
      + "AS "
      + "DELETE FROM people WHERE peopleID = @peopleID";

    // Обновление записи
    string sql3_2="CREATE PROCEDURE UpdatePeople" 
      + "@peopleID		int OUTPUT,"
      + "@fio		varchar(150),"
         + "  @fiolat		varchar(150),"
           + "@sex		varchar(1),"
           + "@address		varchar(200),"
           + "@email		varchar(50),"
           + "@phone		varchar(20),"
           + "@birthday		varchar(10),"
           + "@seriapasp		varchar(10),"
           + "@numberpasp		varchar(10),"
           + "@whopasp		varchar(150),"
           + "@wherepasp		varchar(10),"
           + "@seriazpasp		varchar(10),"
           + "@numberzpasp		varchar(10),"
           + "@whozpasp		varchar(150),"
           + "@wherezpasp		varchar(10),"
           + "@wherendzpasp		varchar(10)"
      + "AS "
      + "UPDATE people" 
      + "SET "
      + "fio= @fio,"
      + "fiolat = @fiolat,"
      + "sex = @sex,"
      + "address = @address,"
      + "email = @email,"
      + "phone = @phone,"
      + "birthday = @birthday,"
      + "seriapasp = @seriapasp,"
      + "numberpasp = @numberpasp,"
      + "whopasp = @whopasp,"
      + "wherepasp = @wherepasp,"
      + "seriazpasp = @seriazpasp,"
      + "numberzpasp = @numberzpasp,"
      + "whozpasp = @whozpasp,"
      + "wherezpasp= @wherezpasp,"
      + "wherendzpasp = @wherendzpasp"
      + "WHERE peopleID = @peopleID;";
    string sql3 =
        "CREATE PROCEDURE UpdatePeople "
      + "@peopleID		int,"
      + "@fio		varchar(150),"
           + "@fiolat		varchar(150),"
           + "@sex		varchar(1),"
           + "@address1		varchar(200),"
           + "@email		varchar(50),"
           + "@phone		varchar(20),"
           + "@birthday		varchar(10),"
           + "@seriapasp		varchar(10),"
           + "@numberpasp		varchar(10),"
           + "@whopasp		varchar(150),"
           + "@wherepasp		varchar(10),"
           + "@seriazpasp		varchar(10),"
           + "@numberzpasp		varchar(10),"
           + "@whozpasp		varchar(150),"
           + "@wherezpasp		varchar(10),"
           + "@wherendzpasp		varchar(10)"
      + "AS "
      + "UPDATE people"
      + "SET "
      + "fio= @fio,"
      + "fiolat = @fiolat,"
      + "sex = @sex,"
      + "address = @address1,"
      + "email = @email,"
      + "phone = @phone,"
      + "birthday = @birthday,"
      + "seriapasp = @seriapasp,"
      + "numberpasp = @numberpasp,"
      + "whopasp = @whopasp,"
      + "wherepasp = @wherepasp,"
      + "seriazpasp = @seriazpasp,"
      + "numberzpasp = @numberzpasp,"
      + "whozpasp = @whozpasp,"
      + "wherezpasp= @wherezpasp,"
      + "wherendzpasp = @wherendzpasp"
      + "WHERE peopleID = @peopleID";

    // Выбрать все
    string sql4 =
        "CREATE PROCEDURE GetAllPeoples "
      + "AS "
      + "SELECT peopleID, fio,  fioLat, sex,  address,  email,  phone,  birthday, seriapasp, numberpasp, whopasp, wherepasp, seriazpasp, numberzpasp, whozpasp, wherezpasp, wherendzpasp "
      + "FROM people";

    // Подсчитать число записей
    string sql5 =
        "CREATE PROCEDURE CountPeoples "
      + "AS "
      + "SELECT COUNT(peopleID) "
      + "FROM people";

    // Выбрать запись
    string sql6 =
        "CREATE PROCEDURE GetPeople "
      + "@peopleID		int "
      + "AS "
      + "SELECT peopleID, fio,  fioLat, sex,  address,  email,  phone,  birthday, seriapasp, numberpasp, whopasp, wherepasp, seriazpasp, numberzpasp, whozpasp, wherezpasp, wherendzpasp "
      + "FROM people "
      + "WHERE peopleID = @peopleID";

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
            cmd.CommandText = "DROP PROCEDURE InsertPeople";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE InsertPeople\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE DeletePeople";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROC DeletePeople\"<br />";
        }
        catch { }
        /*try
        {
            cmd.CommandText = "DROP PROCEDURE UpdatePeople";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE UpdatePeople\"<br />";
        }
        catch { }*/
        try
        {
            cmd.CommandText = "DROP PROCEDURE GetAllPeoples";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE GetAllPeoples\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE CountPeoples";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE CountEmployees\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE GetPeople";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE GetPeople\"<br />";
        }
        catch { }

        // Выполняем команды в безопасном режиме
        // Добавляем в базу данных хранимые процедуры
        try
        {
            cmd.CommandText = sql1;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE InsertPeople\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql2;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE DeletePeople\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql3;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdatePeople\"<br />";
        }
        catch { lblInfo.Text += "Fuck<br />"; }
        
        try
        {
            cmd.CommandText = sql4;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE GetAllPeoples\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql5;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE CountPeoples\"<br />";
        }
        catch { lblInfo.Text += "Fuck"; }
        try
        {
            cmd.CommandText = sql6;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE GetPeople\"<br />";

        }
        catch { lblInfo.Text += "Fuck"; }
        try
        {
            cmd.CommandText = sql3_2;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdatePeople2\"<br />";
        }
        catch { lblInfo.Text += "Fuck<br />"; }
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