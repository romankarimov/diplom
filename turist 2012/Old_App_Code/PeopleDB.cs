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
    public class PeopleDB
    {
         private string connectionString;

            public PeopleDB()
            {
                // Извлечь из файла web.config строку соединения по умолчанию
                connectionString = WebConfigurationManager.
                    ConnectionStrings["mssqltur"].ConnectionString;
                //connectionString = WebConfigurationManager.defaultConnectionStringName.ConnectionString;
            }

            public PeopleDB(string connectionStringCustom)
            {
                // Извлечь из файла web.config другую строку соединения
                connectionString = WebConfigurationManager.
                    ConnectionStrings[connectionStringCustom].ConnectionString;
            }

            public int Insertpeople(tpeople emp1)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("Insertpeople", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Fio", SqlDbType.NVarChar, 150));
                cmd.Parameters["@Fio"].Value = emp1.Fio;
                cmd.Parameters.Add(new SqlParameter("@FioLat", SqlDbType.NVarChar, 150));
                cmd.Parameters["@FioLat"].Value = emp1.FioLat;
                cmd.Parameters.Add(new SqlParameter("@Sex", SqlDbType.NVarChar,1));
                cmd.Parameters["@Sex"].Value = emp1.Sex;
                cmd.Parameters.Add(new SqlParameter("@Address", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Address"].Value = emp1.Address;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Email"].Value = emp1.Email;
                cmd.Parameters.Add(new SqlParameter("@Phone", SqlDbType.NVarChar, 20));
                cmd.Parameters["@Phone"].Value = emp1.Phone;
                cmd.Parameters.Add(new SqlParameter("@Birthday", SqlDbType.NVarChar, 10));
                cmd.Parameters["@Birthday"].Value = emp1.Birthday;
                cmd.Parameters.Add(new SqlParameter("@Seriapasp", SqlDbType.NVarChar, 10));
                cmd.Parameters["@Seriapasp"].Value = emp1.Seriapasp;
                cmd.Parameters.Add(new SqlParameter("@Seriazpasp", SqlDbType.NVarChar, 10));
                cmd.Parameters["@Seriazpasp"].Value = emp1.Seriazpasp;
                cmd.Parameters.Add(new SqlParameter("@Numberpasp", SqlDbType.NVarChar, 10));
                cmd.Parameters["@Numberpasp"].Value = emp1.Numberpasp;
                cmd.Parameters.Add(new SqlParameter("@Numberzpasp", SqlDbType.NVarChar, 10));
                cmd.Parameters["@Numberzpasp"].Value = emp1.Numberzpasp;
                cmd.Parameters.Add(new SqlParameter("@Whopasp", SqlDbType.NVarChar, 150));
                cmd.Parameters["@Whopasp"].Value = emp1.Whopasp;
                cmd.Parameters.Add(new SqlParameter("@Whozpasp", SqlDbType.NVarChar, 150));
                cmd.Parameters["@Whozpasp"].Value = emp1.Whozpasp;
                cmd.Parameters.Add(new SqlParameter("@Wherepasp", SqlDbType.NVarChar, 10));
                cmd.Parameters["@Wherepasp"].Value = emp1.Wherepasp;
                cmd.Parameters.Add(new SqlParameter("@Wherezpasp", SqlDbType.NVarChar, 10));
                cmd.Parameters["@Wherezpasp"].Value = emp1.Wherezpasp;
                cmd.Parameters.Add(new SqlParameter("@Wherendzpasp", SqlDbType.NVarChar, 10));
                cmd.Parameters["@Wherendzpasp"].Value = emp1.Wherendzpasp;
                cmd.Parameters.Add(new SqlParameter("@peopleID", SqlDbType.Int, 6));
                cmd.Parameters["@peopleID"].Direction = ParameterDirection.Output;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    return (int)cmd.Parameters["@peopleID"].Value;
                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx. добавление физ лица");
                }
                finally
                {
                    con.Close();
                }
            }
            public int AddFotoPeople(fotopeople emp1)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("Insert into fpeople(idpeople,path,comment) values (@idpeople, @path, @comment) set @id = @@IDENTITY", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add(new SqlParameter("@idpeople", SqlDbType.Int, 6));
                cmd.Parameters["@idpeople"].Value = emp1.Idpeople;
                cmd.Parameters.Add(new SqlParameter("@path", SqlDbType.NVarChar, 200));
                cmd.Parameters["@path"].Value = emp1.Path;
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
                    throw new ApplicationException("Ошибка данныx. Добавление фото физ лица");
                }
                finally
                {
                    con.Close();
                }
            }

            public void DeletePeople(int peopleID)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("DeletePeople", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@peopleID", SqlDbType.Int, 4));
                cmd.Parameters["@peopleID"].Value = peopleID;

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

            public int CountPeoples()
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("CountPeoples", con);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    con.Open();
                    return (int)cmd.ExecuteScalar();
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
            public int CountPeopleOrder(int order)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("CountPeopleOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@orderid", SqlDbType.Int, 6));
                cmd.Parameters["@orderid"].Value = order;
                try
                {
                    con.Open();
                    return (int)cmd.ExecuteScalar();
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
            public void UpdatePeople(int peopleID, string Fio, string FioLat,
            string Sex, string Address, string Email, string Phone, string Birthday,
            string Seriapasp, string Numberpasp, string Whopasp,
            string Wherepasp, string Seriazpasp, string Numberzpasp, string Whozpasp,
            string Wherezpasp, string Wherendzpasp)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("UpdatePeople", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Fio", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Fio"].Value =  Fio;
                cmd.Parameters.Add(new SqlParameter("@FioLat", SqlDbType.NVarChar, 50));
                cmd.Parameters["@FioLat"].Value =  FioLat;
                cmd.Parameters.Add(new SqlParameter("@Sex", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Sex"].Value =  Sex;
                cmd.Parameters.Add(new SqlParameter("@Address", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Address"].Value =  Address;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Email"].Value =  Email;
                cmd.Parameters.Add(new SqlParameter("@Phone", SqlDbType.NVarChar, 20));
                cmd.Parameters["@Phone"].Value =  Phone;
                cmd.Parameters.Add(new SqlParameter("@Birthday", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Birthday"].Value =  Birthday;
                cmd.Parameters.Add(new SqlParameter("@Seriapasp", SqlDbType.NVarChar, 150));
                cmd.Parameters["@Seriapasp"].Value =  Seriapasp;
                cmd.Parameters.Add(new SqlParameter("@Seriazpasp", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Seriazpasp"].Value =  Seriazpasp;
                cmd.Parameters.Add(new SqlParameter("@Numberpasp", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Numberpasp"].Value =  Numberpasp;
                cmd.Parameters.Add(new SqlParameter("@Numberzpasp", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Numberzpasp"].Value =  Numberzpasp;
                cmd.Parameters.Add(new SqlParameter("@Whopasp", SqlDbType.NVarChar, 20));
                cmd.Parameters["@Whopasp"].Value =  Whopasp;
                cmd.Parameters.Add(new SqlParameter("@Whozpasp", SqlDbType.NVarChar, 100));
                cmd.Parameters["@Whozpasp"].Value =  Whozpasp;
                cmd.Parameters.Add(new SqlParameter("@Wherepasp", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Wherepasp"].Value =  Wherepasp;
                cmd.Parameters.Add(new SqlParameter("@Wherezpasp", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Wherezpasp"].Value =  Wherezpasp;
                cmd.Parameters.Add(new SqlParameter("@Wherendzpasp", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Wherendzpasp"].Value =  Wherendzpasp;
                cmd.Parameters.Add(new SqlParameter("@peopleID", SqlDbType.Int, 4));
                cmd.Parameters["@peopleID"].Value = peopleID;

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

            public List<tpeople> GetAllPeoples()
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("GetAllPeoples", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Создать коллекцию для всех записей 
                List<tpeople> Peoples = new List<tpeople>();
                //tpeople emp2 = new tpeople(0,"","","","","","","","","","","","","","","","");

                //Peoples.Add(emp2);
                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        tpeople emp = new tpeople(
                        (int)reader["peopleID"],
                        (string)reader["Fio"],
                        (string)reader["FioLat"],
                        (string)reader["Sex"],
                        (string)reader["Address"],
                        (string)reader["Email"],
                        (string)reader["Phone"],
                        (string)reader["Birthday"],
                        (string)reader["Seriapasp"],
                        (string)reader["Numberpasp"],
                        (string)reader["Whopasp"],
                        (string)reader["Wherepasp"],
                        (string)reader["Seriazpasp"],
                        (string)reader["Numberzpasp"],
                        (string)reader["Whozpasp"],
                        (string)reader["Wherezpasp"],
                        (string)reader["Wherendzpasp"]);
                        
                        Peoples.Add(emp);
                    }
                    reader.Close();
                    return Peoples;
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
            public tpeople GetPeople(int people)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("GetPeople", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@peopleID", SqlDbType.Int, 4));
                cmd.Parameters["@peopleID"].Value = people;
                // Создать коллекцию для всех записей 
                
                tpeople emp2 = new tpeople();

                
                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    
                        
                        emp2.Fio = (string)reader["Fio"];
                        emp2.FioLat=(string)reader["FioLat"];
                        emp2.Sex=(string)reader["Sex"];
                        emp2.Address=(string)reader["Address"];
                        emp2.Email=(string)reader["Email"];
                        emp2.Phone= (string)reader["Phone"];
                        emp2.Birthday=(string)reader["Birthday"];
                        emp2.Seriapasp=(string)reader["Seriapasp"];
                        emp2.Numberpasp = (string)reader["Numberpasp"];
                        emp2.Whopasp=(string)reader["Whopasp"];
                        emp2.Wherepasp=(string)reader["Wherepasp"];
                        emp2.Seriazpasp = (string)reader["Seriazpasp"];
                        emp2.Numberzpasp=(string)reader["Numberzpasp"];
                        emp2.Whozpasp=(string)reader["Whozpasp"];
                        emp2.Wherezpasp=(string)reader["Wherezpasp"];
                        emp2.Wherendzpasp=(string)reader["Wherendzpasp"];

                       
                    
                    reader.Close();
                    return emp2;
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
            public void InsertPeopleInOrder(int service, int order)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("InsertPeopleOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@peopleid", SqlDbType.Int, 10));
                cmd.Parameters["@peopleid"].Value = service;
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
            public string GetFioPeople(int id)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("Select people.fio from people where peopleID = @id", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 10));
                cmd.Parameters["@id"].Value = id;
               
                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    return (string)reader["Fio"];
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

            
    }
}
