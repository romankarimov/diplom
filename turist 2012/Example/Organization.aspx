<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Organization.aspx.cs" Title="SaveOrganizationProcedure"  %>


<script runat="server">

    // Объявления хранимых процедур
    // Вставка записи
    string sql1 =
        "CREATE PROCEDURE InsertOrganization "
      + "@organizationID		int OUTPUT,"
      + "@director		varchar(200),"
           + "@position		varchar(50),"
           + "@orgface		varchar(200),"
           + "@address1		varchar(200),"
           + "@orgemail		varchar(50),"
           + "@orgphone		varchar(20),"
           + "@address2		varchar(200),"
           + "@contactname		varchar(150),"
           + "@contactposition		varchar(50),"
           + "@contactphone		varchar(20),"
           + "@bikbank		varchar(50),"
           + "@bank		varchar(50),"
           + "@rschet		varchar(100),"
           + "@orgschet		varchar(100),"
           + "@inn		varchar(50),"
           + "@kpp		varchar(50),"
           + "@ogrn		varchar(50),"
           + "@okpo		varchar(50)"
      + "AS "
      + "INSERT INTO organization "
      + "(director,  position, orgface,  address1,  orgemail,  orgphone,  address2, contactname, contactposition, contactphone, bikbank, bank, rschet, orgschet, inn, kpp, ogrn, okpo) "
      + "VALUES(@director,  @position, @orgface,  @address1,  @orgemail,  @orgphone,  @address2, @contactname, @contactposition, @contactphone, @bikbank, @bank, @rschet, @orgschet, @inn, @kpp, @ogrn, @okpo) "
      + "SET @organizationID = @@IDENTITY";

    // Удаление записи
    string sql2 =
        "CREATE PROCEDURE DeleteOrganization "
      + "@organizationID		int "
      + "AS "
      + "DELETE FROM organization WHERE organizationID = @organizationID";

    // Обновление записи
    string sql3 =
        "CREATE PROCEDURE UpdateOrganization "
           + "@organizationID		int OUTPUT,"
           + "@director		varchar(200),"
           + "@position		varchar(50),"
           + "@orgface		varchar(200),"
           + "@address1		varchar(200),"
           + "@orgemail		varchar(50),"
           + "@orgphone		varchar(20),"
           + "@address2		varchar(200),"
           + "@contactname		varchar(150),"
           + "@contactposition		varchar(50),"
           + "@contactphone		varchar(20),"
           + "@bikbank		varchar(50),"
           + "@bank		varchar(50),"
           + "@rschet		varchar(100),"
           + "@orgschet		varchar(100),"
           + "@inn		varchar(50),"
           + "@kpp		varchar(50),"
           + "@ogrn		varchar(50),"
           + "@okpo		varchar(50)"
      + "AS "
      + "UPDATE organization "
      + "SET "
      + "director= @director,"
      + "position = @position,"
      + "orgface = @orgface,"
      + "address1 = @address1,"
      + "orgemail = @orgemail,"
      + "orgphone = @orgphone,"
      + "address2 = @address2,"
      + "contactname = @contactname,"
      + "contactposition = @contactposition,"
      + "contactphone = @contactphone,"
      + "bikbank = @bikbank,"
      + "bank = @bank,"
      + "rschet = @rschet,"
      + "orgschet = @orgschet,"
      + "inn= @inn,"
      + "kpp = @kpp,"
      + "ogrn= @ogrn,"
      + "okpo = @okpo"
      + "WHERE organizationID = @organizationID";

    // Выбрать все
    string sql4 =
        "CREATE PROCEDURE GetAllOrganizations "
      + "AS "
      + "SELECT organizationID, director,  position, orgface,  address1,  orgemail,  orgphone,  address2, contactname, contactposition, contactphone, bikbank, bank, rschet, orgschet, inn, kpp, ogrn, okpo "
      + "FROM organization";

    // Подсчитать число записей
    string sql5 =
        "CREATE PROCEDURE CountOrganizations "
      + "AS "
      + "SELECT COUNT(organizationID) "
      + "FROM organization";

    // Выбрать запись
    string sql6 =
        "CREATE PROCEDURE GetOrganization "
      + "@organizationID		int "
      + "AS "
      + "SELECT organizationID, director,  position, orgface,  address1,  orgemail,  orgphone,  address2, contactname, contactposition, contactphone, bikbank, bank, rschet, orgschet, inn, kpp, ogrn, okpo "
      + "FROM organization "
      + "WHERE organizationID = @organizationID";

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
            cmd.CommandText = "DROP PROCEDURE InsertOrganization";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE InsertOrganization\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE DeleteOrganization";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROC DeleteOrganization\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE UpdateOrganization";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE UpdateOrganization\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = "DROP PROCEDURE GetAllOrganizations";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE GetAllOrganizations\"<br />";
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
            cmd.CommandText = "DROP PROCEDURE GetOrganization";
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"DROP PROCEDURE GetOrganization\"<br />";
        }
        catch { }

        // Выполняем команды в безопасном режиме
        // Добавляем в базу данных хранимые процедуры
        try
        {
            cmd.CommandText = sql1;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE InsertOrganization\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql2;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE DeleteOrganization\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql3;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE UpdateOrganization\"<br />";
        }
        catch { }
        try
        {
            cmd.CommandText = sql4;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"CREATE PROCEDURE GetAllOrganizations\"<br />";
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
            lblInfo.Text += "Прошли \"CREATE PROCEDURE GetOrganization\"<br />";

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