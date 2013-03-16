<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Group.aspx.cs" Title="SavePeopleProcedure"  %>


<script runat="server">

    // Объявления хранимых процедур
    // Вставка записи
    string sql1 =
        "CREATE PROCEDURE InsertPeopleGroup "
      + "@pgroupid		int OUTPUT,"
      + "@groupname		varchar(150)"
      + "AS "
      + "INSERT INTO pgroup "
      + "(groupname) "
      + "VALUES(@groupname) "
      + "SET @pgroupid = @@IDENTITY";

    // Удаление записи
    string sql2 =
        "CREATE PROCEDURE DeletePeopleGroup "
      + "@pgroupid  	int "
      + "AS "
      + "DELETE FROM pgroup WHERE pgroupid = @pgroupid";

    // Обновление записи
    string sql3=
        "CREATE PROCEDURE UpdatePeopleGroup"
      + "@pgroupid		int OUTPUT,"
      + "@groupname		varchar(150)"
      + "AS "
      + "UPDATE pgroup" 
      + "SET "
      + "groupname= @groupname"
      + "WHERE pgroupid = @pgroupid;";
    

    // Выбрать все
    string sql4 =
        "CREATE PROCEDURE GetAllPeoplesGroup "
      + "AS "
      + "SELECT pgroupid, groupname"
      + "FROM pgroup";

    // Подсчитать число записей
    string sql5 =
        "CREATE PROCEDURE CountPeoplesGroup "
      + "AS "
      + "SELECT COUNT(pgroupid) "
      + "FROM pgroup";

    // Вставка записи
    string sql6 =
        "CREATE PROCEDURE InsertOrgGroup "
      + "@ogroupid		int OUTPUT,"
      + "@groupname		varchar(150)"
      + "AS "
      + "INSERT INTO ogroup "
      + "(groupname) "
      + "VALUES(@groupname) "
      + "SET @ogroupid = @@IDENTITY";

    // Удаление записи
    string sql7 =
        "CREATE PROCEDURE DeleteOrgGroup "
      + "@ogroupid  	int "
      + "AS "
      + "DELETE FROM ogroup WHERE ogroupid = @ogroupid";

    // Обновление записи
    string sql8 = "CREATE PROCEDURE UpdateOrgGroup"
      + "@ogroupid		int OUTPUT,"
      + "@groupname		varchar(150)"
      + "AS "
      + "UPDATE ogroup"
      + "SET "
      + "groupname= @groupname"
      + "WHERE ogroupid = @ogroupid;";


    // Выбрать все
    string sql9 =
        "CREATE PROCEDURE GetAllOrgsGroup "
      + "AS "
      + "SELECT ogroupid, groupname"
      + "FROM ogroup";

    // Подсчитать число записей
    string sql10 =
        "CREATE PROCEDURE CountOrgsGroup "
      + "AS "
      + "SELECT COUNT(ogroupid) "
      + "FROM ogroup";

    // Вставка записи
    string sql11 =
        "CREATE PROCEDURE InsertPeopleInGroup "
      + "@id		int OUTPUT,"
      + "@peopleid		int,"
      + "@groupid		int"
      + "AS "
      + "INSERT INTO peoplegroup "
      + "(peopleid,groupid) "
      + "VALUES(@peopleid,@groupid) "
      + "SET @id = @@IDENTITY";
    
    // Вставка записи
    string sql12 =
        "CREATE PROCEDURE InsertOrgInGroup "
      + "@id		int OUTPUT,"
      + "@orgid		int,"
      + "@groupid		int"
      + "AS "
      + "INSERT INTO organizationgroup "
      + "(orgid,groupid) "
      + "VALUES(@orgid,@groupid) "
      + "SET @id = @@IDENTITY";

    // Удаление записи
    string sql13 =
        "CREATE PROCEDURE DeletePeopleInGroup "
      + "@id  	int "
      + "AS "
      + "DELETE FROM peoplegroup WHERE id = @id";

    // Удаление записи
    string sql14 =
        "CREATE PROCEDURE DeleteOrgInGroup "
      + "@id  	int "
      + "AS "
      + "DELETE FROM organizationgroup WHERE id = @id";

    // Выбрать все
    string sql15 =
        "CREATE PROCEDURE GetAllPeoplesInGroup "
      + "@pgroupid int"
      + "AS "
      + "SELECT people.fio"
      + "FROM pgroup,peoplegroup,people "
      + "WHERE pgroup.pgroupid = peoplegroup.groupid and peoplegroup.peopleid = people.peopleID";

    // Выбрать все
    string sql16 =
        "CREATE PROCEDURE GetAllOrgsInGroup "
      + "@ogroupid int"
      + "AS "
      + "SELECT organization.name"
      + "FROM ogroup,organizationgroup,organization"
      + "WHERE ogroup.ogroupid = organizationgroup.groupid and organizationgroup.orgid = organization.organizationID";

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
            cmd.CommandText = sql7;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdatePeople2\"<br />";
        }
        catch { lblInfo.Text += "Fuck<br />"; }
        try
        {
            cmd.CommandText = sql8;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdatePeople2\"<br />";
        }
        catch { lblInfo.Text += "Fuck<br />"; }
        try
        {
            cmd.CommandText = sql9;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdatePeople2\"<br />";
        }
        catch { lblInfo.Text += "Fuck<br />"; }
        try
        {
            cmd.CommandText = sql10;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdatePeople2\"<br />";
        }
        catch { lblInfo.Text += "Fuck<br />"; }
        try
        {
            cmd.CommandText = sql11;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdatePeople2\"<br />";
        }
        catch { lblInfo.Text += "Fuck<br />"; }
        try
        {
            cmd.CommandText = sql12;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdatePeople2\"<br />";
        }
        catch { lblInfo.Text += "Fuck<br />"; }
        try
        {
            cmd.CommandText = sql13;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdatePeople2\"<br />";
        }
        catch { lblInfo.Text += "Fuck<br />"; }
        try
        {
            cmd.CommandText = sql14;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdatePeople2\"<br />";
        }
        catch { lblInfo.Text += "Fuck<br />"; }
        try
        {
            cmd.CommandText = sql15;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdatePeople2\"<br />";
        }
        catch { lblInfo.Text += "Fuck<br />"; }
        try
        {
            cmd.CommandText = sql16;
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