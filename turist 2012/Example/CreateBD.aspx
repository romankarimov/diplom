<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateBD.aspx.cs" Inherits="turist.CreateBD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    //Команды для создания таблиц
    string sql1 =
    "Create table services ("
    + "serviceID int identity(1,1) primary key"
    + ",name varchar(50)"
    + ",cost int"
    + ",comment varchar(200)"
    + "constraint uq_service_id unique (serviceID))";
    string sql2=
    "Create table organization ("
    + "organizationID		int identity(1,1) primary key,"
    + "director		varchar(200),"
    + "position		varchar(50),"
    + "orgface		varchar(200),"
    + "address1		varchar(200),"
    + "orgemail		varchar(50),"
    + "orgphone		varchar(20),"
    + "address2		varchar(200),"
    + "contactname		varchar(150),"
    + "contactposition		varchar(50),"
    + "contactphone		varchar(20),"
    + "bikbank		varchar(50),"
    + "bank		varchar(50),"
    + "rschet		varchar(100),"
    + "orgschet		varchar(100),"
    + "inn		varchar(50),"
    + "kpp		varchar(50),"
    + "ogrn		varchar(50),"
    + "okpo		varchar(50)"
    + "constraint uq_organization_id unique (organizationID))";
    string sql3 =
    "Create table member ("
    + "memberID int identity(1,1) primary key"
    + ",fio varchar(150)"
    + ",login varchar(50)"
    + ",role varchar(10)"
    + ",position varchar(50),"
    + "address		varchar(200),"
    + "email		varchar(50),"
    + "phone		varchar(20),"
    + "birthday		varchar(10)"
    + "constraint uq_member_id unique (memberID))";
    string sql4 =
    "Create table tbaza ("
    + "t_bazaID int identity(1,1) primary key"
    + ",name varchar(150)"
    + ",way varchar(200)"
    + ",about varchar(200),"
    + "address		varchar(200),"
    + "email		varchar(50),"
    + "phone		varchar(20),"
    + "siteurl		varchar(50)"
    + "constraint uq_tbaza_id unique (t_bazaID))";
    string sql5 =
    "Create table tgost ("
    + "t_gostID int identity(1,1) primary key"
    + ",name varchar(150)"
    + ",about varchar(200),"
    + "address		varchar(200),"
    + "email		varchar(50),"
    + "phone		varchar(20),"
    + "siteurl		varchar(50),"
    + "bronurl		varchar(50),"
    + "constraint uq_tgost_id unique (t_gostID))";
    string sql6 =
    "Create table ttepl ("
    + "t_teplID int identity(1,1) primary key"
    + ",name varchar(150)"
    + ",about varchar(200),"
    + "address		varchar(200),"
    + "email		varchar(50),"
    + "phone		varchar(20),"
    + "siteurl		varchar(50),"
    + "bazaID		int,"
    + "constraint uq_ttepl_id unique (t_teplID))";
    string sql7 =
    "Create table tzagr ("
    + "t_zagrID int identity(1,1) primary key"
    + ",name varchar(150)"
    + ",country varchar(50)"
    + ",about varchar(200),"
    + "address		varchar(200),"
    + "email		varchar(50),"
    + "phone		varchar(20),"
    + "siteurl		varchar(50),"
    + "cost		int,"
    + "constraint uq_tzagr_id unique (t_zagrID))";
    string sql8 =
    "Create table people ("
    +"peopleID		int identity(1,1) primary key,"
    + "fio		varchar(150),"
    + "fiolat		varchar(150),"
    + "sex		varchar(1),"
    + "address		varchar(200),"
    + "email		varchar(50),"
    + "phone		varchar(20),"
    + "birthday		varchar(10),"
    + "seriapasp		varchar(10),"
    + "numberpasp		varchar(10),"
    + "whopasp		varchar(150),"
    + "wherepasp		varchar(10),"
    + "seriazpasp		varchar(10),"
    + "numberzpasp		varchar(10),"
    + "whozpasp		varchar(150),"
    + "wherezpasp		varchar(10),"
    + "wherendzpasp		varchar(10)"
    + "constraint uq_people_id unique (peopleID))";
    string sql9 =
    "Create table orders ("
    + "orderID		int identity(1,1) primary key,"
     + "numbdogov		varchar(10),"
      + "t_bazaID		int,"
      + "t_teplID		int,"
      + "t_zagrID		int,"
      + "t_gostID		int,"
      + "clientIDppl		int,"
      + "clientIDorg		int,"
      + "clientgo		int,"
      + "datein    varchar(10),"
      + "time  int,"
      + "pasptype		int"
    + "constraint uq_order_id unique (orderID))";
    string sql10 =
    "Create table orderservice ("
    + "orderserviceID		int identity(1,1) primary key,"
    + "orderID		int,"
    + "serviceID	int"
    + "constraint uq_orderservice_id unique (orderserviceID))";
    string sql11 =
    "Create table servicepeople ("
    + "servicepeopleID		int identity(1,1) primary key,"
    + "serviceID	int,"
    + "peopleID		int"
    + "constraint uq_servicepeople_id unique (servicepeopleID))";
    string sql12 =
    "Create table orderpeople ("
    + "orderpeopleID		int identity(1,1) primary key,"
    + "orderID	int,"
    + "peopleID		int"
    + "constraint uq_orderpeople_id unique (orderpeopleID))";
    string sql12 =
    "Create table passwords ("
    + "passwordID		int identity(1,1) primary key,"
    + "memberID	int,"
    + "password		varchar(40)"
    + "constraint uq_passwords_id unique (passwordID, memberID))";
    
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
            cmd.CommandText = sql1;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql1\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql1"; }
        try
        {
            cmd.CommandText = sql2;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql2\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql2"; }
        try
        {
            cmd.CommandText = sql3;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql3\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql3"; }
        try
        {
            cmd.CommandText = sql4;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql4\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql4"; }
        try
        {
            cmd.CommandText = sql5;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql5\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql5"; }
        try
        {
            cmd.CommandText = sql6;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql6\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql6"; }
        try
        {
            cmd.CommandText = sql7;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql7\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql7"; }
       try
        {
            cmd.CommandText = sql8;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql8\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql8"; }
         
        try
        {
            cmd.CommandText = sql9;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql9\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql9"; }
        try
        {
            cmd.CommandText = sql10;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql10\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql10"; }
        try
        {
            cmd.CommandText = sql11;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql11\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql11"; }
        try
        {
            cmd.CommandText = sql12;
            cmd.ExecuteNonQuery();
            lblInfo.Text += "Прошли \"Create table sql12\"<br />";
        }
        catch { lblInfo.Text += "<br />Fuck sql12"; }
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Безымянная страница</title>
</head>

<body>
    <form id="form1" runat="server">
    <div>
    <asp:label ID="lblInfo" runat="server" text=""></asp:label>
    </div>
    </form>
</body>
</html>
