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

namespace turist.App_Code
{
    public class t_bazaDB
    {
        private string connectionString;

        public t_bazaDB()
        {
            // Извлечь из файла web.config строку соединения по умолчанию
            connectionString = WebConfigurationManager.
                ConnectionStrings["mssqltur"].ConnectionString;
        }

        public t_bazaDB(string connectionStringCustom)
        {
            // Извлечь из файла web.config другую строку соединения
            connectionString = WebConfigurationManager.
                ConnectionStrings[connectionStringCustom].ConnectionString;
        }

        public int AddTurType(turtype emp1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insert into turtype(name,comment,pathfoto) values (@name,@comment,@pathfoto) SET @id = @@IDENTITY ", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 150));
            cmd.Parameters["@name"].Value = emp1.Name;
            cmd.Parameters.Add(new SqlParameter("@comment", SqlDbType.NVarChar, 200));
            cmd.Parameters["@comment"].Value = emp1.Comment;
            cmd.Parameters.Add(new SqlParameter("@pathfoto", SqlDbType.NVarChar, 200));
            cmd.Parameters["@pathfoto"].Value = emp1.Pathfoto;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["@id"].Value;
            }
            catch
            {
                return 0;
                throw new ApplicationException("Ошибка данныx. добавление типа тура");

            }
            finally
            {
                con.Close();
            }
        }
        public void DeleteTurType(int turtypeid)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Delete from turtype where turtype.id = @id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Value = turtypeid;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Удаление типа тура");
            }
            finally
            {
                con.Close();
            }
        }
        public List<turtype> GetAllTurTypes()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT id, name,  comment, pathfoto FROM turtype", con);
            cmd.CommandType = CommandType.Text;

            // Создать коллекцию для всех записей 
            List<turtype> list = new List<turtype>();
             try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    turtype emp = new turtype(
                    (int)reader["id"],
                   
                    (string)reader["name"],
                    (string)reader["comment"],
                    (string)reader["pathfoto"]);

                    list.Add(emp);
                }
                reader.Close();
                return list;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx.");
            }
            finally
            {
                con.Close();
            }
        } //Вывод всех типов
       

        public int AddTurOperator(turoperator  emp1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insert into turoperator (name, director,position,orgface,address1,orgemail,orgphone,address2,contactname,contactposition,contactphone,bikbank,bank,rschet,orgschet,inn,kpp,ogrn,okpo) values (@name, @director,@position,@orgface,@address1,@orgemail,@orgphone,@address2,@contactname,@contactposition,@contactphone,@bikbank,@bank,@rschet,@orgschet,@inn,@kpp,@ogrn,@okpo) SET @turoperatorid = @@IDENTITY", con);
            cmd.CommandType = CommandType.Text;
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
            cmd.Parameters["@turoperatorID"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["@turoperatorID"].Value;
            }
            catch
            {
                return 0;
                throw new ApplicationException("Ошибка данныx. Добавление тур оператора");

            }
            finally
            {
                con.Close();
            }
        }
        public int AddFotoTurOperator(string path, string comment, int idturoperator)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insert into fturoperator(idturoperator,path,comment) values (@idturoperator,@path,@comment) SET @id = @@IDENTITY", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@path", SqlDbType.NVarChar, 150));
            cmd.Parameters["@path"].Value = path;
            cmd.Parameters.Add(new SqlParameter("@comment", SqlDbType.NVarChar, 200));
            cmd.Parameters["@comment"].Value = comment;
            cmd.Parameters.Add(new SqlParameter("@idturoperator", SqlDbType.Int, 6));
            cmd.Parameters["@idturoperator"].Value = idturoperator;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["id"].Value;
            }
            catch
            {
                return 0;
                throw new ApplicationException("Ошибка данныx. Добавление фото туроператора");

            }
            finally
            {
                con.Close();
            }
        }
        public void DeleteTurOperator(int turoperatorid)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Delete from turoperator where turoperator.turoperatorid = @id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Value = turoperatorid;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Удаление туроператора");
            }
            finally
            {
                con.Close();
            }
        }
        public List<turoperator> GetAllTurOperator()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT turoperatorid, name, director, position, orgface,address1, orgemail,orgphone,address2,contactname,contactposition,contactphone,bikbang,bank,rschet,orgschet,inn,kpp,ogrn,okpo FROM turoperator", con);
            cmd.CommandType = CommandType.Text;

            // Создать коллекцию для всех записей 
            List<turoperator> list = new List<turoperator>();
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    turoperator emp = new turoperator(
                    (int)reader["id"],
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

                    list.Add(emp);
                }
                reader.Close();
                return list;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Вывод всех туроператоров");
            }
            finally
            {
                con.Close();
            }
        } 

        public int AddTurWay(turway emp1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insert into turway(idturoperator,idtype,name,comment,agent,country) values (@idturoperator,@idtype,@name,@comment,@agent,@country) SET @id = @@IDENTITY", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 150));
            cmd.Parameters["@name"].Value = emp1.Name;
            cmd.Parameters.Add(new SqlParameter("@comment", SqlDbType.NVarChar, 200));
            cmd.Parameters["@comment"].Value = emp1.Comment;
            cmd.Parameters.Add(new SqlParameter("@idturoperator", SqlDbType.Int, 6));
            cmd.Parameters["@idturoperator"].Value = emp1.Idturoperator;
            cmd.Parameters.Add(new SqlParameter("@idtype", SqlDbType.Int,6));
            cmd.Parameters["@idtype"].Value = emp1.Idtype;
            cmd.Parameters.Add(new SqlParameter("@agent", SqlDbType.Int, 3));
            cmd.Parameters["@agent"].Value = emp1.Agent;

            cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.NVarChar, 200));
            cmd.Parameters["@country"].Value = emp1.Country;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["id"].Value;
            }
            catch
            {
                return 0;
                throw new ApplicationException("Ошибка данныx. Добавление турнаправления");

            }
            finally
            {
                con.Close();
            }
        }
        public int AddFotoTurWay(string path, string comment, int idturway)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insert into fturway(idturway,path,comment) values (@idturway,@path,@comment) SET @id = @@IDENTITY", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@path", SqlDbType.NVarChar, 150));
            cmd.Parameters["@path"].Value = path;
            cmd.Parameters.Add(new SqlParameter("@comment", SqlDbType.NVarChar, 200));
            cmd.Parameters["@comment"].Value = comment;
            cmd.Parameters.Add(new SqlParameter("@idturway", SqlDbType.Int, 6));
            cmd.Parameters["@idturway"].Value = idturway;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["id"].Value;
            }
            catch
            {
                return 0;
                throw new ApplicationException("Ошибка данныx. Добавление фото турнаправления");

            }
            finally
            {
                con.Close();
            }
        }
        public void DeleteTurWay(int turwayid)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Delete from turway where turway.id = @id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Value = turwayid;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Удаление типа тура");
            }
            finally
            {
                con.Close();
            }
        }
        public List<turway> GetAllTurWay()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT id,idturoperator,idtype, name,  comment, agent,country FROM turway", con);
            cmd.CommandType = CommandType.Text;

            // Создать коллекцию для всех записей 
            List<turway> list = new List<turway>();
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    turway emp = new turway(
                    (int)reader["id"],
                    (int)reader["idturoperator"],
                    (int)reader["idtype"],
                    (string)reader["name"],
                    (string)reader["comment"],
                    (int)reader["agent"],
                    (string)reader["country"]
                    );

                    list.Add(emp);
                }
                reader.Close();
                return list;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx.");
            }
            finally
            {
                con.Close();
            }
        } //Вывод всех турнаправлений
        public List<turway> GetAllTurWayByOperator(int id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT id,idturoperator,idtype, name,  comment, agent,country FROM turway Where idturoperator = @id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Value = id;
            // Создать коллекцию для всех записей 
            List<turway> list = new List<turway>();
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    turway emp = new turway(
                    (int)reader["id"],
                    (int)reader["idturoperator"],
                    (int)reader["idtype"],
                    (string)reader["name"],
                    (string)reader["comment"],
                    (int)reader["agent"],
                    (string)reader["country"]
                    );

                    list.Add(emp);
                }
                reader.Close();
                return list;
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

        public int AddTurGroup(turgroup emp1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insert into turgroup(name,comment) values (@name,@comment) SET @id = @@IDENTITY ", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 150));
            cmd.Parameters["@name"].Value = emp1.Name;
            cmd.Parameters.Add(new SqlParameter("@comment", SqlDbType.NVarChar, 200));
            cmd.Parameters["@comment"].Value = emp1.Comment;
            
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["@id"].Value;
            }
            catch
            {
                return 0;
                throw new ApplicationException("Ошибка данныx. добавление группы тур");

            }
            finally
            {
                con.Close();
            }
        }
        public void DeleteTurGroup(int turgroup)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Delete from turgroup where turgroup.id = @id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Value = turgroup;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Удаление группы тура");
            }
            finally
            {
                con.Close();
            }
        }
        public List<turgroup> GetAllTurGroup()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT id, name,  comment FROM turgroup", con);
            cmd.CommandType = CommandType.Text;

            // Создать коллекцию для всех записей 
            List<turgroup> list = new List<turgroup>();
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    turgroup emp = new turgroup(
                    (int)reader["id"],

                    (string)reader["name"],
                    (string)reader["comment"]);

                    list.Add(emp);
                }
                reader.Close();
                return list;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Вывод всех групп тур");
            }
            finally
            {
                con.Close();
            }
        } //Вывод всех типов
        public int AddTurWayInGroup(int turgroup, int turway)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insert into TurWayInGroup(idturgroup,idturway) values (@idturgroup,@idturway) SET @id = @@IDENTITY ", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@turgroup", SqlDbType.Int, 6));
            cmd.Parameters["@turgroup"].Value = turgroup;
            cmd.Parameters.Add(new SqlParameter("@turway", SqlDbType.Int, 6));
            cmd.Parameters["@turway"].Value = turway;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["@id"].Value;
            }
            catch
            {
                return 0;
                throw new ApplicationException("Ошибка данныx. добавление тура в группу тур");

            }
            finally
            {
                con.Close();
            }
        }
        public int DeleteTurWayInGroup(int idturgroup, int idturway)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Delete from TurWayInGroup where TurWayInGroup.idturway = @idturway and TurWayInGroup.idturgroup = @idturgroup", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@idturgroup", SqlDbType.Int, 6));
            cmd.Parameters["@idturgroup"].Value = idturgroup;
            cmd.Parameters.Add(new SqlParameter("@idturway", SqlDbType.Int, 6));
            cmd.Parameters["@idturway"].Value = idturway;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["@id"].Value;
            }
            catch
            {
                return 0;
                throw new ApplicationException("Ошибка данныx. удаление турнаправления из группы");

            }
            finally
            {
                con.Close();
            }
        }
        public List<turway> GetAllTurWayInGroup(int turgroup)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT id,idturoperator,idtype, name,  comment, agent,country FROM turway where turway.id = TurWayInGroup.idturway and TurWayInGroup.idturgroup = @idturgroup", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@idturgroup", SqlDbType.Int, 6));
            cmd.Parameters["@idturgroup"].Value = turgroup;
            // Создать коллекцию для всех записей 
            List<turway> list = new List<turway>();
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    turway emp = new turway(
                    (int)reader["id"],
                    (int)reader["idturoperator"],
                    (int)reader["idtype"],
                    (string)reader["name"],
                    (string)reader["comment"],
                    (int)reader["agent"],
                    (string)reader["country"]
                    );

                    list.Add(emp);
                }
                reader.Close();
                return list;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Вывод всех турнаправлений в группе тур");
            }
            finally
            {
                con.Close();
            }
        } //Вывод всех турнаправлений в группе по ид группы



        /* Спойлер
         * 
         * */
        public int InsertTur(t_baza emp1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("InsertTur", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 150));
            cmd.Parameters["@name"].Value = emp1.Name;
            cmd.Parameters.Add(new SqlParameter("@way", SqlDbType.NVarChar, 200));
            cmd.Parameters["@way"].Value = emp1.Way;
            cmd.Parameters.Add(new SqlParameter("@address", SqlDbType.NVarChar, 200));
            cmd.Parameters["@address"].Value = emp1.Address;
            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50));
            cmd.Parameters["@email"].Value = emp1.Email;
            cmd.Parameters.Add(new SqlParameter("@phone", SqlDbType.NVarChar, 20));
            cmd.Parameters["@phone"].Value = emp1.Phone;
            cmd.Parameters.Add(new SqlParameter("@siteurl", SqlDbType.NVarChar, 50));
            cmd.Parameters["@siteurl"].Value = emp1.Siteurl;
            cmd.Parameters.Add(new SqlParameter("@about", SqlDbType.NVarChar, 200));
            cmd.Parameters["@about"].Value = emp1.About;
            cmd.Parameters.Add(new SqlParameter("@fio", SqlDbType.NVarChar, 150));
            cmd.Parameters["@fio"].Value = emp1.About;
            cmd.Parameters.Add(new SqlParameter("@dolgn", SqlDbType.NVarChar, 50));
            cmd.Parameters["@dolgn"].Value = emp1.About;
            cmd.Parameters.Add(new SqlParameter("@agent", SqlDbType.Int, 3));
            cmd.Parameters["@agent"].Value = emp1.Agent;
            cmd.Parameters.Add(new SqlParameter("@t_bazaID", SqlDbType.Int, 6));
            cmd.Parameters["@t_bazaID"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["@t_bazaID"].Value;
            }
            catch
            {
                return 0;
                throw new ApplicationException("Ошибка данныx.");
                
            }
            finally
            {
                con.Close();
            }
        }

        public void DeleteTur(int t_bazaID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("DeleteTur", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@t_bazaID", SqlDbType.Int, 6));
            cmd.Parameters["@t_bazaID"].Value = t_bazaID;

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

        public void UpdateTur(int t_bazaID, string name, string way, string address,
            string email, string phone, string siteurl, string about, string fio, string dolgn, int agent)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("UpdateTur", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@t_bazaID", SqlDbType.Int, 4));
            cmd.Parameters["@t_bazaID"].Value = t_bazaID;
            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 150));
            cmd.Parameters["@name"].Value = name;
            cmd.Parameters.Add(new SqlParameter("@way", SqlDbType.NVarChar, 200));
            cmd.Parameters["@way"].Value = way;
            cmd.Parameters.Add(new SqlParameter("@address", SqlDbType.NVarChar, 200));
            cmd.Parameters["@address"].Value = address;
            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50));
            cmd.Parameters["@email"].Value = email;
            cmd.Parameters.Add(new SqlParameter("@phone", SqlDbType.NVarChar, 20));
            cmd.Parameters["@phone"].Value = phone;
            cmd.Parameters.Add(new SqlParameter("@siteurl", SqlDbType.NVarChar, 50));
            cmd.Parameters["@siteurl"].Value = siteurl;
            cmd.Parameters.Add(new SqlParameter("@fio", SqlDbType.NVarChar, 150));
            cmd.Parameters["@fio"].Value = fio;
            cmd.Parameters.Add(new SqlParameter("@dolgn", SqlDbType.NVarChar, 50));
            cmd.Parameters["@dolgn"].Value = dolgn;
            cmd.Parameters.Add(new SqlParameter("@about", SqlDbType.NVarChar, 200));
            cmd.Parameters["@about"].Value = about;
            cmd.Parameters.Add(new SqlParameter("@agent", SqlDbType.Int, 3));
            cmd.Parameters["@agent"].Value = agent;
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
        public void UpdateAgent(int t_bazaID,int agent)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Update tbaza set agent = @agent where t_bazaID=@t_bazaID", con);
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.Add(new SqlParameter("@t_bazaID", SqlDbType.Int, 4));
            cmd.Parameters["@t_bazaID"].Value = t_bazaID;
            
            cmd.Parameters.Add(new SqlParameter("@agent", SqlDbType.Int, 3));
            cmd.Parameters["@agent"].Value = agent;
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

        public List<t_baza> GetAllTurs()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetAllTurs", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Создать коллекцию для всех записей 
            List<t_baza> t_bazas = new List<t_baza>();
            t_baza b = new t_baza(0, "", "", "", "", "", "", "","","", 0);
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    t_baza emp = new t_baza(
                    (int)reader["t_bazaID"],
                    (string)reader["name"],
                    (string)reader["way"],
                    (string)reader["address"],
                    (string)reader["email"],
                    (string)reader["phone"],
                    (string)reader["siteurl"],
                    (string)reader["about"],
                    (string)reader["fio"],
                    (string)reader["dolgn"],
                    (int)reader["agent"]);

                    t_bazas.Add(emp);
                }
                reader.Close();
                return t_bazas;
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
        public t_baza GetTur(int turid)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetTur", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@turid", SqlDbType.Int, 6));
            cmd.Parameters["@turid"].Value = turid; 
            
            t_baza t_bazas = new t_baza();

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
               
                    t_bazas.T_bazaID = turid;
                    t_bazas.Name = (string)reader["name"];
                    t_bazas.Way = (string)reader["way"];
                    t_bazas.Address = (string)reader["address"];
                    t_bazas.Email = (string)reader["email"];
                    t_bazas.Phone = (string)reader["phone"];
                    t_bazas.Siteurl = (string)reader["siteurl"];
                    t_bazas.About = (string)reader["about"];
                    t_bazas.Fio = (string)reader["fio"];
                    t_bazas.Dolgn = (string)reader["dolgn"];
                    t_bazas.Agent = (int)reader["agent"];

                    
                
                reader.Close();
                return t_bazas;
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
    }
}
