using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Web.Configuration;
using System.Collections.Generic;
using System.Data.SqlClient;
/*
 * Класс "провайдеры туристических услуг"
 */
namespace turist.App_Code
{
    public class turoperator
    {
        public turoperator() { }
        public turoperator(int turoperatorID, string name, string director, string position, 
            string orgface, string address1, string orgemail, string orgphone, string address2, 
            string contactname, string contactposition, string contactphone, 
            string bikbank, string bank, string rschet, string orgschet, 
            string inn, string kpp, string ogrn, string okpo)
        {
            this.turoperatorID = turoperatorID;
            this.name = name;
            this.director=director;
            this.position=position;
            this.orgface=orgface;
            this.address1=address1;
            this.orgemail=orgemail;
            this.orgphone=orgphone;
            this.address2=address2;
            this.contactname=contactname;
            this.contactposition=contactposition;
            this.contactphone=contactphone;
            this.bikbank=bikbank;
            this.bank=bank;
            this.rschet=rschet;
            this.orgschet=orgschet;
            this.inn=inn;
            this.kpp = kpp;
            this.ogrn = ogrn;
            this.okpo = okpo;
        }


         private int turoperatorID;
         public int TuroperatorID
        {
            get { return turoperatorID; }
            set { turoperatorID = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string director;
        public string Director
        {
            get { return director; }
            set { director = value; }
        }

        private string position;
        public string Position
        {
            get { return position; }
            set { position = value; }
        }

        private string orgface;
        public string Orgface
        {
            get { return orgface; }
            set { orgface = value; }
        }

        private string address1;
        public string Address1
        {
            get { return address1; }
            set { address1 = value; }
        }

        private string orgemail;
        public string Orgemail
        {
            get { return orgemail; }
            set { orgemail = value; }
        }

        private string orgphone;
        public string Orgphone
        {
            get { return orgphone; }
            set { orgphone = value; }
        }

        private string address2;
        public string Address2
        {
            get { return address2; }
            set { address2 = value; }
        }

        private string contactname;
        public string Contactname
        {
            get { return contactname; }
            set { contactname = value; }
        }

        private string bank;
        public string Bank
        {
            get { return bank; }
            set { bank = value; }
        }

        private string contactposition;
        public string Contactposition
        {
            get { return contactposition; }
            set { contactposition = value; }
        }

        private string rschet;
        public string Rschet
        {
            get { return rschet; }
            set { rschet = value; }
        }

        private string contactphone;
        public string Contactphone
        {
            get { return contactphone; }
            set { contactphone = value; }
        }

        private string orgschet;
        public string Orgschet
        {
            get { return orgschet; }
            set { orgschet = value; }
        }

        private string bikbank;
        public string Bikbank
        {
            get { return bikbank; }
            set { bikbank = value; }
        }

        private string inn;
        public string Inn
        {
            get { return inn; }
            set { inn = value; }
        }

        private string kpp;
        public string Kpp
        {
            get { return kpp; }
            set { kpp = value; }
        }
        
        private string ogrn;
        public string Ogrn
        {
            get { return ogrn; }
            set { ogrn = value; }
        }

        private string okpo;
        public string Okpo
        {
            get { return okpo; }
            set { okpo = value; }
        }
    } //- Класс туроператоры
    public class tursDB
    {

        private string connectionString;

        public tursDB()
        {
            // Извлечь из файла web.config строку соединения по умолчанию
            connectionString = WebConfigurationManager.
                ConnectionStrings["mssqltur"].ConnectionString;
        }

        public tursDB(string connectionStringCustom)
        {
            // Извлечь из файла web.config другую строку соединения
            connectionString = WebConfigurationManager.
                ConnectionStrings[connectionStringCustom].ConnectionString;
        }

        public int InsertOrganization(turoperator emp1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("InsertTuroperator", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Director", SqlDbType.NVarChar, 200));
            cmd.Parameters["@Director"].Value = emp1.Director;
            cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Name"].Value = emp1.Name;
            cmd.Parameters.Add(new SqlParameter("@Position", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Position"].Value = emp1.Position;
            cmd.Parameters.Add(new SqlParameter("@Orgface", SqlDbType.NVarChar, 200));
            cmd.Parameters["@Orgface"].Value = emp1.Orgface;
            cmd.Parameters.Add(new SqlParameter("@Address1", SqlDbType.NVarChar, 200));
            cmd.Parameters["@Address1"].Value = emp1.Address1;
            cmd.Parameters.Add(new SqlParameter("@Orgemail", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Orgemail"].Value = emp1.Orgemail;
            cmd.Parameters.Add(new SqlParameter("@Orgphone", SqlDbType.NVarChar, 20));
            cmd.Parameters["@Orgphone"].Value = emp1.Orgphone;
            cmd.Parameters.Add(new SqlParameter("@Address2", SqlDbType.NVarChar, 200));
            cmd.Parameters["@Address2"].Value = emp1.Address2;
            cmd.Parameters.Add(new SqlParameter("@Contactname", SqlDbType.NVarChar, 150));
            cmd.Parameters["@Contactname"].Value = emp1.Contactname;
            cmd.Parameters.Add(new SqlParameter("@Bank", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Bank"].Value = emp1.Bank;
            cmd.Parameters.Add(new SqlParameter("@Contactposition", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Contactposition"].Value = emp1.Contactposition;
            cmd.Parameters.Add(new SqlParameter("@Rschet", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Rschet"].Value = emp1.Rschet;
            cmd.Parameters.Add(new SqlParameter("@Contactphone", SqlDbType.NVarChar, 20));
            cmd.Parameters["@Contactphone"].Value = emp1.Contactphone;
            cmd.Parameters.Add(new SqlParameter("@Orgschet", SqlDbType.NVarChar, 100));
            cmd.Parameters["@Orgschet"].Value = emp1.Orgschet;
            cmd.Parameters.Add(new SqlParameter("@Bikbank", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Bikbank"].Value = emp1.Bikbank;
            cmd.Parameters.Add(new SqlParameter("@Inn", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Inn"].Value = emp1.Inn;
            cmd.Parameters.Add(new SqlParameter("@Kpp", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Kpp"].Value = emp1.Kpp;
            cmd.Parameters.Add(new SqlParameter("@Ogrn", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Ogrn"].Value = emp1.Ogrn;
            cmd.Parameters.Add(new SqlParameter("@Okpo", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Okpo"].Value = emp1.Okpo;
            cmd.Parameters.Add(new SqlParameter("@turoperatorID", SqlDbType.Int, 4));
            cmd.Parameters["@TuroperatorID"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["@TuroperatorID"].Value;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx.");
            }
            finally
            {
                con.Close();
            }
        }

        public void DeleteOrganization(int TuroperatorID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("DeleteTuroperator", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TuroperatorID", SqlDbType.Int, 4));
            cmd.Parameters["@TuroperatorID"].Value = TuroperatorID;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx.");
            }
            finally
            {
                con.Close();
            }
        }

        public void UpdateOrganization(int TuroperatorID, string Name, string Director, string Position,
        string Orgface, string Address1, string Orgemail, string Orgphone, string Address2,
        string Contactname, string Contactposition, string Contactphone,
        string Bikbank, string Bank, string Rschet, string Orgschet,
        string Inn, string Kpp, string Ogrn, string Okpo)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("UpdateTuroperator", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Director", SqlDbType.NVarChar, 200));
            cmd.Parameters["@Director"].Value = Director;
            cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Name"].Value = Name;
            cmd.Parameters.Add(new SqlParameter("@Position", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Position"].Value = Position;
            cmd.Parameters.Add(new SqlParameter("@Orgface", SqlDbType.NVarChar, 200));
            cmd.Parameters["@Orgface"].Value = Orgface;
            cmd.Parameters.Add(new SqlParameter("@Address1", SqlDbType.NVarChar, 200));
            cmd.Parameters["@Address1"].Value = Address1;
            cmd.Parameters.Add(new SqlParameter("@Orgemail", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Orgemail"].Value = Orgemail;
            cmd.Parameters.Add(new SqlParameter("@Orgphone", SqlDbType.NVarChar, 20));
            cmd.Parameters["@Orgphone"].Value = Orgphone;
            cmd.Parameters.Add(new SqlParameter("@Address2", SqlDbType.NVarChar, 200));
            cmd.Parameters["@Address2"].Value = Address2;
            cmd.Parameters.Add(new SqlParameter("@Contactname", SqlDbType.NVarChar, 150));
            cmd.Parameters["@Contactname"].Value = Contactname;
            cmd.Parameters.Add(new SqlParameter("@Bank", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Bank"].Value = Bank;
            cmd.Parameters.Add(new SqlParameter("@Contactposition", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Contactposition"].Value = Contactposition;
            cmd.Parameters.Add(new SqlParameter("@Rschet", SqlDbType.NVarChar, 100));
            cmd.Parameters["@Rschet"].Value = Rschet;
            cmd.Parameters.Add(new SqlParameter("@Contactphone", SqlDbType.NVarChar, 20));
            cmd.Parameters["@Contactphone"].Value = Contactphone;
            cmd.Parameters.Add(new SqlParameter("@Orgschet", SqlDbType.NVarChar, 100));
            cmd.Parameters["@Orgschet"].Value = Orgschet;
            cmd.Parameters.Add(new SqlParameter("@Bikbank", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Bikbank"].Value = Bikbank;
            cmd.Parameters.Add(new SqlParameter("@Inn", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Inn"].Value = Inn;
            cmd.Parameters.Add(new SqlParameter("@Kpp", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Kpp"].Value = Kpp;
            cmd.Parameters.Add(new SqlParameter("@Ogrn", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Ogrn"].Value = Ogrn;
            cmd.Parameters.Add(new SqlParameter("@Okpo", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Okpo"].Value = Okpo;
            cmd.Parameters.Add(new SqlParameter("@TuroperatorID", SqlDbType.Int, 4));
            cmd.Parameters["@TuroperatorID"].Value = TuroperatorID;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx.");
            }
            finally
            {
                con.Close();
            }
        }

        public string GetNameOrg(int id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Select name from turoperator where TuroperatorID = @id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 10));
            cmd.Parameters["@id"].Value = id;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                return (string)reader["name"];
                reader.Close();

            }
            catch
            {
                throw new ApplicationException("Ошибка данныx!");
            }
            finally
            {
                con.Close();
            }
        }

        public List<torganization> GetAllOrganizations()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetAllTuroperators", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Создать коллекцию для всех записей 
            List<torganization> Organizations = new List<torganization>();

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    torganization emp = new torganization(
                    (int)reader["TuroperatorID"],
                    (string)reader["name"],
                    (string)reader["director"],
                    (string)reader["position"],
                    (string)reader["orgface"],
                    (string)reader["address1"],
                    (string)reader["orgemail"],
                    (string)reader["orgphone"],
                    (string)reader["address2"],
                    (string)reader["contactname"],
                    (string)reader["contactposition"],
                    (string)reader["contactphone"],
                    (string)reader["bikbank"],
                    (string)reader["bank"],
                    (string)reader["rschet"],
                    (string)reader["orgschet"],
                    (string)reader["inn"],
                    (string)reader["kpp"],
                    (string)reader["ogrn"],
                    (string)reader["okpo"]);
                    Organizations.Add(emp);
                }
                reader.Close();
                return Organizations;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx.");
            }
            finally
            {
                con.Close();
            }
        }

        //

    } //- методы для работы с классами
    public class turtype
    {
        public turtype() { }
        public turtype(int id, string name,  string comment, string pathfoto)
        {
            this.id = id;
            this.name = name;
            this.comment = comment;
            this.pathfoto = pathfoto;
        }

        

        private int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        
        private string comment;
        public string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        private string pathfoto;
        private int p1;
        private string p2;
        private string p3;
        private string p4;
        private string p5;
        private string p6;
        private string p7;
        private string p8;
        private string p9;
        private string p10;
        private int p11;
        public string Pathfoto
        {
            get { return pathfoto; }
            set { pathfoto = value; }
        }
    } //- Класс типы туров
    public class turgroup
    {
        public turgroup() { }
        public turgroup(int id, string name, string comment)
        {
            this.id = id;
            this.name = name;
            this.comment = comment;
        }
        
        private int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }


        private string comment;
        public string Comment
        {
            get { return comment; }
            set { comment = value; }
        }
               
    } //- Класс группы туров
    public class turway
    {
        public turway() { }
        public turway(int id, int idturoperator, int idtype, string name, string comment, int agent, string country)
        {
            this.id = id;
            this.idturoperator = idturoperator;
            this.idtype = idtype;
            this.name = name;
            this.comment = comment;
            this.agent = agent;
            this.country = country;
        }


        private int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string comment;
        public string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        private int idturoperator;
        public int Idturoperator
        {
            get { return idturoperator; }
            set { idturoperator = value; }
        }

        private int idtype;
        public int Idtype
        {
            get { return idtype; }
            set { idtype = value; }
        }

        private int agent;
        public int Agent
        {
            get { return agent; }
            set { agent = value; }
        }

        private string country;
        public string Country
        {
            get { return country; }
            set { country = value; }
        }
    } //- Класс туров
    public class turmenedger
    {
        public turmenedger() { }
        public turmenedger(int id, int turoperatorID, string fio,  string email, string phone, 
            string login, string password)
        {
            this.id = id;
            this.turoperatorID = turoperatorID;
            this.fio = fio;
            this.email = email;
            this.phone = phone;
            this.login = login;
            this.password =password;
        }

        private int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }
        private int turoperatorID;
        public int TuroperatorID
        {
            get { return turoperatorID; }
            set { turoperatorID = value; }
        }

        private string fio;
        public string Fio
        {
            get { return fio; }
            set { fio = value; }
        }

       

        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        private string phone;
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }

       
        private string login;
        public string Login
        {
            get { return login; }
            set {login = value; }
        }

        private string password;
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
    } //- Класс менеджеры туроператора
    public class fototurway
    {
        public fototurway() { }
        public fototurway(int id, int idturway, string comment, string path)
        {
            this.id = id;
            this.idturway = idturway;
            this.path =path;
            this.comment = comment;
        }


        private int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string comment;
        public string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        private int idturway;
        public int Idturway
        {
            get { return idturway; }
            set { idturway = value; }
        }

        

        private string path;
        public string Path
        {
            get { return path; }
            set { path = value; }
        }
    } //- Класс фото туров
    public class fototuroperator
    {
        public fototuroperator() { }
        public fototuroperator(int id, int idturoperator, string comment, string path)
        {
            this.id = id;
            this.idturoperator = idturoperator;
            this.path = path;
            this.comment = comment;
        }


        private int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string comment;
        public string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        private int idturoperator;
        public int Idturoperator
        {
            get { return idturoperator; }
            set { idturoperator = value; }
        }



        private string path;
        public string Path
        {
            get { return path; }
            set { path = value; }
        }
    } //- Класс фото туроператора
    
    public class t_baza
    {
        public t_baza(int t_bazaID, string name, string siteurl, string about, 
            string phone, string email, string address, string way, string fio, string dolgn, int agent)
        {
            this.t_bazaID = t_bazaID;
            this.name=name;
            this.way=way; //kak proexat' na bazy
            this.about=about;
            this.address=address;
            this.email=email;
            this.phone=phone;
            this.siteurl=siteurl; //www address
            this.fio = fio;
            this.dolgn = dolgn;
            this.agent = agent;
        }
        public t_baza() { }

        private int t_bazaID;
        public int T_bazaID
        {
            get { return t_bazaID; }
            set { t_bazaID = value; }
        }
        private string fio;
        public string Fio
        {
            get { return fio; }
            set { fio = value; }
        }
        private string dolgn;
        public string Dolgn
        {
            get { return dolgn; }
            set { dolgn = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string way;
        public string Way
        {
            get { return way; }
            set { way = value; }
        }

        private string about;
        public string About
        {
            get { return about; }
            set { about = value; }
        }

        private string address;
        public string Address
        {
            get { return address; }
            set { address = value; }
        }

        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        private string phone;
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }

        private string siteurl;
        public string Siteurl
        {
            get { return siteurl; }
            set { siteurl = value; }
        }

        private int agent;
        public int Agent
        {
            get { return agent; }
            set { agent = value; }
        }
       
    }

}
