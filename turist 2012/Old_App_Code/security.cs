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
using System.Security.Cryptography;
using System.Text;


namespace turist.App_Code.security
{
    public class security
    {
        private string connectionString;
        public security()
        {
            // Извлечь из файла web.config строку соединения по умолчанию
            connectionString = WebConfigurationManager.
                ConnectionStrings["mssqltur"].ConnectionString;
        }
        public security(string connectionStringCustom)
        {
            // Извлечь из файла web.config другую строку соединения
            connectionString = WebConfigurationManager.
                ConnectionStrings[connectionStringCustom].ConnectionString;
        }

        public int peopleautho(string email, string password)
        {
            int id;

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT peopleID FROM people WHERE people.email = @email and people.id = peoplepassword.peopleid and peoplepassword.password = @password", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50));
            cmd.Parameters["@email"].Value = email;
            cmd.Parameters.Add(new SqlParameter("@password", SqlDbType.NVarChar, 260));
            cmd.Parameters["@password"].Value = md5hash(password);
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                id = (int)reader["peopleID"];
                con.Close();
                return id;
            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }
        public int memberautho(string email, string password)
        {
            int id;

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT memberID FROM member WHERE member.email = @email and member.id = memberpassword.memberid and memberpassword.password = @password", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50));
            cmd.Parameters["@email"].Value = email;
            cmd.Parameters.Add(new SqlParameter("@password", SqlDbType.NVarChar, 260));
            cmd.Parameters["@password"].Value = md5hash(password);
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                id = (int)reader["memberID"];
                con.Close();
                return id;
            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }
        public int menedgerautho(string email, string password)
        {
            int id;

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT id FROM people WHERE turmenedger.email = @email and turmenedger.id = menedgerpassword.menedgerid and menedgerpassword.password = @password", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50));
            cmd.Parameters["@email"].Value = email;
            cmd.Parameters.Add(new SqlParameter("@password", SqlDbType.NVarChar, 260));
            cmd.Parameters["@password"].Value = md5hash(password);
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                id = (int)reader["id"];
                con.Close();
                return id;
            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }
        public string md5hash(string input)
        {
            try
            {
                MD5 md5Hasher = MD5.Create();

                // Преобразуем входную строку в массив байт и вычисляем хэш
                byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));

                // Создаем новый Stringbuilder (Изменяемую строку) для набора байт
                StringBuilder sBuilder = new StringBuilder();

                // Преобразуем каждый байт хэша в шестнадцатеричную строку
                for (int i = 0; i <= data.Length; i++)
                {
                    //указывает, что нужно преобразовать элемент в шестнадцатиричную строку длиной в два символа
                    sBuilder.Append(data[i].ToString("x2"));
                }
                return sBuilder.ToString();
            }
            catch
            {
                return "хрентебеанепароль";
            }
           
        } //hash password

    }
}
