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


namespace turist.App_Code.Pay
{
    public class discountcard
    {
        public discountcard() { }
        public discountcard(int id, string number, int idpeople, int idorganization, int discount) 
        {
            this.id = id;
            this.number = number;
            this.idpeople = idpeople;
            this.idorganization = idorganization;
            this.discount = discount;

        }

        private int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string number;
        public string Number
        {
            get { return number; }
            set { number = value; }
        }

        private int idpeople;
        public int IDpeople
        {
            get { return idpeople; }
            set { idpeople = value; }
        }

        private int idorganization;
        public int IDorganization
        {
            get { return idorganization; }
            set { idorganization = value; }
        }

        private int discount;
        public int Discount
        {
            get { return discount; }
            set { discount = value; }
        }
    } // Класс дисконтные карты
    public class discountcardtypeid
    {
        public discountcardtypeid() { }
        public discountcardtypeid(int id, string number, int idpeople, int idorganization, int idtypediscount)
        {
            this.id = id;
            this.number = number;
            this.idpeople = idpeople;
            this.idorganization = idorganization;
            this.idtypediscount = idtypediscount;

        }

        private int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string number;
        public string Number
        {
            get { return number; }
            set { number = value; }
        }

        private int idpeople;
        public int IDpeople
        {
            get { return idpeople; }
            set { idpeople = value; }
        }

        private int idorganization;
        public int IDorganization
        {
            get { return idorganization; }
            set { idorganization = value; }
        }

        private int idtypediscount;
        public int Idtypediscount
        {
            get { return idtypediscount; }
            set { idtypediscount = value; }
        }
    } // Класс дисконтные карты ссылка на тип
    public class typediscountcard
    {
        public typediscountcard() { }
        public typediscountcard(int id, int discount, int coundition)
        {
            this.id = id;
            this.coundition = coundition;
            this.discount = discount;

        }

        private int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private int coundition;
        public int Coundition
        {
            get { return coundition; }
            set { coundition = value; }
        }

        private int discount;
        public int Discount
        {
            get { return discount; }
            set { discount = value; }
        }
    } //Класс типы дисконтных карт

    public class Pay
    {
        private string connectionString;
        public Pay()
        {
            // Извлечь из файла web.config строку соединения по умолчанию
            connectionString = WebConfigurationManager.
                ConnectionStrings["mssqltur"].ConnectionString;
        }
        public Pay(string connectionStringCustom)
        {
            // Извлечь из файла web.config другую строку соединения
            connectionString = WebConfigurationManager.
                ConnectionStrings[connectionStringCustom].ConnectionString;
        }
        public int AddTypeDiscount(typediscountcard emp1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insert into TypeDiscountCard(discount, coundition) values (@discount,@coundition) SET @id = @@IDENTITY ", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@discount", SqlDbType.Int, 3));
            cmd.Parameters["@discount"].Value = emp1.Discount;
            cmd.Parameters.Add(new SqlParameter("@coundition", SqlDbType.Int, 6));
            cmd.Parameters["@coundition"].Value = emp1.Coundition;
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
                throw new ApplicationException("Ошибка данныx. добавление типа дисконта");

            }
            finally
            {
                con.Close();
            }
        } //добавить тип дисконтной карты
        public void DeleteTypeDiscount(int typediscount)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Delete from TypeDiscountCard where TypeDiscountCard.id = @id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Value = typediscount;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Удаление типа дисконта");
            }
            finally
            {
                con.Close();
            }
        } //удалить тип
        public List<typediscountcard> GetAllTypeDiscount()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT id, discount,  coundition FROM TypeDiscountCard", con);
            cmd.CommandType = CommandType.Text;

            // Создать коллекцию для всех записей 
            List<typediscountcard> list = new List<typediscountcard>();
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    typediscountcard emp = new typediscountcard(
                    (int)reader["id"],
                    (int)reader["discount"],
                    (int)reader["coundition"]);

                    list.Add(emp);
                }
                reader.Close();
                return list;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. вернуть все типы дисконтов");
            }
            finally
            {
                con.Close();
            }
        } //Вывод всех типов дисконт
        public int AddDiscountCard(discountcardtypeid emp1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Insert into discountcard(number, idpeople, idorganization, idtypediscountcard) values (@number, @idpeople, @idorganization, @idtypediscountcard) SET @id = @@IDENTITY ", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@number", SqlDbType.NVarChar, 50));
            cmd.Parameters["@number"].Value = emp1.Number;
            cmd.Parameters.Add(new SqlParameter("@idpeople", SqlDbType.Int, 6));
            cmd.Parameters["@idpeople"].Value = emp1.IDpeople;
            cmd.Parameters.Add(new SqlParameter("@idorganization", SqlDbType.Int, 6));
            cmd.Parameters["@idorganization"].Value = emp1.IDorganization;
            cmd.Parameters.Add(new SqlParameter("@idtypediscountcard", SqlDbType.Int, 6));
            cmd.Parameters["@idtypediscountcard"].Value = emp1.Idtypediscount;
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
                throw new ApplicationException("Ошибка данныx. добавление дисконтной карты");

            }
            finally
            {
                con.Close();
            }
        } //добавить дисконтную карту
        public void DeleteDiscountCard(int discountcard)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Delete from discountcard where discountcard.id = @id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 6));
            cmd.Parameters["@id"].Value = discountcard;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. Удаление дисконта");
            }
            finally
            {
                con.Close();
            }
        } //удалить дисконтную карту
        public List<discountcard> GetAllDiscountCard()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT id, number,idpeople,idorganization,idtypediscountcard FROM discountcard", con);
            cmd.CommandType = CommandType.Text;

            // Создать коллекцию для всех записей 
            List<discountcard> list = new List<discountcard>();
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    discountcard emp = new discountcard(
                    (int)reader["id"],
                    (string)reader["number"],
                    (int)reader["idpeople"],
                    (int)reader["idorganization"],
                    (int)reader["idtypediscountcard"]);

                    list.Add(emp);
                }
                reader.Close();
                return list;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. вернуть все дисконты");
            }
            finally
            {
                con.Close();
            }
        } //Вывод всех дисконтов
        public int GetDiscountClient(int clientid)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT discount FROM TypeDiscountCard where (discountcard.idpeople = @id or discountcard.idorganization = @id) and discountcard.idtypediscountcard = TypeDiscountCard.id", con);
            cmd.CommandType = CommandType.Text;
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                int discount = 0;
                discount = (int)reader["discount"];
                reader.Close();
                return discount;
            }
            catch
            {
                throw new ApplicationException("Ошибка данныx. вернуть скидку клиента");
            }
            finally
            {
                con.Close();
            }
        } //Вывод скидки клиента
       
    }
}