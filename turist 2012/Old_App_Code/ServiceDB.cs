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
    public class cervice
    {
        public cervice(int serviceID, string name, int cost,
           string comment)
        {
            this.serviceID = serviceID;
            this.name = name;
            this.cost = cost;
            this.comment = comment;

        }
        public cervice() { }

        private int serviceID;
        public int ServiceID
        {
            get { return serviceID; }
            set { serviceID = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private int cost;
        public int Cost
        {
            get { return cost; }
            set { cost = value; }
        }

        private string comment;
        public string Comment
        {
            get { return comment; }
            set { comment = value; }
        }
    }

    public class serviceDB
    {
        private string connectionString;

        public serviceDB()
        {
            // Извлечь из файла web.config строку соединения по умолчанию
            connectionString = WebConfigurationManager.
                ConnectionStrings["mssqltur"].ConnectionString;
        }

        public serviceDB(string connectionStringCustom)
        {
            // Извлечь из файла web.config другую строку соединения
            connectionString = WebConfigurationManager.
                ConnectionStrings[connectionStringCustom].ConnectionString;
        }

        public int InsertService(cervice emp1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insertservice", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 50));
            cmd.Parameters["@name"].Value = emp1.Name;
            cmd.Parameters.Add(new SqlParameter("@cost", SqlDbType.Int, 6));
            cmd.Parameters["@cost"].Value = emp1.Cost;
            cmd.Parameters.Add(new SqlParameter("@comment", SqlDbType.NVarChar, 200));
            cmd.Parameters["@comment"].Value = emp1.Comment;
            cmd.Parameters.Add(new SqlParameter("@serviceID", SqlDbType.Int, 6));
            cmd.Parameters["@serviceID"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["@serviceID"].Value;
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

        public void InsertServiceInTur(int service, int tur)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("InsertServiceInTur", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@serviceid", SqlDbType.Int, 10));
            cmd.Parameters["@serviceid"].Value = service;
            cmd.Parameters.Add(new SqlParameter("@turid", SqlDbType.Int, 10));
            cmd.Parameters["@turid"].Value = tur;
            
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

        public void InsertServiceInOrder(int service, int order)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("InsertServiceOrder", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@serviceid", SqlDbType.Int, 10));
            cmd.Parameters["@serviceid"].Value = service;
            cmd.Parameters.Add(new SqlParameter("@orderid", SqlDbType.Int, 10));
            cmd.Parameters["@orderid"].Value = order;

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
        public void DeleteService(int serviceID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Deleteservice", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@serviceID", SqlDbType.Int, 4));
            cmd.Parameters["@serviceID"].Value = serviceID;

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

        public void UpdateService(int serviceID, string name, int cost,
            string comment)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Updateservice", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@serviceID", SqlDbType.Int, 4));
            cmd.Parameters["@serviceID"].Value = serviceID;
            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 10));
            cmd.Parameters["@name"].Value = name;
            cmd.Parameters.Add(new SqlParameter("@cost", SqlDbType.NVarChar, 20));
            cmd.Parameters["@cost"].Value = cost;
            cmd.Parameters.Add(new SqlParameter("@comment", SqlDbType.NVarChar, 25));
            cmd.Parameters["@comment"].Value = comment;

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

        public List<cervice> GetAllServices()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetAllservices", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Создать коллекцию для всех записей 
            List<cervice> services = new List<cervice>();

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    cervice emp = new cervice(
                    (int)reader["serviceID"],
                    (string)reader["name"],
                    (int)reader["cost"],
                    (string)reader["comment"]);
                    services.Add(emp);
                }
                reader.Close();
                return services;
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
        public List<cervice> GetServicesTur(int turID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetServicesByTur", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@tur", SqlDbType.Int, 4));
            cmd.Parameters["@tur"].Value = turID;
            // Создать коллекцию для всех записей 
            List<cervice> services = new List<cervice>();

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    cervice emp = new cervice(
                    (int)reader["serviceID"],
                    (string)reader["name"],
                    (int)reader["cost"],
                    "");
                    services.Add(emp);
                }
                reader.Close();
                return services;
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
        public List<cervice> GetServicesOrder(int turID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetOrderServices", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@orderID", SqlDbType.Int, 4));
            cmd.Parameters["@orderID"].Value = turID;
            // Создать коллекцию для всех записей 
            List<cervice> services = new List<cervice>();

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    cervice emp = new cervice(
                    (int)reader["serviceID"],
                    (string)reader["name"],
                    (int)reader["cost"],
                    "");
                    services.Add(emp);
                }
                reader.Close();
                return services;
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
        public List<cervice> GetServicesTurCost(int turID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetServicesByTur", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@tur", SqlDbType.Int, 4));
            cmd.Parameters["@tur"].Value = turID;
            // Создать коллекцию для всех записей 
            List<cervice> services = new List<cervice>();

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    cervice emp = new cervice(
                    (int)reader["serviceID"],
                    (string)reader["name"] + " Цена:" + Convert.ToString((int)reader["cost"]),
                    (int)reader["cost"],
                    "");
                    services.Add(emp);
                }
                reader.Close();
                return services;
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
        
    }
}
