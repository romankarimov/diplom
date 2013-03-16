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
    public class MemberDB
    {
        private string connectionString;

        public MemberDB()
        {
            // Извлечь из файла web.config строку соединения по умолчанию
            connectionString = WebConfigurationManager.
                ConnectionStrings["mssqltur"].ConnectionString;
        }

        public MemberDB(string connectionStringCustom)
        {
            // Извлечь из файла web.config другую строку соединения
            connectionString = WebConfigurationManager.
                ConnectionStrings[connectionStringCustom].ConnectionString;
        }

        /* public member ValidateUser(string login, string passwd)
         {
             SqlConnection con = new SqlConnection(connectionString);
             SqlCommand cmd = new SqlCommand("ValidateUser", con);
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Parameters.Add(new SqlParameter("@login", SqlDbType.NVarChar, 30));
             cmd.Parameters["@login"].Value = login;
             cmd.Parameters.Add(new SqlParameter("@passwd", SqlDbType.NVarChar, 20));
             cmd.Parameters["@passwd"].Value = passwd;
             try
             {
                 con.Open();
                 SqlDataReader reader = cmd.ExecuteReader();
                 member emp = new member(
                     (int)reader["memberID"],
                     (string)reader["fio"],
                     (string)reader["login"],
                     (string)reader["passwd"],
                     (string)reader["email"],
                     (string)reader["phone"],
                     (int)reader["dolgn"]);
                
                 reader.Close();
                 return emp;
             }
             catch
             {
                 throw new ApplicationException("Ошибка данныx Проверка пользователя");
             }
             finally
             {
                 con.Close();
             }
         }*/

        public int InsertMember(member emp1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insert into member(fio,role,email,phone) values (@fio,@role,@email,@phone) SET @id = @@IDENTITY ", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@fio", SqlDbType.NVarChar, 150));
            cmd.Parameters["@fio"].Value = emp1.Fio;
            cmd.Parameters.Add(new SqlParameter("@role", SqlDbType.Int, 6));
            cmd.Parameters["@role"].Value = emp1.Role;
            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50));
            cmd.Parameters["@email"].Value = emp1.Email;
            cmd.Parameters.Add(new SqlParameter("@phone", SqlDbType.NVarChar, 20));
            cmd.Parameters["@phone"].Value = emp1.Phone;
            cmd.Parameters.Add(new SqlParameter("@memberID", SqlDbType.Int, 6));
            cmd.Parameters["@memberID"].Direction = ParameterDirection.Output;




            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["@memberID"].Value;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Добавление сотрудника");
            }
            finally
            {
                con.Close();
            }
        }
        public int InsertMenedger(menedger emp1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insert into turmenedger(fio,idturoperator,email,phone) values (@fio,@idturoperator,@email,@phone) SET @memberID = @@IDENTITY ", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@fio", SqlDbType.NVarChar, 150));
            cmd.Parameters["@fio"].Value = emp1.Fio;
            cmd.Parameters.Add(new SqlParameter("@idturoperator", SqlDbType.Int, 6));
            cmd.Parameters["@idturoperator"].Value = emp1.Idturoperator;
            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50));
            cmd.Parameters["@email"].Value = emp1.Email;
            cmd.Parameters.Add(new SqlParameter("@phone", SqlDbType.NVarChar, 20));
            cmd.Parameters["@phone"].Value = emp1.Phone;
            cmd.Parameters.Add(new SqlParameter("@memberID", SqlDbType.Int, 6));
            cmd.Parameters["@memberID"].Direction = ParameterDirection.Output;




            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["@memberID"].Value;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Добавление сотрудника туроператора");
            }
            finally
            {
                con.Close();
            }
        }

        public member GetMember(int id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Select fio, role, email, phone from member where member.id = @id", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Value = id;

            member member = new member();

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                member.Fio = (string)reader["fio"];
                member.Role = (int)reader["role"];
                member.Email = (string)reader["email"];
                member.Phone = (string)reader["phone"];

                reader.Close();
                return member;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Вывод сотрудника");
            }
            finally
            {
                con.Close();
            }
        }
        public string GetMemberRole(int id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Select name from role where member.id = @id and member.role = role.id", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Value = id;

            

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                string role = (string)reader["name"];
                

                reader.Close();
                return role;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx.  Возвращение должности");
            }
            finally
            {
                con.Close();
            }
        }
        public menedger GetMenedger(int id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Select fio, idturoperator, email, phone from menedger where menedger.id = @id", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Value = id;

            menedger menedger = new menedger();

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                menedger.Fio = (string)reader["fio"];
                menedger.Idturoperator = (int)reader["idturoperator"];
                menedger.Email = (string)reader["email"];
                menedger.Phone = (string)reader["phone"];

                reader.Close();
                return menedger;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Вывод сотрудника");
            }
            finally
            {
                con.Close();
            }
        }





    }
}
